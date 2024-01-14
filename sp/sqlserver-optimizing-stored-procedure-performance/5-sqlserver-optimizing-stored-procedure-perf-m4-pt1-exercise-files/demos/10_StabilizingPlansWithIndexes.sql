-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Stabilizing plans with indexes (Covering)
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

-- Third, setup the date-related date changes we'll use throughout 
-- this demo:
--   Course: SQL Server: Optimizing Stored Procedure Performance
--	 Module: Optimization and Recompilation
--   Demo: Credit Sample Database Setup Dates for Charges
-- Open Script: CreditDemoDatabaseSetup_ChargeDates.sql
-- Execute the ENTIRE script

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- There are a lot of options for dealing with plan changes
-- and instability when you CANNOT make index changes. And,
-- an index change might not always be the best one:
--   * Indexes take disk space
--   * Indexes might negatively affect OLTP
--   * Indexes need to have regular / automated maintenance
--
-- And, if the procedure is not a high-priority procedure then
-- it might not be worth it to create an index.

-- But, for a lot of date-related tables, it might be a MUCH
-- better idea to consider a date-related clustered index.
-- This is why this demo is relevant!

USE [Credit];
GO

-- Turn Graphical Showplan on, plus:
SET STATISTICS IO ON;
GO

-- Let's create the original version of the procedure
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

-- We saw that the plan changed between 32 and 48 hours
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

-- Let's also capture the index recommendation that
-- we see in the showplan...

-- CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
-- ON [dbo].[charge] ([charge_dt])
-- INCLUDE ([member_no],[charge_amt],[ChargeNo])
-- GO

-- (we'll come back to this later)

-----------------------------------------------------
-- The tipping point?
-----------------------------------------------------

-- Where *exactly* does the plan change?

-- ON my Machine
-- With MAXDOP 0 and cost threshold for parallelism at 5
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 6:38' WITH RECOMPILE;
GO  -- 2677 rows

EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 6:39' WITH RECOMPILE;
GO  -- 2678 rows

-- But, notice that if I set my cost threshold up to 10
EXEC [sp_configure] 'cost threshold for parallelism', 10;
GO

RECONFIGURE; -- REMEMBER, this will flush you entire SERVER'S
             -- plan cache.
GO

EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 22:31' WITH RECOMPILE;
GO  -- Estimate: 3631.99, Actual: 3630 rows

EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 22:32' WITH RECOMPILE;
GO -- Estimate: 3632.99, Actual: 3631 rows   

-- Plan stability is affect by MANY FACTORS
--  * amount of data and distribution of that data
--    KEY POINT: You MUST use realistic data for 
--               REALISTIC performance tuning!
--
--  * even with realistic data...
--    Every timeframe will NOT have EXACTLY the same 
--    number of rows. So, the exact number of rows / 
--    hours will vary over different time periods. 
--
--  * server configuration
--    KEY POINT: You really should be testing on an 
--               EXACT replica of your production 
--               environment if you really want to know
--               what's going to happen. 
-- 
--  * things change / stuff happens!
--    KEY POINT: This is NOT a one-time fix that will
--               always work as users / applications /
--               and needs CHANGE.

-- We came to the conclusion that this procedure does 
-- not have a single / stable plan.

-- We reviewed a variety of options for handling this 
-- problem / scenario WITH CODE...

-- But, what if we can change the INDEXES?

-----------------------------------------------------
-- Stabilizing the plan with indexes (a.k.a. covering)
-----------------------------------------------------

-- We've talked about there being two problems really:
-- * when the plan is created (sniffing)
-- * the stability of the plan

-- I could create an index to stabilize this plan?
-- This is what the "green hint" recommended; it's a
-- nonclustered covering index for this query.

-- CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
-- ON [dbo].[charge] ([charge_dt])
-- INCLUDE ([member_no],[charge_amt],[ChargeNo])
-- GO

-- Or, possibly the clustered index could be changed?

-- Date-related scenarios lend themselves to a different
-- choice for your clustering key!

EXEC [sp_helpindex] N'dbo.charge';
GO

DROP INDEX [dbo].[charge].[ChargeDate];
GO

ALTER TABLE [dbo].[charge]
DROP CONSTRAINT [ChargePK];
GO

CREATE UNIQUE CLUSTERED INDEX [ChargeCL]
ON [dbo].[charge] ([Charge_dt], [ChargeNo]);
GO

ALTER TABLE [dbo].[charge]
ADD CONSTRAINT [ChargePK] 
    PRIMARY KEY ([ChargeNo]);
GO

EXEC [sp_helpindex] N'dbo.charge';
GO

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

-- And, what about our current / exact "tipping" point:
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 22:32' WITH RECOMPILE;
GO  --3631 rows

EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 22:33' WITH RECOMPILE;
GO  --3632 rows

-- Or, what if I use an even larger range?
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20150101' WITH RECOMPILE;
GO  

-- Now, no matter what - the plan doesn't change!
-- We now have a SINGLE / STABLE plan...

-- Create / execute normally!

-- One hour
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 11:01';
GO

-- 4 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 14:01';
GO

-- 8 hours
EXEC [dbo].[GetDateRange]
    @StartDate = '20140203 10:01'
    , @EndDate = '20140203 18:01';
GO

-- 16 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 02:01';
GO

-- 24 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 10:01';
GO

-- 32 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140204 22:01';
GO

-- 48 hours
EXEC [dbo].[GetDateRange]     
    @StartDate = '20140203 10:01'
    , @EndDate = '20140205 10:01';
GO

-- 72 hours
EXEC [dbo].[GetDateRange] 
    @StartDate = '20140203 10:01'
    , @EndDate = '20140206 10:01';
GO

EXEC [dbo].[ProcedurePlans];
GO

-- Once this is complete, you might want to set your
-- cost threshold for parallelism back to 5
EXEC [sp_configure] 'cost threshold for parallelism', 5;
GO

RECONFIGURE; -- REMEMBER, this will flush you entire SERVER'S
             -- plan cache.
GO