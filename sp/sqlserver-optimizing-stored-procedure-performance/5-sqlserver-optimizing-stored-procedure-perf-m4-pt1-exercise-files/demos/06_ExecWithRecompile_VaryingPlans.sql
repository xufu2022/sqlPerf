-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Execute with Recompile (Determining Plan Stability)
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
-- How can we determine if the OPTIMAL plan for a 
-- procedure is stable?

-- Let's pretend we're going back to the very first
-- version of our GetMemberInfo procedure

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

-- Execute a few test cases:
EXEC [dbo].[GetMemberInfo] 'Tripp' ;
EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfo] '%t%';
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfo] 'Barr';
EXEC [dbo].[GetMemberInfo] 'T%';
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] 'YEONG';
GO

-- Let's confirm what we think:
EXEC [ProcedurePlans];
GO  -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --          10	            1	            10

-- What if we invalidate
EXEC [sp_recompile] [GetMemberInfo];
GO

EXEC [ProcedurePlans];
GO  -- no plans listed for [GetMemberInfo]

-- This time we'll re-arrange the order of execution
-- of the parameters used:
EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfo] 'Tripp' ;
EXEC [dbo].[GetMemberInfo] '%t%';
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfo] 'Barr';
EXEC [dbo].[GetMemberInfo] 'T%';
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] 'YEONG';
GO  -- Notice that all of the plans changed
    -- they're all the same but now they're
    -- all clustered index scans...

-- So, the plan that gets there first - is used
-- for all executions.

-----------------------------------------------------
-- What's really the BEST plan for each combination?
-----------------------------------------------------

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

-- We could modularize and branch for different 
-- patterns BUT those sub-procedures STILL might
-- not be stable given the data distribution.

-- So, even though we MIGHT modularize - we still
-- have to determine if the plan for a statement is
-- stable. 

-- And, when it's not - what do we do?