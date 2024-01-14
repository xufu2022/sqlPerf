-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Procedure Optimization Strategies for Recompilation
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

-- Third, setup the date-related data changes we'll use throughout 
-- this demo:
--   Course: SQL Server: Optimizing Stored Procedure Performance
--	 Module: Optimization and Recompilation
--   Demo: Credit Sample Database Setup Dates for Charges
-- Open Script: CreditDemoDatabaseSetup_ChargeDates.sql
-- Execute the ENTIRE script

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- This long / comprehensive demo walks through a variety of 
-- options for optimizing a widely-varying result set. It 
-- also factors in the troubleshooting aspects of different 
-- creation methods / strategies.

USE [Credit];
GO

CREATE PROCEDURE [dbo].[GetDateRange]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;

SELECT [c].[charge_dt] AS [Charge Date]
    , [c].[ChargeNo] AS [Charge Number]
    , [c].[member_no] AS [Member Number]
    , [c].[charge_amt] AS [Charge Amount]
FROM [dbo].[Charge] AS [c]
WHERE [c].[Charge_dt] 
    BETWEEN @StartDate AND @EndDate;
GO

-- You want to test plan stability. Is there a point where the 
-- optimal plan changes?

-- One hour
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01' WITH RECOMPILE;
GO

-- 4 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 14:01' WITH RECOMPILE;
GO

-- 8 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 18:01' WITH RECOMPILE;
GO

-- 16 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 02:01' WITH RECOMPILE;
GO

-- 24 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 10:01' WITH RECOMPILE;
GO

-- 32 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 22:01' WITH RECOMPILE;
GO

-- 48 hours
EXEC [dbo].[GetDateRange]     
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 10:01' WITH RECOMPILE;
GO

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01' WITH RECOMPILE;
GO

-- Where exactly does the plan change?
--    Somewhere between 32 and 48 hours...

-- And, might it be better to actually stabilize this
-- plan with an index?

-- I've created a separate demo to walkthrough these concepts
-- and concerns; I'd recommend that you watch it after you 
-- complete this entire demo sequence. In the course flow, 
-- it will immediately follow this multi-part demo.

-- For your reference, the demo that discusses indexes / covering is:
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Stabilizing plans with indexes (Covering)


-----------------------------------------------------
-- Part 1: Conditional logic - does this work?
-----------------------------------------------------

-- What you might decide is that what's safe is a range 
-- that's less than 1 day (24 hours). This will be your 
-- "standard" plan for your "typical" users.

-- Conditionally, you'll break the standard range down
-- and leave longer ranges to another statement block.

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRange')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRange];
GO

CREATE PROCEDURE [dbo].[GetDateRange]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;

IF DATEDIFF(mi, @StartDate, @EndDate) < 1440
BEGIN
    PRINT 'Range: Less than one day'
    SELECT [c].[charge_dt] AS [Charge Date]
        , [c].[ChargeNo] AS [Charge Number]
        , [c].[member_no] AS [Member Number]
        , [c].[charge_amt] AS [Charge Amount]
    FROM [dbo].[Charge] AS [c]
    WHERE [c].[Charge_dt] 
        BETWEEN @StartDate AND @EndDate;
END;
ELSE
BEGIN
    PRINT 'Range: one day or more'
    SELECT [c].[charge_dt] AS [Charge Date]
        , [c].[ChargeNo] AS [Charge Number]
        , [c].[member_no] AS [Member Number]
        , [c].[charge_amt] AS [Charge Amount]
    FROM [dbo].[Charge] AS [c]
    WHERE [c].[Charge_dt] 
        BETWEEN @StartDate AND @EndDate;
END;
GO

-- Try some executions

-- One hour
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01';
GO

-- Check the plan(s) in cache
EXEC [dbo].[ProcedurePlans];
GO

-- 4 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 14:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- No, because SQL Server optimized every statement
-- that was optimizable - on the FIRST execution - 
-- and with THOSE input parameters.

-- What if we did this in the other order?
EXEC [sp_recompile] 'dbo.GetDateRange';
GO  -- Evict ALL plans from the cache now

EXEC [dbo].[ProcedurePlans];
GO  -- no plans in cache

-- What if the FIRST person who executes happens
-- to be a super-user

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01';
GO

-- Next, what about a more typical user: 
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01';
GO  -- Review the plan
    -- What happened?

-- SQL Server optimized ANY / EVERY statement
-- that was optimizable. They don't know what 
-- will actually execute so they optimized 
-- the first statement even though those 
-- specific values were never intended for 
-- statement 1.

EXEC [dbo].[ProcedurePlans];
GO  -- So much to see here!

-- In the end, what do we know?

--  We can't trust conditional logic
--  to CONSISTENTLY yield optimal plans. 

-----------------------------------------------------
-- Part 2: Conditional logic and modularization
-----------------------------------------------------

