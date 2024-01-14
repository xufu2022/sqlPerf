USE [AdventureWorksDW2012];
GO

-- Would an index on ListPrice help?
EXEC sp_helpindex 'DimProduct';

CREATE NONCLUSTERED INDEX [IX_DimProduct_ListPrice] ON 
[dbo].[DimProduct] ([ListPrice]);
GO

-- Not for production use
DBCC DROPCLEANBUFFERS;
GO
 
SELECT  COUNT(*) AS [BufferCount]
FROM    sys.[dm_os_buffer_descriptors] AS [dobd];

-- Include actual execution plan
SET STATISTICS IO ON;

SELECT  [p].[ProductLine] ,
        AVG([fis].[SalesAmount]) AS [AvgSalesAMT]
FROM    [dbo].[FactInternetSales] AS [fis]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [fis].[ProductKey] = [p].[ProductKey]
WHERE   [p].[ListPrice] = 622.22
GROUP BY [p].[ProductLine]
ORDER BY [p].[ProductLine];
GO

SET STATISTICS IO OFF;

SELECT  COUNT(*) AS [BufferCount]
FROM    sys.[dm_os_buffer_descriptors] AS [dobd];