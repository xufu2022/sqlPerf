-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Execute with recompile - for testing
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- Continue from previous demo

USE [Credit];
GO

-- Turn Graphical Showplan on, plus:
SET STATISTICS IO ON;
GO

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- Our last demo left off talking about MULTIPLE problems...

-- (1) when is the code optimized?
--   ** for block-level code, optimization
--   ** for sub-procedures, only when executed

-- (2) is the plan for that procedure stable?
--   ** this depends on the code and the data distribution

-- Looks like we're solving problem #1 with modularization
-- But, what about problem #2

-- Best way to test?
-- Use EXEC ... WITH RECOMPILE to see what the optimal 
-- plan should be?

-- Is that what we want??
EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfo] 'Anderson' WITH RECOMPILE;
GO

EXEC [dbo].[GetMemberInfo] 'Tripp' ;
EXEC [dbo].[GetMemberInfo] 'Tripp' WITH RECOMPILE;
GO

EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] '%s%' WITH RECOMPILE;
GO

EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] 'Chen' WITH RECOMPILE;
GO

EXEC [dbo].[GetMemberInfo] 'Tri%';
EXEC [dbo].[GetMemberInfo] 'Tri%' WITH RECOMPILE;
GO

-- It turns out that WITH RECOMPILE does not
-- get pushed down into sub-procedure calls...

-- So, how can we know that this is (or is not
-- doing the right thing?)

-- Create a version of the wrapper that forces the WITH
-- RECOMPILE down another level. This can get complicated
-- with deeply nested procedures.

-- Or, execute the sub-procedures directly with ONLY the 
-- correct / intended parameters... which should be something
-- that's done during regular testing anyway. So, this is 
-- something that COULD be added to our TEST PLAN. 
-- (more details on this coming up)

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetMemberInfoTest')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetMemberInfoTest];
GO

CREATE PROCEDURE [dbo].[GetMemberInfoTest]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
IF @LastName NOT LIKE '%[_[[%]%'
    EXEC [dbo].[GetMemberInfoWithoutWildcard] @LastName
        WITH RECOMPILE;
ELSE
    EXEC [dbo].[GetMemberInfoWithWildcard] @LastName
        WITH RECOMPILE
GO

EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfoTest] 'Anderson'; -- WITH RECOMPILE
GO  -- different plans

EXEC [dbo].[GetMemberInfo] 'Tripp' ;
EXEC [dbo].[GetMemberInfoTest] 'Tripp'; -- WITH RECOMPILE
GO  -- same plan

EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfoTest] '%e%'; -- WITH RECOMPILE
GO  -- same plan

EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfoTest] 'Chen'; -- WITH RECOMPILE
GO  -- different plans

EXEC [dbo].[GetMemberInfo] 'Tri%';
EXEC [dbo].[GetMemberInfoTest] 'Tri%'; -- WITH RECOMPILE
GO  -- different plans

-- So... no, using conditional logic really didn't help us
-- even with modularization (because of plan stability)!

-- Whatever values gets there first - sets the plan. 
-- And, the plan is NOT stable across executions.

-- What should we really do?