-- One option would be to determine the incoming date range 
-- and if it's less than 1 day, use a single / compiled plan
-- if it's more than 1 day - then, recompile.

-- Since you don't want to have to change the applications,
-- you'll first create a new procedure that looks just like
-- the current one but this will be your "sub-procedure."

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRangeSub')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRangeSub];
GO

CREATE PROCEDURE [dbo].[GetDateRangeSub]
(
	@StartDate		datetime2(4),
	@EndDate		datetime2(4)
)
AS
SET NOCOUNT ON;

SELECT [c].[charge_dt] AS [Charge Date]
    , [c].[ChargeNo] AS [Charge Number]
    , [c].[member_no] AS [Member Number]
    , [c].[charge_amt] AS [Charge Amount]
FROM [dbo].[Charge] AS [c]
WHERE [c].[Charge_dt] 
    BETWEEN @StartDate AND @EndDate;
GO

-- Next, you'll want to create a "wrapper" procedure that will
-- conditionally call the sub-procedure. 

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRange')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRange];
GO

CREATE PROCEDURE [dbo].[GetDateRange]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;
IF DATEDIFF(mi, @StartDate, @EndDate) < 1440
BEGIN
	EXEC [dbo].[GetDateRangeSub] @StartDate, @EndDate;
END;
ELSE
BEGIN
	EXEC [dbo].[GetDateRangeSub] @StartDate, @EndDate 
        WITH RECOMPILE;
END;
GO

-- One hour
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 4 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 14:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 8 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 18:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 16 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 02:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 24 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 32 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 22:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 48 hours
EXEC [dbo].[GetDateRange]     
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- The benefit of this stored procedure is that you don't 
-- have to leave it up to the application to make the right 
-- decision.

-- The bad news - you won't know how many executions of 
-- the recompiled version have run - except through
-- Extended Events...

EXEC [dbo].[RecompileEvents];
GO  -- Oh, no... 
    -- we CANNOT see executions of procedures if:
    --  * they're created WITH RECOMPILE
    --  * they're executed WITH RECOMPILE

-----------------------------------------------------
-- Part 3: Any other options?
-----------------------------------------------------

-- A slightly better option (than using EXEC ... WITH
-- RECOMPILE) is to use OPTION (RECOMPILE). You'll still
-- recompile for every execution but you'll be able
-- to better track what's happening.

-- The bad news is that we want to make sure that the
-- first statement NEVER optimizes with parameters 
-- intended for the second statement. 

-- So - the best option:
-- Modularize the code and create TWO subprocedures
--  Pro: SQL will never optimize the first one with 
--       parameters intended for the second
--  Pro: We can track and analyze all executions
--       and recompiles with inline recompiles
--  Con: We have more stored procs to manage (minor)

USE [Credit];
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRangeSub1')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRangeSub1];
GO

CREATE PROCEDURE [dbo].[GetDateRangeSub1]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;

SELECT [c].[charge_dt] AS [Charge Date]
    , [c].[ChargeNo] AS [Charge Number]
    , [c].[member_no] AS [Member Number]
    , [c].[charge_amt] AS [Charge Amount]
FROM [dbo].[Charge] AS [c]
WHERE [c].[Charge_dt] 
    BETWEEN @StartDate AND @EndDate;
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRangeSub2')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRangeSub2];
GO

CREATE PROCEDURE [dbo].[GetDateRangeSub2]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;

SELECT [c].[charge_dt] AS [Charge Date]
    , [c].[ChargeNo] AS [Charge Number]
    , [c].[member_no] AS [Member Number]
    , [c].[charge_amt] AS [Charge Amount]
FROM [dbo].[Charge] AS [c]
WHERE [c].[Charge_dt] 
    BETWEEN @StartDate AND @EndDate
OPTION (RECOMPILE);
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetDateRange')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetDateRange];
GO

CREATE PROCEDURE [dbo].[GetDateRange]
(
	@StartDate		DATETIME2(4),
	@EndDate		DATETIME2(4)
)
AS
SET NOCOUNT ON;

IF DATEDIFF(mi, @StartDate, @EndDate) < 1440
BEGIN
    EXEC [dbo].[GetDateRangeSub1] 
        @StartDate
        , @EndDate
END;
ELSE
BEGIN
    EXEC [dbo].[GetDateRangeSub2] 
        @StartDate
        , @EndDate
END;
GO

-- One hour
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 4 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 14:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 8 hours
EXEC [dbo].[GetDateRange]
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 18:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 16 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 02:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 24 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 32 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 22:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 48 hours
EXEC [dbo].[GetDateRange]     
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

EXEC [dbo].[RecompileEvents];
GO

-- In the end, we can see this in the 
-- query_stats and the procedure_stats 
-- as well as the extended event.

-- This gives us the best / actionable
-- troubleshooting!