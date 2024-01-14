USE [AdventureWorksDW2012];
GO

-- Let's create a new version of FactInternetSales
SELECT  [ProductKey] ,
        [OrderDateKey] ,
        [DueDateKey] ,
        [ShipDateKey] ,
        [CustomerKey] ,
        [PromotionKey] ,
        [CurrencyKey] ,
        [SalesTerritoryKey] ,
        [SalesOrderNumber] ,
        [SalesOrderLineNumber] ,
        [RevisionNumber] ,
        [OrderQuantity] ,
        [UnitPrice] ,
        [ExtendedAmount] ,
        [UnitPriceDiscountPct] ,
        [DiscountAmount] ,
        [ProductStandardCost] ,
        [TotalProductCost] ,
        [SalesAmount] ,
        [TaxAmt] ,
        [Freight] ,
        [CarrierTrackingNumber] ,
        [CustomerPONumber] ,
        [OrderDate] ,
        [DueDate] ,
        [ShipDate]
INTO  [dbo].[FactInternetSalesv2]
FROM [dbo].[FactInternetSales];

-- Not for production use
-- Simulating cold cache
DBCC DROPCLEANBUFFERS;
GO

-- Include actual execution plan
SET STATISTICS TIME ON;

SELECT  [p].[ProductLine] ,
        AVG([fis].[SalesAmount]) AS [AvgSalesAMT] ,
        SUM([fis].[SalesAmount]) AS [TotalSalesAMT]
FROM    [dbo].[FactInternetSalesv2] AS [fis]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [fis].[ProductKey] = [p].[ProductKey]
GROUP BY [p].[ProductLine]
ORDER BY [p].[ProductLine];
GO

SET STATISTICS TIME OFF;

-- SQL Server 2012 introduced Nonclustered Columnstore Indexes
--		See the PS course: 
--		"SQL Server 2012: Nonclustered Columnstore Indexes"
--		http://bit.ly/NCIcolumnstore 

-- SQL Server 2014 introduces clustered columnstore indexes
-- Several performance advantages and some tradeoffs

-- For a distilled overview, see the blog post:
-- "SQL Server 2014 Updatable Columnstore Index" by Microsoft's
-- Shep Sheppard
-- http://bit.ly/ShepColumnstore 

CREATE CLUSTERED COLUMNSTORE INDEX
	[CI_FactInternetSales_OrderDateKey]
ON [dbo].[FactInternetSalesv2];
GO

-- Not for production use
-- Simulating cold cache
DBCC DROPCLEANBUFFERS;
GO

-- Include actual execution plan
SET STATISTICS TIME ON;

SELECT  [p].[ProductLine] ,
        AVG([fis].[SalesAmount]) AS [AvgSalesAMT] ,
        SUM([fis].[SalesAmount]) AS [TotalSalesAMT]
FROM    [dbo].[FactInternetSalesv2] AS [fis]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [fis].[ProductKey] = [p].[ProductKey]
GROUP BY [p].[ProductLine]
ORDER BY [p].[ProductLine];
GO

SET STATISTICS TIME OFF;

-- Cleanup
DROP TABLE [dbo].[FactInternetSalesv2];
GO
