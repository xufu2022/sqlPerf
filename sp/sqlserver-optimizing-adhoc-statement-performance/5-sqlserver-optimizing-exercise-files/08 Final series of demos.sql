-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Demo: Reducing Plan Cache Pollution, CPU, and PSP
-----------------------------------------------------------------

----------------------------------
-- MUST BE RUN AFTER THE PRIOR DEMO
--   Demo: Analyzing for Plan Cache Pollution
----------------------------------

USE [Credit];
GO

----------------------------------
--   Demo: Part I
----------------------------------

-- Change the server-wide setting for
-- optimize for ad hoc workloads

-- review "value in use"
SELECT [sc].* 
FROM [sys].[configurations] AS [sc]
WHERE [sc].[name] = N'optimize for ad hoc workloads';
GO

EXEC [sp_configure] N'optim', 1;
-- Actual option: 'optimize for ad hoc workloads'
-- NOTE: sp_configure only needs enough of the option
-- to make it unique.
GO

RECONFIGURE;
GO

-- Clear the cache to see JUST the impact
-- of our statements

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAll.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- First, how much memory have we wasted with single-use
-- plans?

-- Is your cache filled with "USE Count 1" plans?
EXEC [CheckForPlanCachePollution];
GO

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

/* ********************************
-- EXECUTE THE ScriptRunAll.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- Is your cache filled with "USE Count 1" plans?
EXEC [CheckForPlanCachePollution];
GO

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

-- Only helps with single-use plans but this 
-- should help many workloads!

-- Now what?

-- Let's evaluate each query type:
-- Query 02
-- This is a statement that varies because of the
-- WHERE clause

-- Copy over the sample queries
SELECT 'Query 02', [m].[lastname], [m].[firstname],
	[m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Abbas'; 

SELECT 'Query 02', [m].[lastname], [m].[firstname],
	[m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'ANDERSON'; 

-- Can you tune them?
CREATE INDEX [Covering] 
ON [dbo].[Member] ([lastname], [firstname])
INCLUDE ([phone_no], [region_no]);
GO

SELECT 'Query 02', [m].[lastname], [m].[firstname],
	[m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m]  WITH (INDEX (0))
WHERE [m].[lastname] = 'ANDERSON'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname],
	[m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'ANDERSON';
GO

-- What changed?

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAll.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

-- Excellent!
-- Query 02 is now only one plan
--  And, it's now safe/prepared

-- Query 03 has only one plan
--  But, it's still adhoc even
--  though it's safe


----------------------------------
--   Demo: Part II
----------------------------------

-- Since we have a single query plan
-- for thousands of executions
-- AND, we can change the application...

-- We'll submit all of the Query 03 statements
-- using sp_executesql

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAllwith03a.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

----------------------------------
--   Plan Guide Template
----------------------------------

-- Since we have a single query plan
-- for thousands of executions
-- AND, we can't change the application...

-- We'll force all of the Query 04 statements
-- with a plan guide

DECLARE @SafeQuery NVARCHAR (MAX);
DECLARE @Parameters NVARCHAR (MAX);
EXEC sp_get_query_template 
	N'SELECT ''Query 04'', [m].[lastname],
	[m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = ''GOHAN'' 
	AND [m].[firstname] = ''KVRFV''
GROUP BY [m].[lastname], [m].[firstname];

',
    @SafeQuery OUTPUT, 
    @Parameters OUTPUT;
SELECT @SafeQuery, @Parameters
EXEC sp_create_plan_guide 
    N'Member+Charge: Min charge by Member Name', 
	  -- you'll want to come up with a standard naming convention
    @SafeQuery, 
    N'TEMPLATE', 
    NULL, 
    @Parameters, 
    N'OPTION (PARAMETERIZATION FORCED)';
GO

SELECT * FROM sys.plan_guides;
GO

-- If you want to remove the plan guide:
-- EXEC [sp_control_plan_guide] N'drop',
--		N'Member+Charge: Min charge by Member Name';
--GO

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAllwith03a.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

-- Not really - can we do anything else
-- about this expensive statement?

-- Copy the statement from the cache
-- Run with showplan on

SELECT 'Query 04', [m].[lastname], [m].[firstname]
	, MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BOKMCKSMLMJXDN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname]
	, MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'AIMJKWWJCPBGOH'
GROUP BY [m].[lastname], [m].[firstname];
GO

-- Review the plan, possibly rely on 
-- the "green hint" that shows up in
-- showplan?

DBCC FREEPROCCACHE;
GO

/* ********************************
-- EXECUTE THE ScriptRunAllwith03a.cmd
-- THEN COME BACK TO THIS SCRIPT
******************************** */

-- Does this change the queries at all?
EXEC [GetDemoQueryTimes];
GO

