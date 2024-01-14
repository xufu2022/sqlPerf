-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Creation, Compilation, and Invalidation
--   Demo: Plan Invalidation or Eviction
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

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
-- are invalidated (and therefore recompiled) as well
-- as the recompilation causes. 

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
	@MNO	int = NULL
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
-- Object-related plan invalidation
-----------------------------------------------------

EXEC [ProcedurePlans];
GO  -- no plans listed

-- Turn on showplan
-- Execute the procedure 
EXEC [GetCharges] 1234;
GO  -- clustered index scan (table scan)

EXEC [ProcedurePlans];
GO	-- All three statements show
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  1	                1	            1
    --  1	                1	            1
    --  1	                1	            1

-- Missing Index shows up in the plan
CREATE NONCLUSTERED INDEX [MissingIndexDMVsRec]
ON [dbo].[charge] ([member_no])
INCLUDE ([charge_dt], [charge_amt]);
GO

EXEC [GetCharges] 2345;
GO	-- Plan changes
	-- Also, check out compiled vs. runtime value

EXEC [ProcedurePlans];
GO	-- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  2	                1	            2
    --  2	                *2*	            *1*
    --  2	                1	            2

-- Verify the recompilation reason
EXEC [dbo].[RecompileEvents];
GO

-- Get rid of the ability for the plan to use
-- the index (another schema change)
DROP INDEX [charge].[MissingIndexDMVsRec];
GO

EXEC [GetCharges] 5678;
GO	-- Plan changes back to clustered index scan (ts)

EXEC [ProcedurePlans];
GO	-- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  3	                1	            3
    --  3	                *3*	            *1*
    --  3	                1	            3

-- Verify the recompilation reason
EXEC [dbo].[RecompileEvents];
GO  -- Now, there are two events (both schema changes)


EXEC [sp_recompile] N'Member';
GO  -- Says it was marked, this time the plan was not
    -- evicted (note: requires SCH_M lock on table)

EXEC [GetCharges] 8901;
GO	

EXEC [ProcedurePlans];
GO	-- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  4	                *4*	            1
    --  4	                3	            *2*
    --  4	                1	            4

-- Verify the recompilation reason
EXEC [dbo].[RecompileEvents];
GO  -- Now, there are three events (again, a schema change)

EXEC [sp_recompile] N'GetCharges';
GO  -- Says it was marked, instead it was evicted

EXEC [ProcedurePlans];
GO	-- Nothing in the cache...

EXEC [GetCharges] 7890;
GO	-- Plan still clustered index scan (ts)

EXEC [ProcedurePlans];
GO	-- All three statements show
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  1	                1	            1
    --  1	                1	            1
    --  1	                1	            1

-----------------------------------------------------
-- Database-related plan invalidation (eviction)
-----------------------------------------------------

-- 90   SQL Server 2005
--100   SQL Server 2008 / 2008 R2
--110   SQL Server 2012
--120   SQL Server 2014

-- To see the plan cache flush, you must change
-- this to a DIFFERENT level than current
EXEC [sp_dbcmptlevel] N'Credit'; 
GO  -- shows current level (120)

-- You'll need to set this to a different level
-- possible depending on your version of SQL Server
-- (lower or higher is fine - both will cause the
--  plan cache to flush)
EXEC [sp_dbcmptlevel] N'Credit', 110;
GO

EXEC [ProcedurePlans];
GO	-- entries are removed...

EXEC [GetCharges] 6543;
GO	-- can see the compiled value matches

EXEC [ProcedurePlans];
GO	-- All three statements show
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  1	                1	            1
    --  1	                1	            1
    --  1	                1	            1

-- Be sure to set this back to the highest value
-- possible for your database
EXEC [sp_dbcmptlevel] N'Credit', 120;
GO
-----------------------------------------------------
-- Server configuration-related plan invalidation
-----------------------------------------------------

EXEC [sp_configure] 'show advanced', 1;
GO

RECONFIGURE;
GO

EXEC [sp_configure];
GO	-- Review: cost threshold for parallelism	
	-- Running value by default is: 5
    -- Make note of YOUR value if it's different

EXEC [sp_readerrorlog];
GO

EXEC [ProcedurePlans];
GO	-- All three statements show
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  1	                1	            1
    --  1	                1	            1
    --  1	                1	            1

-- Now, we'll do a server-level change which results
-- in plan invalidation (through eviction / clearing)
-- If your value was different, be sure to CHANGE this
-- value
EXEC [sp_configure] 'cost threshold for parallelism', 10;
GO

EXEC [ProcedurePlans];
GO	-- Execution_Count = 1, Plan 1, Execute of Plan 1
	-- Wait, I thought they were going to be evicted?

EXEC [sp_readerrorlog];
GO	-- Nothing in the log (except config change)

RECONFIGURE;
GO

EXEC [sp_readerrorlog];
GO	-- Now, you see cache flushing for all three:
	--  'Object Plans' 
	--  'SQL Plans' 
	--  'Bound Trees' 

EXEC [ProcedurePlans];
GO	-- Yes, it's the RECONFIGURE that evicts not the
	-- sp_configure.

EXEC [GetCharges] 4567;
GO -- New plan...

EXEC [ProcedurePlans];
GO	-- All three statements show
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  1	                1	            1
    --  1	                1	            1
    --  1	                1	            1

-- Set it back to what it was originally
-- Default value is 5
EXEC [sp_configure] 'cost threshold for parallelism', 5;
GO

RECONFIGURE;
GO

-----------------------------------------------------
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


