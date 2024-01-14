-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Statement Execution Methods
--   Demo: Statement Execution
-----------------------------------------------------------------

-- First, run the Sample Database Setup script for Credit
-- Script: CreditDemoDatabaseSetup.sql

USE [Credit];
GO

-- What are the differences in the way that you request
-- data from SQL Server?
 
-- Quick setup for later searches

UPDATE [member]	
SET [lastname] = 'Tripp' 
WHERE [member_no] = 1234;
GO

CREATE INDEX [MemberLastName]
ON [dbo].[member] ([lastname]);
GO

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

--------------------------------------------------
-- Can we see what's in cache?
--
-- Simple proc to quickly see a subset of
-- what statements are in cache - with their
-- plans.
-- 
-- NOTE: The rest of this course will further
-- explain a lot of what you're going to see
-- here. Think of this script as showing your
-- options but also starting to introduce 
-- their pitfalls.
--------------------------------------------------

CREATE PROCEDURE [dbo].[QuickCheckOnCache]
(
    @StringToFind   NVARCHAR (4000)
)
AS
SET NOCOUNT ON;

SELECT [st].[text]
	, [qs].[execution_count]
	, [qs].*
	, [p].* 
FROM [sys].[dm_exec_query_stats] AS [qs] 
	CROSS APPLY [sys].[dm_exec_sql_text] 
		([qs].[sql_handle]) AS [st]
	CROSS APPLY [sys].[dm_exec_query_plan] 
		([qs].[plan_handle]) AS [p]
WHERE [st].[text] LIKE @StringToFind
ORDER BY 1, [qs].[execution_count] DESC;
GO

-- Make it a bit easier (more isolated) 
-- to review what's in cache and to clear
-- any plans that might have ended up there
-- that could influence the results of this
-- scripts:
DBCC FREEPROCCACHE;
GO

-- These are great for review:
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
-- Also, turn Actual Graphical Showplan ON
GO

--------------------------------------------------
-- Part I: Ad hoc statements & literals
-- Executing a SAFE statement
--------------------------------------------------
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] = 258;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] = 34567;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] = 35;
GO

EXEC [QuickCheckOnCache] '%member_no%';
GO

-- NOTES: These first 3 ad hoc statements
--        are deemed "safe" 
--		  (for parameterization and caching).

--------------------------------------------------
-- Part II: Ad hoc statements & literals
-- Executing an UNSAFE statement
--------------------------------------------------

-- Equality-based searches
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Anderson';
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = 'Tripp';
GO

-- Wildcard-based searches
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE 'Anderson';
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE 'Tripp';
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE '%e%';
GO

EXEC [QuickCheckOnCache] '%lastname%';
GO

-- NOTES: All of these are all deemed unsafe.
-- Some can be forced, some cannot

--------------------------------------------------
-- Part III: Ad hoc statements & variables
-- Executing a SAFE statement but with
-- a variable
-- Executing an UNSAFE statement with 
-- a variable
--------------------------------------------------
GO

DECLARE @mno INT = 252;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[member_no] = @mno;
GO

EXEC [QuickCheckOnCache] '%member_no%';
GO

DECLARE @lastname VARCHAR(15) = 'Tripp';
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @lastname;
GO

EXEC [QuickCheckOnCache] '%lastname%';
GO

--------------------------------------------------
-- Part IV: sp_executesql 
-- Executing a SAFE statement 
--------------------------------------------------
GO

DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = @mno';
EXEC [sp_executesql] @ExecStr, N'@mno INT', 1234;
GO
                      
DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = @mno';
EXEC [sp_executesql] @ExecStr, N'@mno INT', 12;
GO

DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = @mno';
EXEC [sp_executesql] @ExecStr, N'@mno INT', 76896;
GO

EXEC [QuickCheckOnCache] '%mno%';
GO

-- NOTES: Only ONE statement is placed in cache. 
-- And, notice that it's strongly typed. For a 
-- statement with a stable plan this can be 
-- beneficial.

--------------------------------------------------
-- Part V: sp_executesql 
-- Executing an UNSAFE statement 
--------------------------------------------------
GO

DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE @lastname';
EXEC [sp_executesql] @ExecStr
	, N'@lastname VARCHAR (15)'
	, 'Tripp';
GO
                      
DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE @lastname';
EXEC [sp_executesql] @ExecStr
	, N'@lastname VARCHAR (15)'
	, 'Anderson';
