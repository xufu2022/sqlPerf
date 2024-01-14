-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Conditional Logic - Part 2 (Modularization)
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- Continue from previous demo

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- What about taking our conditional logic into sub-
-- procedures?

-----------------------------------------------------
-- What about modularization and sub-procedures?
-----------------------------------------------------

USE [Credit];
GO

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetMemberInfoWithWildcard')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetMemberInfoWithWildcard];
GO

CREATE PROCEDURE [dbo].[GetMemberInfoWithWildcard]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LastName;
GO

IF OBJECTPROPERTY(OBJECT_ID('dbo.GetMemberInfoWithoutWildcard')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[GetMemberInfoWithoutWildcard];
GO

CREATE PROCEDURE [dbo].[GetMemberInfoWithoutWildcard]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @LastName;
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
IF @LastName NOT LIKE '%[_[[%]%'
    EXEC [dbo].[GetMemberInfoWithoutWildcard] @LastName;
ELSE
    EXEC [dbo].[GetMemberInfoWithWildcard] @LastName;
GO

-- Now, we'll see if the same values give us the same
-- plans (using sub-procedures):

EXEC [dbo].[GetMemberInfo] 'Tripp';
GO  -- Uses an index

-- Next, execute a condition that will execute
-- the ELSE condition ( equality )
EXEC [dbo].[GetMemberInfo] '%e%';
GO  -- This time this IS the first time this will
    -- execute. So, it will be optimized using
    -- %e%... bingo! We got the right plan.

-- That appears promising... 
-- but, does it really work?

-- Let's confirm what we think:
EXEC [ProcedurePlans];
GO  -- Two procedures, two plans...
    -- GetMemberInfoWithoutWildcard
    -- GetMemberInfoWithWildcard

-- There are really two problems:
-- (1) when is the code optimized?
--   ** for block-level code, optimization
--   ** for sub-procedures, only when executed

-- (2) is the plan for that procedure stable?
--   ** this depends on the code and the data distribution

-- Looks like we're solving problem #1
-- But, what about problem #2