-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Multipurpose Procedures
--          (a.k.a. one size does NOT fit all)
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
-- A common problem in coding procedures is the OSFA
-- procedure. The developer has a complicated number
-- of options to use to "search" for a row. They give
-- all of the options on the dialog / window and then
-- think that only a single procedure is needed to 
-- handle all possible combinations.

-- The procedure often looks like this:
-- WHERE (column1 = variable1 OR variable1 IS NULL)
--	 AND (column2 = variable2 OR variable2 IS NULL)
--	 AND (column3 = variable3 OR variable3 IS NULL)
--   ...
--	 AND (columnN = variableN OR variableN IS NULL)

-- So our procedure is going to be for "finding members"
-- We might look up members by:
--      member_no (unique)
--      lastname (allow wildcards?)
--      firstname (allow wildcards?)
--      middleinitial
--      email (allow wildcards?)
--      region_no (not selective)
--      member_code (not selective)
-- And/or ANY combination 

-----------------------------------------------------
-- Setup for this
-----------------------------------------------------

USE Credit;
GO

-- Create another unique column
ALTER TABLE [dbo].[member]
ADD [Email] NVARCHAR (128);

-- Give all employees a middle initial
UPDATE [dbo].[member]
    SET [middleinitial]
        = ISNULL(SUBSTRING([firstname], 3, 1), 'Q');

-- Add a couple of "interesting" rows ;-)
UPDATE [dbo].[member]
	SET [lastname] = 'Tripp'
        , [firstname] = 'Kimberly'
        , [middleinitial] = 'L'
	WHERE [member_no] = 1234;
GO

UPDATE [dbo].[member]
	SET [lastname] = 'Randal'
        , [firstname] = 'Paul'
        , [middleinitial] = 'S'
	WHERE [member_no] = 2479;
GO

-- Give all employees an email
UPDATE [dbo].[member]
    SET [member_code] = ([member_no] % 29) + 1
        , [Email] = CONVERT(NVARCHAR, [firstname])
                + N'.'
                + CONVERT(NVARCHAR, [middleinitial])
                + N'.'
                + CONVERT(NVARCHAR, [lastname])
                + N'@company'
                + RIGHT ('00' + CONVERT(VARCHAR, 
                    ([member_no] % 29) + 1), 2)
                + N'.com'

-- Let's make sure there's an index on each of these
-- columns

-- IMPORTANT NOTE:
-- I'm not saying this is a good idea but it's
-- often done to "help" these types of searches

-- Add an index to SEEK for FirstNames
CREATE INDEX [MemberFirstName] 
ON [dbo].[member] ([FirstName]);
GO

-- Add an index to SEEK for LastNames
CREATE INDEX [MemberLastName] 
ON [dbo].[member] ([LastName]);
GO

-- Add an index to SEEK for Email
CREATE INDEX [MemberEmail] 
ON [dbo].[member] ([Email]);
GO

-- Add an index to SEEK for member_code
CREATE INDEX [MemberCode] 
ON [dbo].[member] ([member_code]);
GO

-- Added this in so you don't have to type it:
SELECT * 
FROM [Member];
GO

-----------------------------------------------------
-- Create the 'oh-so-clever' OSFA procedure
-----------------------------------------------------

IF OBJECTPROPERTY (OBJECT_ID (N'dbo.GetMemberInfoParam')
    , N'IsProcedure') = 1
	DROP PROCEDURE [dbo].[GetMemberInfoParam];
GO

CREATE PROC [dbo].[GetMemberInfoParam]
(
    @member_no	INT = NULL
    , @Lastname	VARCHAR (15) = NULL
	, @Firstname	VARCHAR (15) = NULL
    , @MiddleInitial  letter = NULL
    , @EmailAddress VARCHAR(128) = NULL
    , @Region_no  numeric_id = NULL
    , @Member_code status_code = NULL
)
AS
SELECT [m].* FROM [dbo].[member] AS [m]
WHERE ([m].[member_no] = @member_no OR @member_no IS NULL)
    AND ([m].[lastname] LIKE @lastname OR @lastname IS NULL)
	AND ([m].[firstname] LIKE @firstname OR @firstname IS NULL)
    AND ([m].[middleinitial] = @MiddleInitial OR @MiddleInitial IS NULL)
    AND ([m].[Email] LIKE @EmailAddress OR @EmailAddress IS NULL)
    AND ([m].[region_no] = @Region_no OR @Region_no IS NULL)
    AND ([m].[member_code] = @Member_code OR @Member_code IS NULL);
