USE [Credit];
GO

-- Include actual execution plan
-- Harmless example where the Query Optimizer figures it out
SET STATISTICS IO ON;

SELECT  DISTINCT 
		[member_no], [lastname], [firstname], [middleinitial],
		[street], [city], [state_prov]
FROM dbo.[member] AS m;

SELECT  [member_no], [lastname], [firstname], [middleinitial], [street],
        [city], [state_prov]
FROM dbo.[member] AS m;

SET STATISTICS IO OFF;


-- Example where WE know the data is (likely) unique, but the
-- Query Optimizer does not
SET STATISTICS IO ON;

-- Include Actual Execution Plan
SELECT  DISTINCT 
		[lastname], [firstname], [middleinitial],
		[street], [city], [state_prov]
FROM dbo.[member] AS m;

SELECT  [lastname], [firstname], [middleinitial], [street],
        [city], [state_prov]
FROM dbo.[member] AS m;

SET STATISTICS IO OFF;

-- Takeaways:
-- Use DISTINCT when it is actually needed
-- Sometimes DISTINCT is used to hide duplicates from an
-- incorrect query design