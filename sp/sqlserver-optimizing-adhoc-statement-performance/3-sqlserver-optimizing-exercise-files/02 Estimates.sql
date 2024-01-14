------------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Estimates and Selectivity
--   Demo: Estimates and Selectivity: How does SQL Server 
--         "know"?
------------------------------------------------------------------

-- First, run the Sample Database Setup script for Credit
-- Script: CreditDemoDatabaseSetup.sql

USE [Credit];
GO

----------------------------------
-- Demo: Estimates and Selectivity: 
--         How does SQL Server "know"?
----------------------------------

-- Quick/general way to see index list
EXEC [sp_helpindex] N'dbo.member';
GO

-- Rewrite to give better index details/internals
-- Get here: http://bit.ly/1b3RcR0 
-- If you want help in setting this up, see
-- Course: SQL Server: Why Physical Database Design Matters
-- Module: Data Types and Index Size 
--   Demo: Setup sp_SQLskills_SQL2012_helpindex 

EXEC [sp_SQLskills_SQL2012_helpindex] N'dbo.member';
GO

EXEC [sp_helpstats] N'dbo.member', N'all';
GO

CREATE INDEX [MemberFullName]
ON [dbo].[member]
	([lastname], [firstName], [middleinitial]);
GO

SET STATISTICS IO ON;
-- Turn on showplan 
-- Use: Query, Include Actual Execution Plan [Ctrl + M]
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Anderson';  
GO

-- Where did this come from?
--	Key: adhoc, can be sniffed, uses the histogram
--	Value is an actual step - uses EQ_ROWS
DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName');
GO

-- What about a value that's NOT in as a step:
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Smith';  
GO

-- Where did this come from?
--	Key: adhoc, can be sniffed, uses the histogram
--	Value is in the range: RYAN - STEIN
--  uses AVG_RANGE_ROWS
DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName')
WITH HISTOGRAM;
GO

-- Finally, can we see that this data is EVENLY 
-- distributed:
-- Yes - in the steps of the histogram
--   All of the EQ_ROWS are basically the same
--   All of the RANGE_ROWS are 0 (no rows between
--       step values)
-- Finally, what about the density vector:
-- Take All density * rows = average rows returned

DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName');
GO

SELECT 0.03846154	-- All density: for lastname
	    * 10000		-- Rows: from the header
--  = 384.61540000	-- On average, you will get back
					-- 385 rows for a single lastname
					-- supplied in a query

---------------------------------------------
-- Change some data
---------------------------------------------

UPDATE [dbo].[member] 
	SET [lastname] = 'Tripp'
WHERE [member_no] = 1234;  
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Tripp';  
GO

-- Where did this come from?
--	Key: adhoc, can be sniffed, uses the histogram
--	Value is in the range: TOLSKY - UNAKLET
-- Obviously, NOT in a step
-- But, OK, because not much has changed and
-- this still works in AVG_RANGE_ROWS
DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName')
WITH HISTOGRAM;
GO

-- Update another row:
UPDATE [dbo].[member] 
	SET [lastname] = 'Tripp'
WHERE [member_no] = 7890;  
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Tripp';  
-- Estimate didn't change
GO

-- Tangent on when stats change:
-- Read the whitepaper: http://bit.ly/bzR5wZ

-- Quick summary of When they change:
-- DEFAULT: 500 + 20% of the table (member = 10K rows)
-- Member's stats will get INVALIDATED at 2,500 rows
--						20% = 2000 + 500

-- Or, if trace flag 2371 is turned on, then
-- updates are dynamic (tied to table size)
-- Read this blog post: http://bit.ly/qOAIqs

---------------------------------------------
-- Force stats to update:
---------------------------------------------

UPDATE STATISTICS [dbo].[member];
-- This updates all statistics for the table
-- Fullscan for scans under 10K pages
-- Sampling for scans at 10K or over 
-- Not fixed sampling percentage: percentage 
-- varies as scan size increases
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Tripp';  
-- Notice my estimate changed? Why?
GO

-- Plenty of room for more steps (up to 200)
-- And, SQL Server saw Tripp as a new/interesting
-- value:
DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName')
WITH HISTOGRAM;
GO

---------------------------------------------
-- What if I use a variable?
---------------------------------------------

DECLARE @LastNameVar VARCHAR (15) = 'Tripp';
		-- this is the EXACT same data type as the column
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @LastNameVar;
GO

-- What? 
--  The estimate went to: 370.37
-- Why?
--  During compilation the variable was deemed "UNKNOWN"
--	(which makes sense, the assignment doesn't happen
--  until runtime/execution)

-- If a value is unknown - it cannot be "sniffed"
-- If it cannot be sniffed then SQL Server has to
-- use the "average" number of rows. This comes
-- from the density vector.

-- Take All density * rows = average rows returned

SELECT 0.03703704	-- All density: for lastname
	    * 10000		-- Rows: from the header
--  = 370.37040000	-- On average, you will get back
					-- 370.37 rows for a single last name
					-- supplied in a query
DBCC SHOW_STATISTICS (N'dbo.member', N'MemberFullName');
GO

-- But, now we're starting to show some "skew"
-- in the data. And, it's starting to become
-- a bit more obvious that when a value CAN
-- be sniffed then for THAT value and THAT
-- query - you'll usually get a better plan
-- (for THAT execution)

---------------------------------------------
-- What if we don't have statistics?
---------------------------------------------

-- First, let's the drop index we've been using
DROP INDEX [dbo].[member].[MemberFullName];
GO

-- Then, let's turn off auto create statistics
-- Generally speaking - this is NOT recommended! 
ALTER DATABASE [Credit] 
SET AUTO_CREATE_STATISTICS OFF;
GO

-- Check to see if there are ANY stats that could
-- be used for lastname:
EXEC [sp_SQLskills_SQL2012_helpindex] N'dbo.member';
EXEC [sp_helpstats] N'dbo.member', N'all';
GO

-- No indexes or stats that even have lastname IN
-- the index (not even in INCLUDE).

-- Literal/parameter
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Tripp';  
GO

-- Variable
DECLARE @LastNameVar VARCHAR (15) = 'Tripp';
		-- this is the EXACT same data type as the column
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @LastNameVar;
GO

-- The plans are the same
-- The estimates are the same (10%)

-- No statistics therefore HEURISTICS 
-- Heuristics = internal rules

-- Rule for equality on one column is:
--   # of rows in the table to the power of 3/4
--   10000 ^ 3/4 = 1000

-- The rules for more than 2 columns are fractionally
-- smaller (and more complicated). But, the main point
-- statistics are generally better than heuristics.

-- Other things to note:
--	The warning symbol
--	Columns with no statistics

---------------------------------------------
-- Other Heuristics
---------------------------------------------

-- What about > or < ?
DECLARE @test INT = 9999;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] > @test;
		-- A variable cannot be sniffed 
		-- With an unknown value, they need to guess? 
		-- It's not a guess, it's heuristics.
GO

DECLARE @test INT = 2;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] > @test;
		-- Again, heuristics.
GO

-- Again - they estimate 30% 
DECLARE @test INT = 1;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] < @test;
		-- Again, heuristics.
GO

-- Here - they yield 9% *no matter what*
DECLARE @lowerbound INT = 1;
DECLARE @upperbound INT = 10000;

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] BETWEEN @lowerbound 
						AND @upperbound;
GO