GO

-- Turn Graphical Showplan on, plus:
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- Let's try a couple of simple executions
EXEC [GetMemberInfoParam] @Lastname = 'Tripp';
GO  -- Index scan?

EXEC [GetMemberInfoParam] @EmailAddress = '%27.com';
GO

EXEC [GetMemberInfoParam] @Member_no = 9912;
GO

-- Yikes - that's not a great plan for ANY of them!
-- Definitely NOT a great plan for ALL of them!!

-----------------------------------------------------
-- Using OPTION (RECOMPILE)
-----------------------------------------------------

-- Will OPTION (RECOMPILE) save the day?

ALTER PROC [dbo].[GetMemberInfoParam]
(
    @member_no	INT = NULL
    , @Lastname	VARCHAR (15) = NULL
	, @Firstname	VARCHAR (15) = NULL
    , @MiddleInitial  letter = NULL
    , @EmailAddress VARCHAR(128) = NULL
    , @Region_no  numeric_id = NULL
    , @Member_code status_code = NULL
)
AS
SELECT [m].* FROM [dbo].[member] AS [m]
WHERE ([m].[member_no] = @member_no OR @member_no IS NULL)
    AND ([m].[lastname] LIKE @lastname OR @lastname IS NULL)
	AND ([m].[firstname] LIKE @firstname OR @firstname IS NULL)
    AND ([m].[middleinitial] = @MiddleInitial OR @MiddleInitial IS NULL)
    AND ([m].[Email] LIKE @EmailAddress OR @EmailAddress IS NULL)
    AND ([m].[region_no] = @Region_no OR @Region_no IS NULL)
    AND ([m].[member_code] = @Member_code OR @Member_code IS NULL)
OPTION (RECOMPILE);
GO

-- Let's try a couple of simple executions
EXEC [GetMemberInfoParam] @Lastname = 'Tripp';
GO  -- Now, it's an index SEEK!

EXEC [GetMemberInfoParam] @EmailAddress = '%27.com';
GO  -- Table scan... well, it's not a great search
    -- far fewer I/Os

EXEC [GetMemberInfoParam] @Member_no = 9912;
GO

-- Excellent! Everything has a great plan BUT
-- we're compiling EVERY execution.
-- What if this is executed tens of thousands of times an 
-- hour and by thousands of users...

-----------------------------------------------------
-- Building the ultimate multipurpose procedure
-----------------------------------------------------

-- Option 1: Build the ENTIRE string dynamically
--           ONLY including non-NULL parameters
--           Execute using EXEC (@String)
--           Each execution will turn into ad hoc
--             when safe -> paramterized and saved
--             when unsafe -> not saved, compiled every time

-- Option 2: Build the ENTIRE string dynmically
--           ONLY including non-NULL parameters
--           Execute using sp_executesql 
--           Every VERSION of the query will go into
--           cache (and, some might fall victim to
--           parameter sniffing problems)

-- Best Option - Option 2... with a twist!

ALTER PROC [dbo].[GetMemberInfoParam]
(
    @member_no	INT = NULL
    , @Lastname	VARCHAR (15) = NULL
	, @Firstname	VARCHAR (15) = NULL
    , @MiddleInitial  letter = NULL
    , @EmailAddress VARCHAR(128) = NULL
    , @Region_no  numeric_id = NULL
    , @Member_code status_code = NULL
)
AS
IF (@member_no IS NULL
    AND @Lastname IS NULL
	AND @Firstname IS NULL
    AND @MiddleInitial IS NULL
    AND @EmailAddress IS NULL
    AND @Region_no IS NULL
    AND @Member_code IS NULL)
BEGIN
	RAISERROR ('You must supply at least one parameter.', 16, -1);
    RETURN;
END;

DECLARE @ExecStr	NVARCHAR (4000),
        @Recompile  BIT = 1;

SELECT @ExecStr =
	N'SELECT [m].* FROM [dbo].[member] AS [m] WHERE 1=1';

IF @member_no IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[member_no] = @MemberNo';

IF @LastName IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[lastname] LIKE @LName'; 

IF @FirstName IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[firstname] LIKE @FName';

IF @MiddleInitial IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[middleinitial] = @MI';

IF @EmailAddress IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[email] LIKE @Email';

IF @Region_no IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[region_no] = @RegionNo';

IF @Member_code IS NOT NULL
	SELECT @ExecStr = @ExecStr 
		+ N' AND [m].[member_code] = @MemberCode';

