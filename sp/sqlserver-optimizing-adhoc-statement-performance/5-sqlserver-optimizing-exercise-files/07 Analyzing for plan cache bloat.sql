-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Demo: Analyzing for Plan Cache Pollution
-----------------------------------------------------------------

-- First, run the Sample Database Setup script for Credit
-- Script: CreditDemoDatabaseSetup.sql

-- Second, run the script to setup the queries we'll run
-- often as simple procs (to simplify these scripts)
-- Script: CommonQueriesAsProcs.sql

USE [Credit];
GO

----------------------------------
--   Demo: Analyzing for Plan Cache Pollution
----------------------------------

-- Some quick setup for later searches
UPDATE [member]	
SET [lastname] = 'Tripp' 
WHERE [member_no] = 1234;
GO

CREATE INDEX [MemberLastName]
ON [dbo].[member] ([lastname]);
GO

-- Clear the cache to see JUST the impact
-- of our statements

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAll.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- This script helps to determine how much of your cache is
-- dedicated to plans that are only used once. The key is to 
-- understanding if/when you need the new 2008 config option 
-- "optimize for adhoc workloads." 
			
-- First, verify the state of your cache... 
-- Slide: Verifying the State of Plan Cache (1)

-- Is your cache filled with "USE Count 1" plans?
EXEC [CheckForPlanCachePollution];
GO

-- Here are your top 100 Adhoc statements
-- by size in bytes
SELECT TOP (100) [st].[text]
	, [cp].[size_in_bytes]
	, [cp].[plan_handle]
FROM [sys].[dm_Exec_cached_plans] AS [cp]
    CROSS APPLY [sys].[dm_exec_sql_text]
		 ([cp].[plan_handle]) AS [st]
WHERE [cp].[objtype] = N'Adhoc' 
    AND [cp].[usecounts] = 1
ORDER BY [cp].[size_in_bytes] DESC;
GO

-- Look at the patterns across all statements 
-- (usable because we cleared the cache)
SELECT [st].[text]
	, [cp].[size_in_bytes]
	, [cp].[plan_handle]
FROM [sys].[dm_Exec_cached_plans] AS [cp]
    CROSS APPLY [sys].[dm_exec_sql_text]
		 ([cp].[plan_handle]) AS [st]
WHERE [cp].[objtype] = N'Adhoc' 
    AND [cp].[usecounts] = 1
ORDER BY [cp].[size_in_bytes] DESC;
GO

-- For comparisons against our fixes (in the next few demos)
-- Fill in the numbers in the spreadsheet

EXEC [GetDemoQueryTimes];
GO

