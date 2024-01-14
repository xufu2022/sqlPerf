-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Statement Recompilation Options
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
-- If we don't have plan stability - what do we do?

-- In testing:
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
GO  -- Now, we have to determine our best
    -- setup at the most granular level

-----------------------------------------------------
-- Using OPTION (RECOMPILE)
-- Introduced in SQL Server 2005
-----------------------------------------------------

-- Since the pattern varies and there's no clear
-- winner, we could go with OPTION (RECOMPILE)

IF OBJECTPROPERTY(OBJECT_ID(N'dbo.GetMemberInfo')
    , 'IsProcedure') = 1
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
WHERE [m].[lastname] LIKE @LastName
OPTION (RECOMPILE);
GO

EXEC [ProcedurePlans];
GO  -- Obviously, no plans listed

EXEC [dbo].[GetMemberInfo] 'Anderson';
EXEC [dbo].[GetMemberInfo] 'Randal';
EXEC [dbo].[GetMemberInfo] '%t%';
EXEC [dbo].[GetMemberInfo] 'Kehayias';
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfo] 'Stellato';
EXEC [dbo].[GetMemberInfo] 'Barr';
EXEC [dbo].[GetMemberInfo] 'T%';
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] 'Tripp';
EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] 'YEONG';
EXEC [dbo].[GetMemberInfo] 'Berry';
GO  -- Now, they all get the "right" plan with
    -- each execution

EXEC [ProcedurePlans];
GO  -- 1 execution of the nth version...

EXEC [RecompileEvents];
GO  -- You can see that these can be tracked
    -- through extended events (which could
    -- be useful for later troubeshooting).

-----------------------------------------------------
-- Using OPTION (OPTIMIZE FOR...)
-- Introduced in SQL Server 2005
-----------------------------------------------------

-- What if a pattern emerged?

-- Go back to the original version
ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LastName
GO

EXEC [ProcedurePlans];
GO  -- Obviously, no plans listed

EXEC [dbo].[GetMemberInfo] 'Anderson' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%t%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Chen' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%e%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Barr' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'T%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Eflin' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'Tripp' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] '%s%' WITH RECOMPILE;
EXEC [dbo].[GetMemberInfo] 'YEONG' WITH RECOMPILE;
GO  -- what do you see?
    -- All but one (Tripp) is a clustered table scan

-- Choose to have SQL Server use a value that 
-- generates this more common plan and NOT 
-- sniff the value coming in. 

ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LastName
OPTION (OPTIMIZE 
    FOR (@LastName = 'Anderson'));
GO

EXEC [ProcedurePlans];
GO  -- Obviously, no plans listed

EXEC [dbo].[GetMemberInfo] 'Tripp';
GO  -- review the plan
    -- review the compiled value vs. runtime

EXEC [ProcedurePlans];
GO  -- Review that there's only one plan!

-- Everyone will use that plan
EXEC [dbo].[GetMemberInfo] '%t%';
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] '%e%';
EXEC [dbo].[GetMemberInfo] 'Barr';
EXEC [dbo].[GetMemberInfo] 'T%';
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] '%s%';
EXEC [dbo].[GetMemberInfo] 'YEONG';
EXEC [dbo].[GetMemberInfo] 'Anderson';
GO

-----------------------------------------------------
-- What if you didn't know a good value to use?
-- What if you could optimize for the AVERAGE
-- value... what does that even mean?
-----------------------------------------------------

-- Let's look at the distribution of the data
DBCC SHOW_STATISTICS (N'member', N'MemberLastName');
GO

-- The average number of rows returned for left-based
-- subsets of the index key can be calculated from
-- the middle result set (the density_vector):

-- Take the All density * Table_rows (from statistics_header) 	
-- For lastname the all density is 0.03703704	
-- For lastname, member_no the all density is 0.0001

SELECT 0.03703704 * 10000 AS [Average Rows for LastName]
    , 0.0001 * 10000 AS [Average Rows for combination];

-----------------------------------------------------
-- To use this average and tell SQL Server to SKIP 
-- parameter sniffing, use OPTION (OPTIMIZE FOR UNKNOWN)
-- Introduced in SQL Server 2008
-----------------------------------------------------

ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] LIKE @LastName
OPTION (OPTIMIZE FOR UNKNOWN);
GO  

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO  -- Uses an added HEURISTIC because of LIKE

ALTER PROCEDURE [dbo].[GetMemberInfo]
(
	@LastName	VARCHAR (30)
)
AS 
SET NOCOUNT ON;
SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[lastname] = @LastName
OPTION (OPTIMIZE FOR UNKNOWN);
GO

EXEC [ProcedurePlans];
GO  -- Obviously, no plans listed

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO  -- Gets the value directly from the 
    -- density_vector (370.37)

EXEC [ProcedurePlans];
GO  -- one execution

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO  -- review the plan
    -- review the compiled value vs. runtime

EXEC [ProcedurePlans];
GO  -- Review that there's only one plan!

-- Everyone will use that plan
EXEC [dbo].[GetMemberInfo] 'Chen';
EXEC [dbo].[GetMemberInfo] 'Barr';
EXEC [dbo].[GetMemberInfo] 'Tripp'; -- this plan might suffer
EXEC [dbo].[GetMemberInfo] 'Eflin';
EXEC [dbo].[GetMemberInfo] 'YEONG';
EXEC [dbo].[GetMemberInfo] 'Anderson';
GO