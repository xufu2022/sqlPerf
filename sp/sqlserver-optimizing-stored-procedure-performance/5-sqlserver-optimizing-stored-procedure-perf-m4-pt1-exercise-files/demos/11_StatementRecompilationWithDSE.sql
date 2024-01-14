-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Statement Recompilation with Dynamic String Execution
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

-- Create a relatively simple procedure with a 
-- LIKE condition for parameter...

USE [Credit];
GO

UPDATE [dbo].[member]  
    SET [lastname] = 'Tripp'
    WHERE [member_no] = 1234;
GO

CREATE INDEX [MemberLastName] 
ON [dbo].[member] ([LastName]);
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetMemberInfo'), 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetMemberInfo];
GO

CREATE PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LastName;
GO

-- Turn Graphical Showplan on, plus:
SET STATISTICS IO ON;
GO

-- Execute a VERY wide variety of possible parameter
-- vales and lets focus on the pattern of the 
-- optimal plan:
EXEC [dbo].[GetMemberInfo] 'Anderson' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Randal' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%t%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Kehayias' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Chen' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%e%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Stellato' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Barr' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'T%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Eflin' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Tripp' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%s%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'YEONG' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Berry' WITH RECOMPILE;
GO  -- Now, we have to deal with this...

-----------------------------------------------------
-- Creating a dynamic string
-- Possible back to SQL Server 2000
-----------------------------------------------------

-- Since the pattern varies and there's no clear
-- winner, we could recompile for every execution

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetMemberInfo'), 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetMemberInfo];
GO

CREATE PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
DECLARE @ExecString     NVARCHAR(2000);
SELECT @ExecString = N'SELECT [m].* '
    + N'FROM [dbo].[member] AS [m] '
    + N'WHERE [m].[lastname] LIKE ' 
    + N'CONVERT(VARCHAR(15), '''
    + REPLACE(@LastName, '''', '''''') -- to prevent SQL injection
    + N''')';

-- NOTE: If you plan to use dynamic strings, consider reading my
-- blog post: Little Bobby Tables, SQL Injection and EXECUTE AS
-- http://bit.ly/VexVXL

-- For testing:
--SELECT @ExecString;

-- Execute the string:
EXEC (@ExecString);
GO

EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfo] 'Randal';
EXEC [dbo].[GetMemberInfo] '%t%';
EXEC [dbo].[GetMemberInfo] 'Kehayias';
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfo] 'Stellato';
EXEC [dbo].[GetMemberInfo] 'O''leary';
EXEC [dbo].[GetMemberInfo] 'T%';
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] 'Tripp';
EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] 'YEONG';
EXEC [dbo].[GetMemberInfo] 'Berry';
GO  -- Now, they all get the "right" plan with
    -- each execution

EXEC [ProcedurePlans];
GO  -- Nothing... 

-- But, that plan is NOT stored with the procedure
-- it's an Ad Hoc statement in the ad hoc plan cache...
-- this can cause bloat
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
    ([st].[text] LIKE '%CONVERT(VARCHAR(15),%') 
ORDER BY 1, [qs].[execution_count] DESC;
GO	