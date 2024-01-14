-- Reverting to the original-sized database
USE [AdventureWorksDW2012];
GO

-- Current database compatibility level?
SELECT  [compatibility_level]
FROM    [sys].[databases] AS [d]
WHERE   [name] = 'AdventureWorksDW2012';

-- Running in < 120 mode
-- Include actual execution plan

-- Query adapted from the white paper
-- "Optimizing Your Query Plans with the 
-- SQL Server 2014 Cardinality Estimator" 
-- http://bit.ly/SackCEPaper

-- Distinct Sort estimate?
SELECT  [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
FROM    dbo.[FactInternetSales] AS [f]
        INNER JOIN dbo.[DimDate] AS [d]
        ON [f].[OrderDateKey] = [d].[DateKey]
WHERE   [f].[ProductKey] = 310
GROUP BY [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
OPTION  ( MAXDOP 1 );

-- Let's add an M2M relationship
-- Distinct Sort estimate?
SELECT  [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
FROM    dbo.[FactInternetSales] AS [f]
        INNER JOIN dbo.[DimDate] AS [d]
        ON [f].[OrderDateKey] = [d].[DateKey]
        INNER JOIN dbo.[FactProductInventory] AS [fi]
        ON [fi].[DateKey] = [d].[DateKey]
WHERE   [f].[ProductKey] = 310
GROUP BY [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
OPTION  ( MAXDOP 1 );

-- Running in 120 mode
USE [master];
GO
ALTER DATABASE [AdventureWorksDW2012] 
SET COMPATIBILITY_LEVEL = 120;
GO

USE [AdventureWorksDW2012];
GO

SELECT  [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
FROM    dbo.[FactInternetSales] AS [f]
        INNER JOIN dbo.[DimDate] AS [d]
        ON [f].[OrderDateKey] = [d].[DateKey]
WHERE   [f].[ProductKey] = 310
GROUP BY [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
OPTION  ( MAXDOP 1 );

-- Let's add an M2M relationship
-- The aggregate estimates with the new CE?
SELECT  [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
FROM    dbo.[FactInternetSales] AS [f]
        INNER JOIN dbo.[DimDate] AS [d]
        ON [f].[OrderDateKey] = [d].[DateKey]
        INNER JOIN dbo.[FactProductInventory] AS [fi]
        ON [fi].[DateKey] = [d].[DateKey]
WHERE   [f].[ProductKey] = 310
GROUP BY [f].[CustomerKey] ,
        [d].[DayNumberOfYear]
OPTION  ( MAXDOP 1 );

-- Cleanup
USE [master];

ALTER DATABASE [AdventureWorksDW2012] 
SET COMPATIBILITY_LEVEL = 110;
GO


