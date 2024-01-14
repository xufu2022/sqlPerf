-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Create with recompile
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
-- This series of executions will focus on the pros
-- and cons of CREATE ... WITH RECOMPILE.

USE [Credit];
GO

-----------------------------------------------------
-- Original GetCharges procedures from prior
-- course module
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
-- New version of GetCharges to force recompilation 
-- for every execution using CREATE...WITH RECOMPILE
-----------------------------------------------------

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetChargesRecompile'), 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetChargesRecompile];
GO

CREATE PROCEDURE [dbo].[GetChargesRecompile]
(
	@MNO	INT = NULL
)
WITH RECOMPILE -- This forces the recompile
AS
SET NOCOUNT ON;

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
-- View the effects of using CREATE...WITH RECOMPILE
-----------------------------------------------------

EXEC [ProcedurePlans];
-- no plans listed

-- Turn on Include Actual Execution Plan (showplan)
-- Execute the procedure 
EXEC [GetChargesRecompile] 1234;
GO 

EXEC [ProcedurePlans];
GO	-- NOTHING!

-- What about JUST the statements themselves:
SELECT [st].[text]
	, [qs].[query_hash]
	, [qs].[query_plan_hash]
	, [qs].[execution_count]
	, [qs].[plan_handle]
	, [qs].[statement_start_offset]
FROM [sys].[dm_exec_query_stats] AS [qs] 
	CROSS APPLY [sys].[dm_exec_sql_text] 
                        ([qs].[sql_handle]) AS [st]
	CROSS APPLY [sys].[dm_exec_query_plan] 
                        ([qs].[plan_handle]) AS [qp]
WHERE 
    ([st].[text] LIKE '%Member%' 
        OR [st].[text] LIKE '%Charge%' 
        OR [st].[text] LIKE '%Statement%') 
ORDER BY 1, [qs].[execution_count] DESC;
GO	-- Nope, none of OUR statements!

-- Not a fan of stored procedures created with 
-- RECOMPILE as they don't "leave a trace" to
-- troubleshoot or analyze. They are eating CPU 
-- (through compilation). They are eating I/Os
-- (just through execution). And, sadly, you'll 
-- never even know they executed!

-- Do NOT use CREATE WITH RECOMPILE

EXEC [GetCharges] 1234;
GO

EXEC [ProcedurePlans];
GO

EXEC [GetCharges] 1234 WITH RECOMPILE;
GO

EXEC [ProcedurePlans];
GO -- Bummer! EXEC...WITH RECOMPILE
   -- isn't really "trackable" either

-- Verify the recompilation reason
EXEC [dbo].[RecompileEvents];
GO  -- Nope... not here either!