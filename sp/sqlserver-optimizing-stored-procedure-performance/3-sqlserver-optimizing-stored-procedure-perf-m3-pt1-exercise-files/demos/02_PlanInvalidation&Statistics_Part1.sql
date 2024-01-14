-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Creation, Compilation, and Invalidation
--   Demo: Plan Invalidation and Statistics - Part I
-----------------------------------------------------------------------

-- First, you'll need to restore / setup the credit database
--   Course: SQL Server: Optimizing Stored Procedure Performance
--	 Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup  
-- Open Script: CreditDemoDatabaseSetup.sql
-- Execute your modified version of this script

-- Second, setup the analysis procedures we'll use throughout 
-- the demos of this course:
--   Course: SQL Server: Optimizing Stored Procedure Performance
--	 Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup Analysis Procedures
-- Open Script: CreditDemoDatabaseSetup_AnalysisProcs.sql
-- Execute the ENTIRE script

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- This series of executions will focus on when plans
-- are invalidated by data changes (and changes to
-- statistics). We'll also see the recompilation cause. 

USE [Credit];
GO

-----------------------------------------------------
-- Procedure to use for viewing recompilation events
-----------------------------------------------------

IF OBJECTPROPERTY(OBJECT_ID(N'GetCharge'), 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetCharges];
GO

CREATE PROCEDURE [dbo].[GetCharges]
(
	@MNO	INT = NULL
)
AS
IF @MNO IS NULL
	BEGIN
		RAISERROR ('Parameter: @MNO must be a valid member_no.', 1, -1);
		RETURN;
	END;

SELECT [m].* 
FROM [dbo].[Member] AS [m]
WHERE [m].[member_no] = @MNO;

SELECT [c].[charge_dt], [c].[charge_amt]
FROM [dbo].[Charge] AS [c]
WHERE [c].[member_no] = @MNO
ORDER BY [c].[charge_dt] DESC;

SELECT [s].* 
FROM [dbo].[Statement] AS [s]
WHERE [s].[member_no] = @MNO;
GO

-----------------------------------------------------
-- Current state of plans
-----------------------------------------------------

EXEC [ProcedurePlans];
GO  -- no plans listed

-- Turn on showplan and statistics IO
SET STATISTICS IO ON;
GO

-- Execute the procedure 
EXEC [GetCharges] 1234;
GO 

-- Focus on statement 3
-- Showplan: Using an index
-- I/Os: Table 'statement'. Scan count 1, logical reads 6, ...
-- Estimated number of rows: 2
-- Actual number of rows: 2

DBCC SHOW_STATISTICS (N'statement', N'statement_member_link');
GO

-- Data patterns to note
-- Evenly distributed data... most members have a statement
-- Most members have a statement every month. Even with a 
-- whole month of changes, the distribution of data won't 
-- change.

-- Let's add up to 2K more statements (<= 10%)
INSERT [dbo].[statement]
           ([member_no]
           ,[statement_dt]
           ,[due_dt]
           ,[statement_amt])
    SELECT [c].[member_no]
        , GETDATE()
        , DATEADD(dd, 30, GETDATE())
        , SUM ([c].[charge_amt])
    FROM [dbo].[charge] AS [c]
    WHERE [c].[member_no] <= 2000
    GROUP BY [c].[member_no];
GO

SELECT * 
FROM [sys].[dm_db_stats_properties] (OBJECT_ID(N'statement'), 2);
GO  -- shows that they KNOW how many rows have changed
    -- it's NOT OVER the threshold of 20% (plus min of 500)
    -- Invalidation threshold = (n * 20%) = 4000 + 500 = 4500
    -- Modification_counter = 1184 (or just under 6%)

EXEC [GetCharges] 1234;
GO  
-- Plan doesn't change; estimate didn't change
-- Focus on statement 3
-- Showplan: Using an index
-- I/Os: Table 'statement'. Scan count 1, logical reads 6, ...
-- Estimated number of rows: 2
-- Actual number of rows: 3


EXEC [ProcedurePlans];
GO	-- We can confirm that here:
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  2	                1	            2
    --  2	                1	            2
    --  2	                1	            2


-- Did the stats get updated
DBCC SHOW_STATISTICS (N'statement', N'statement_member_link');
GO  -- No, still an old date (from backup)

-- Let's update the other 8K statements 
-- (one for every remaining member)
INSERT [dbo].[statement]
           ([member_no]
           ,[statement_dt]
           ,[due_dt]
           ,[statement_amt])
    SELECT [c].[member_no]
        , GETDATE()
        , DATEADD(dd, 30, GETDATE())
        , SUM ([c].[charge_amt])
    FROM [dbo].[charge] AS [c]
    WHERE [c].[member_no] > 2000
    GROUP BY [c].[member_no];
GO

SELECT * 
FROM [sys].[dm_db_stats_properties] (OBJECT_ID(N'statement'), 2);
GO  -- shows that they KNOW how many rows have changed
    -- it's OVER the threshold of 20% (plus min of 500)
    -- Invalidation threshold = (n * 20%) = 4000 + 500 = 4500
    -- Modification_counter = 9114 (or just under 50% of 20K)

EXEC [GetCharges] 1234;
GO  
-- Plan doesn't change BUT notice the estimate does
-- Focus on statement 3
-- Showplan: Using an index
-- I/Os: Table 'statement'. Scan count 1, logical reads 6, ...
-- Estimated number of rows: 2.65429
-- Actual number of rows: 3

-- Where did that estimate come from:
DBCC SHOW_STATISTICS (N'statement', N'statement_member_link');
GO

-- Confirm the new plan:
EXEC [ProcedurePlans];
GO	-- Notice that statement 3 got a new plan
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  3	                1	            3
    --  3	                1	            3
    --  3	                *2*	            *1*

-- Verify the recompilation reason
EXEC [dbo].[RecompileEvents];
GO  -- Now, you see a "Statistics changed" event


-----------------------------------------------------
-- We won't use this in the next demo, we can
-- STOP / DROP the XE_Recompiles session
-----------------------------------------------------

IF (SELECT COUNT(*) 
    FROM [sys].[dm_xe_sessions] AS [xes]
    WHERE [xes].[name] = N'XE_Recompiles') = 1

BEGIN
    ALTER EVENT SESSION [XE_Recompiles]
	ON SERVER
	STATE = STOP;

    DROP EVENT SESSION [XE_Recompiles]
    ON SERVER;
END;
GO
