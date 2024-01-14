-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Creation, Compilation, and Invalidation
--   Demo: Plan Invalidation and Statistics - Part 2
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- Continue from previous demo

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- This series of executions will focus on when plans
-- are invalidated by data changes (and changes to
-- statistics). 

USE [Credit];
GO

-- Now, let's simulate a VERY un-even update...
UPDATE [dbo].[statement]
    SET [member_no] = 2
WHERE [statement_no] % 37 = 0;
GO  -- 786 rows 

SELECT * 
FROM [sys].[dm_db_stats_properties] (OBJECT_ID(N'statement'), 2);
GO  -- shows that they KNOW how many rows have changed
    -- it's OVER the threshold of 20% (plus min of 500)
    -- Invalidation threshold = (n * 20%) = 4000 + 500 = 4500
    -- Modification_counter = 786 (or just under 3% of ~29K)

-- Turn on showplan and statistics IO
SET STATISTICS IO ON;
GO

-- Execute the procedure 
EXEC [GetCharges] 1234;
GO  -- Nothing really changes for that value
    -- Uses an index and does very few I/Os
    -- Table 'statement'. Scan count 1, logical reads 8


EXEC [GetCharges] 5678;
GO  -- Again, nothing really changes for that value
    -- Uses an index and does very few I/Os
    -- Table 'statement'. Scan count 1, logical reads 8

-- What about member_no = 2 ??
EXEC [GetCharges] 2; 
GO  -- Same plan... but, WAY more I/Os
    -- Estimated number of rows: 2.65429
    -- Actual number of rows: 788
    -- Table 'statement'. Scan count 1, logical reads 1579

-- Now we think... oh, that's a bad plan... must be 
-- statistics...

UPDATE STATISTICS [dbo].[statement] [statement_member_link];
GO

-- What about member_no = 2 ??
EXEC [GetCharges] 2; 
GO  -- DIFFERENT plan... WAY LESS I/Os
    -- Estimated number of rows: 788
    -- Actual number of rows: 788
    -- Table 'statement'. Scan count 1, logical reads 158

-- So, we think the problem is solved...
-- maybe it even feels that way?

-- Confirm the new plan change:
EXEC [ProcedurePlans];
GO	-- Notice that statement 3 got a new plan
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  7	                1	            7
    --  7	                1	            7
    --  7	                *3*	            *1*

-- Where did that estimate come from:
DBCC SHOW_STATISTICS (N'statement', N'statement_member_link');
GO  -- 2 is so atypical that it has its own step
    -- for relatively small sets, that can happen!

-- What if I go back to:
EXEC [GetCharges] 5678;
GO  -- Clustered index scan... 
    -- Estimated number of rows: 788
    -- Actual number of rows: 3
    -- Table 'statement'. Scan count 1, logical reads 158

-- Er... maybe we need to update stats again?
UPDATE STATISTICS [dbo].[statement] [statement_member_link];
GO

EXEC [GetCharges] 5678;
GO  -- NOTHING CHANGED???
    -- Why?

-- Did they get updated?
DBCC SHOW_STATISTICS (N'statement', N'statement_member_link');
GO     -- Yes - look at the time!

-- In 2012 and higher, plans don't get invalidated if NO
-- data changed... (reducing this particular false positive)

EXEC [GetCharges] 5678 WITH RECOMPILE;
GO  -- yep, the optimal plan is to use an index

EXEC [GetCharges] 5678;
GO  -- still doing the scan...
    
EXEC [ProcedurePlans];
GO	-- Notice that statement 3 got a new plan
    -- ProcedureExecutes	VersionOfPlan	ExecutionsOfCurrentPlan
    --  10	                1	            10
    --  10	                1	            10
    --  10	                *3*	            *4*

-- UPDATE STATISTICS is NOT the right solution here
-- The problem isn't the currency of the statistics
-- it's the distribution of the data and the fact
-- that the optimal plan varies based on parameters

-- More on the RIGHT solution coming up!!