-- Conditions that you know will be HIGHLY SELECTIVE
-- and therefore stabilize the plan (do NOT recompile):
IF (@member_no IS NOT NULL)
    SET @Recompile = 0

IF (@LastName NOT LIKE '[%_?][%_?][%_?]%' -- at least 3 chars, no WC
        AND @FirstName NOT LIKE '[%_?]%') -- same
    SET @Recompile = 0

IF (@EmailAddress NOT LIKE '%[%_?]%') -- no wildcards
    SET @Recompile = 0

IF @Recompile = 1
    SELECT @ExecStr = @ExecStr + N' OPTION(RECOMPILE)';
    
SELECT @ExecStr, @Lastname, @Firstname, @member_no;

EXEC [sp_executesql] @ExecStr
    , N'@MemberNo int, @LName varchar(15), @FName varchar(15)
    , @MI letter, @Email nvarchar(128), @RegionNo numeric_id
    , @MemberCode status_code'
	, @MemberNo = @Member_no
    , @LName = @Lastname
	, @FName = @Firstname
    , @MI = @MiddleInitial
    , @Email = @EmailAddress
    , @RegionNo = @Region_no
    , @MemberCode = @Member_code;
GO

-- Let's try a couple of executions
EXEC [GetMemberInfoParam] 
    @Member_no = 9912;
GO

EXEC [GetMemberInfoParam] 
    @Lastname = 'Tripp'
    , @Firstname = 'Kimberly';
GO

EXEC [GetMemberInfoParam] 
    @EmailAddress = N'BFXETPSUKOP.X.FLORINI@company02.com';
GO

EXEC [GetMemberInfoParam] 
    @EmailAddress = '%2%.com'
    , @Region_No = 6
    , @Member_Code = 2;
GO  

EXEC [GetMemberInfoParam] 
    @Member_no = 1234;
GO

EXEC [GetMemberInfoParam] 
    @EmailAddress = N'GXRERSSCFTMISY.R.VANN@company16.com';
GO

EXEC [GetMemberInfoParam] 
    @EmailAddress = '%27.com';
GO

EXEC [GetMemberInfoParam] 
    @Lastname = 'Ran%'
    , @Firstname = 'P%';
GO  

EXEC [GetMemberInfoParam] 
    @EmailAddress = N'NWGUMXWETJPPSN.G.JONES@company01.com';
GO

EXEC [GetMemberInfoParam] 
    @Member_no = 2479;
GO

EXEC [GetMemberInfoParam] 
    @EmailAddress = '%2%.com'
    , @Region_No = 6
    , @Lastname = 'L%'
    , @Member_Code = 2;
GO  

EXEC [GetMemberInfoParam] 
    @EmailAddress = N'PZJWXGMEXPTSQJ.J.EFLIN@company16.com';
GO

-- Let's check what's in the plan cache
EXEC [ProcedurePlans];
GO  -- nothing for this proc... nothing to compile / store

-- What about the statement cache? 
SELECT [st].[text]
	, [qs].[query_hash]
	, [qs].[query_plan_hash]
	, [qs].[execution_count]
	, [qs].[plan_handle]
	, [qs].[statement_start_offset]
FROM [sys].[dm_exec_query_stats] AS [qs] 
	CROSS APPLY [sys].[dm_exec_sql_text] ([qs].[sql_handle]) AS [st]
	CROSS APPLY [sys].[dm_exec_query_plan] ([qs].[plan_handle]) AS [qp]
WHERE 
    ([st].[text] LIKE N'%member%'
        AND [st].[text] NOT LIKE N'%dm_exec_sql_text%')
ORDER BY 1, [qs].[execution_count] DESC;
GO  -- 12 executions: 9 (75%) were parameterized, compiled, and re-used!
    -- And, because we used sp_executesql - there's no ad hoc plan
    -- cache bloat for the specific executions WITH RECOMPILE.
    -- You could argue this is both good and bad (cannot find
    -- a "query class" for tuning)

-- Work through a slightly simpler combination
-- Procedure allows EQUALITY only and only for
-- member_no, lastname, and firstname

-- Seven possible combinations:

-- member_no -> stable / consistent plan
-- lastname -> questionable
-- firstname -> questionable

-- member_no & lastname -> stable / consistent plan
-- member_no & firstname -> stable / consistent plan
-- lastname & firstname -> questionable

-- member_no, lastname, and firstname -> stable / consistent plan

-----------------------------------------------------
-- Clean up: STOP / DROP the XE_Recompiles session
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
