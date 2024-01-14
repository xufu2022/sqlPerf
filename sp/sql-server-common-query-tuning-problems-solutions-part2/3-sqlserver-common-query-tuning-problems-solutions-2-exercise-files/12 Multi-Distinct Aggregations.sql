USE [Credit];
GO

-- Include actual execution plan
SET STATISTICS IO ON;

SELECT
    SUM([charge_amt]) AS [Total_Charge_Amt] ,
    AVG([charge_amt]) AS [Avg_Charge_Amt]
FROM
    [dbo].[charge] AS [c];

SET STATISTICS IO OFF;
GO

-- Include actual execution plan
-- Pre SQL Server 2012 behavior
SET STATISTICS IO ON;

SELECT
    SUM([charge_amt]) AS [Total_Charge_Amt] ,
    COUNT(DISTINCT [charge_amt]) AS [Distinct_Charge_Amt]
FROM
    [dbo].[charge] AS [c]
OPTION (RECOMPILE, QUERYRULEOFF ReduceForDistinctAggs);
-- QUERYRULEOFF is undocumented and not supported by MSFT

SET STATISTICS IO OFF;
GO

-- 2012 (and higher) behavior
SET STATISTICS IO ON;

SELECT
    SUM([charge_amt]) AS [Total_Charge_Amt] ,
    COUNT(DISTINCT [charge_amt]) AS [Distinct_Charge_Amt]
FROM
    [dbo].[charge] AS [c]
OPTION
    ( RECOMPILE );

SET STATISTICS IO OFF;
GO

-- 2012 (and higher) behavior, multiple DISTINCT aggs
SET STATISTICS IO ON;

SELECT
    SUM([charge_amt]) AS [Total_Charge_Amt] ,
    COUNT(DISTINCT [charge_amt]) AS [Distinct_Charge_Amt] ,
    COUNT(DISTINCT [statement_no]) AS [Distinct_Statement_No]
FROM
    [dbo].[charge] AS [c]
OPTION
    ( RECOMPILE );

SET STATISTICS IO OFF;
GO