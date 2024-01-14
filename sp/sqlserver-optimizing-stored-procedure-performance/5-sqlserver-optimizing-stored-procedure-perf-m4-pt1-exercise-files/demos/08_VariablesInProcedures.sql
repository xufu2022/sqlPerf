-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Variables in procedures
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
-- How does SQL Server optimize when there's a variable
-- used instead of a parameter?

ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
DECLARE @LName  VARCHAR (30)
SELECT @LName = @LastName
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LName;
GO

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO  -- review the plan
    -- Same as before (900)

ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
DECLARE @LName  VARCHAR (30)
SELECT @LName = @LastName
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @LName;
GO

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO  -- review the plan
    -- density_vector (370.37)