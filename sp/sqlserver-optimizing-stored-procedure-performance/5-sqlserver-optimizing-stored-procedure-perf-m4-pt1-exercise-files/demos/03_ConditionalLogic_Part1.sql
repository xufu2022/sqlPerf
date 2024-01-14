-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Conditional Logic - Part 1
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- Continue from previous demo

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- A common [attempted] solution to parameter sniffing
-- is to break up the logic into conditional / branching.
-- The CONCEPT is that SQL Server will only optimize
-- the correct statement at run time.

-- But, this script proves that this is WRONG!

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
IF @LastName NOT LIKE '%[_[[%]%'
    SELECT [m].* 
    FROM [dbo].[member] AS [m]
    WHERE [m].[lastname] = @LastName;
ELSE
    SELECT [m].* 
    FROM [dbo].[member] AS [m]
    WHERE [m].[lastname] LIKE @LastName;
GO

-- Turn Graphical Showplan on, plus:
SET STATISTICS IO ON;
GO

-- Execute a condition that should only execute
-- the IF condition (LIKE)

EXEC [dbo].[GetMemberInfo] 'Tripp';
GO  -- Uses an index

-- Next, execute a condition that will execute
-- the ELSE condition ( equality )
EXEC [dbo].[GetMemberInfo] '%e%';
GO  -- Here, we THOUGHT that this would be the
    -- first time optimizing this statement...
    -- However, it was already optimized using
    -- 'Tripp' 

EXEC [ProcedurePlans];
GO

-- Let's evict the plan and re-order the execution 
-- of the different parameters (and therefore the
-- statement blocks)

EXEC [sp_recompile] N'dbo.GetMemberInfo';
GO

EXEC [dbo].[GetMemberInfo] '%e%';
GO

EXEC [dbo].[GetMemberInfo] 'Tripp';
GO

-- Wait, what? That seemed to work?!
-- The selectivity of '%e%' in an EQUALITY case is "highly selective"
-- and so an index CAN be used for = even though a table scan is 
-- required for LIKE.

-- So, it seems like this works? Can we "prime cache" and / or force
-- certain plans into cache when we want to?

-- Wait - there might be a lot more to this!!

-- What about this:
EXEC [sp_recompile] N'dbo.GetMemberInfo';
GO

EXEC [dbo].[GetMemberInfo] 'Anderson';
GO

EXEC [dbo].[GetMemberInfo] 'Tri%';
GO

-- So the question we really have to ask ourselves - what do ALL
-- of the different parameter combinations REALLY look like?

-- Does that STATEMENT generate a CONSISTENT / STABLE plan?
-- Or, is the output wildly varying?

-- Is there a better way?