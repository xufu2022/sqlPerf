USE [AdventureWorksDW2012];
GO

-- "Fixing Gatekeeper Row Cardinality Estimate Issues" on
-- Simple Talk from Red Gate, http://bit.ly/GatekeeperRow

-- Options?
--     Predicate directly on Fact table?
--	      (drawback, surrogate key reliance!)
--     Nonclustered index with FORCESEEK (if necessary)
--     Columnstore index (doesn't solve, but works around issue)

-- Any ProductKey index on the fact table?
EXEC sp_helpindex 'FactInternetSales';

CREATE NONCLUSTERED INDEX [IX_FactInternetSales_ProductKey] ON 
[dbo].[FactInternetSales] ([ProductKey]);
GO

SELECT  [ProductKey]
FROM    [dbo].[DimProduct]
WHERE   [ListPrice] = 622.22;

-- Not for production use
DBCC DROPCLEANBUFFERS;
GO
 
SET STATISTICS IO ON;

SELECT  [p].[ProductLine] ,
        AVG([fis].[SalesAmount]) AS [AvgSalesAMT]
FROM    [dbo].[FactInternetSales] AS [fis]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [fis].[ProductKey] = [p].[ProductKey]
WHERE   [fis].[ProductKey] = 607
GROUP BY [p].[ProductLine]
ORDER BY [p].[ProductLine]
OPTION  ( RECOMPILE );
GO

SET STATISTICS IO OFF;

SELECT  COUNT(*) AS [BufferCount]
FROM    sys.[dm_os_buffer_descriptors] AS [dobd];

-- Cleanup
DROP INDEX [IX_FactInternetSales_ProductKey] ON 
[dbo].[FactInternetSales];
GO