-- Final check on cache
EXEC [CheckForPlanCachePollution];
GO

----------------------------------
--   Demo: Part III
----------------------------------

-- Periodic clearing
USE [master];
GO

IF OBJECTPROPERTY (OBJECT_ID ('sp_SQLskills_CheckPlanCache'),
		'IsProcedure') = 1
	DROP PROCEDURE [sp_SQLskills_CheckPlanCache];
GO

CREATE PROCEDURE [dbo].[sp_SQLskills_CheckPlanCache]
	(@Percent	DECIMAL (6,3) OUTPUT,
	 @WastedMB	DECIMAL (19,3) OUTPUT)
AS
SET NOCOUNT ON;

DECLARE @ConfiguredMemory	DECIMAL (19,3)
	, @PhysicalMemory		DECIMAL (19,3)
	, @MemoryInUse			DECIMAL (19,3)
	, @SingleUsePlanCount	BIGINT;

CREATE TABLE #ConfigurationOptions
(
	[name]				NVARCHAR (35)
	, [minimum]			INT
	, [maximum]			INT
	, [config_value]	INT				-- in bytes
	, [run_value]		INT				-- in bytes
);
INSERT #ConfigurationOptions 
	EXEC ('sp_configure ''max server memory''');

SELECT @ConfiguredMemory 
		= [c].[run_value]/1024/1024 
FROM #ConfigurationOptions AS [c]
WHERE [c].[name] = 'max server memory (MB)'

SELECT @PhysicalMemory 
		= [omem].[total_physical_memory_kb] / 1024 
FROM [sys].[dm_os_sys_memory] AS [omem]

SELECT @MemoryInUse 
	= [pmem].[physical_memory_in_use_kb] / 1024 
FROM [sys].[dm_os_process_memory] AS [pmem]

SELECT @WastedMB 
			= SUM (CAST ((CASE 
				WHEN [cp].[usecounts] = 1 
					AND [cp].[objtype] 
						IN ('Adhoc', 'Prepared') 
				THEN [cp].[size_in_bytes] ELSE 0 END) 
					AS DECIMAL (18,2))) / 1024 / 1024 
	, @SingleUsePlanCount 
			= SUM (CASE 
				WHEN [cp].[usecounts] = 1 
					AND [cp].[objtype] 
						IN ('Adhoc', 'Prepared') 
				THEN 1 ELSE 0 END)
	, @Percent = @WastedMB/@MemoryInUse * 100
FROM [sys].[dm_exec_cached_plans] AS [cp]

SELECT	[TotalPhysicalMemory (MB)] = @PhysicalMemory
	, [TotalConfiguredMemory (MB)] = @ConfiguredMemory
	, [MaxMemoryAvailableToSQLServer (%)] =
		@ConfiguredMemory / @PhysicalMemory * 100
	, [MemoryInUseBySQLServer (MB)] = @MemoryInUse
	, [TotalSingleUsePlanCache (MB)] = @WastedMB
	, [TotalNumberOfSingleUsePlans] = @SingleUsePlanCount
	, [PercentOfConfiguredCacheWastedForSingleUsePlans (%)] 
		= @Percent
GO

EXEC [sys].[sp_MS_marksystemobject] 
	'sp_SQLskills_CheckPlanCache';
GO

-----------------------------------------------------------------
-- Next put this logic in an Agent job, set the values
-- to define when cache should be cleared, and then
-- automate it to run every so often (based on how fast 
-- your cache fills with useless single-use plans). 
-- It's an inexpensive check so checking every few hours
-- is reasonable.
-----------------------------------------------------------------

DECLARE @Percent		DECIMAL (6, 3)
		, @WastedMB		DECIMAL (19,3)
		, @StrMB		NVARCHAR (20)
		, @StrPercent	NVARCHAR (20);

EXEC [sp_SQLskills_CheckPlanCache] 
	  @Percent OUTPUT
	, @WastedMB OUTPUT;

SELECT @StrMB = CONVERT (NVARCHAR (20), @WastedMB)
		, @StrPercent = CONVERT (NVARCHAR (20), @Percent);

IF @Percent > 10 OR @WastedMB > 2000 -- 2GB
	BEGIN
		DBCC FREESYSTEMCACHE('SQL Plans') 
		RAISERROR ('%s MB (%s percent) was allocated to single-use plan cache. Single-use plans have been cleared.'
			, 10, 1, @StrMB, @StrPercent)
	END
ELSE
	BEGIN
		RAISERROR ('Only %s MB (%s percent) is allocated to single-use plan cache - no need to clear cache now.'
			, 10, 1, @StrMB, @StrPercent)
			-- Note: this is only a warning message and not an actual error.
	END;
GO

-- Blog post for more options
-- http://bit.ly/18fKtDE