GO

DECLARE @ExecStr    NVARCHAR (4000);
SELECT @ExecStr = 
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE @lastname';
EXEC [sp_executesql] @ExecStr
	, N'@lastname VARCHAR (15)'
	, '%e%';
GO

EXEC [QuickCheckOnCache] '%member%';
GO

--------------------------------------------------
-- Part VI: Dynamic String Execution
-- Executing a SAFE statement
--------------------------------------------------

-- This first version is what's most likely for 
-- developers to write. However, without strongly
-- typed parameters, you'll end up with multiple
-- plans (one per data type).
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 1567;

SELECT @ExecStr =
	N'SELECT [mbr].* 
	FROM [dbo].[member] AS [mbr] 
	WHERE [mbr].[member_no] = ' 
		+ CONVERT (NVARCHAR (10), @MemberNo); 

--SELECT @ExecStr;
EXEC (@ExecStr);
GO

-- This second version is better as the variable 
-- is strongly typed. If the statement is "safe" 
-- SQL Server will only have ONE plan to use/re-use.
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 1567;

SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = CONVERT (INT, ' 
		+ CONVERT (NVARCHAR (10), @MemberNo) + N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO

----------------------------------
-- Second statement
----------------------------------
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 17;

SELECT @ExecStr =
	N'SELECT [mbr].* 
	FROM [dbo].[member] AS [mbr] 
	WHERE [mbr].[member_no] = ' 
		+ CONVERT (NVARCHAR (10), @MemberNo); 

SELECT @ExecStr;
EXEC (@ExecStr);
GO

--------
-- OR
--------
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 17;

SELECT @ExecStr =
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = CONVERT (INT, ' 
		+ CONVERT (NVARCHAR (10), @MemberNo) + N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO

----------------------------------
-- Third statement
----------------------------------
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 64567;

SELECT @ExecStr =
	N'SELECT [mbr].* 
	FROM [dbo].[member] AS [mbr] 
	WHERE [mbr].[member_no] = ' 
		+ CONVERT (NVARCHAR (10), @MemberNo); 

SELECT @ExecStr;
EXEC (@ExecStr);
GO

--------
-- OR
--------
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@MemberNo	INT = 64567;

SELECT @ExecStr = 
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[member_no] = CONVERT (INT, ' 
		+ CONVERT (NVARCHAR (10), @MemberNo) + N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO

EXEC [QuickCheckOnCache] '%member_no%';
GO

--------------------------------------------------
-- Part VII: Dynamic String Execution
-- Executing an UNSAFE statement
--------------------------------------------------
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@Lastname	VARCHAR (15) = 'Tripp';

SELECT @ExecStr = 
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE CONVERT (VARCHAR (15), ' 
		+ QUOTENAME (@lastname, '''') 
		+ N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO
                      
DECLARE @ExecStr    NVARCHAR (4000),
		@Lastname	VARCHAR (15) = 'Anderson';

SELECT @ExecStr = 
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE CONVERT (VARCHAR (15), ' 
		+ QUOTENAME (@lastname, '''') 
		+ N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO

DECLARE @ExecStr    NVARCHAR (4000),
		@Lastname	VARCHAR (15) = '%e%';

SELECT @ExecStr = 
	N'SELECT [m].* 
	FROM [dbo].[member] AS [m] 
	WHERE [m].[lastname] LIKE CONVERT (VARCHAR (15), ' 
		+ QUOTENAME (@lastname, '''') 
		+ N')';

SELECT @ExecStr;
EXEC (@ExecStr);
GO

EXEC [QuickCheckOnCache] '%VARCHAR (15)%';
GO

-- NOTES on strings
-- Using REPLACE instead of QUOTENAME. 
-- QUOTENAME is limited to NVARCHAR (128) 
-- for longer strings - you must use REPLACE:
-- SELECT @ExecStr = 
--	N'SELECT [m].* 
--	FROM [dbo].[member] AS [m] 
--	WHERE [m].[lastname] LIKE CONVERT (VARCHAR (15), ''' 
--		+ REPLACE (@lastname, '''', '''''') 
--		+ N''')';

-- CHECK out this blog post for more information on
-- dealing with strings and SQL injection.
-- BLOG: Little Bobby Tables, SQL Injection and EXECUTE AS
-- http://bit.ly/V1R3l5 