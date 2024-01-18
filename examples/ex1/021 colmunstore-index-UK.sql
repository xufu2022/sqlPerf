/*******************************************************************************
********************** columstore Index   **************************************
********************************************************************************/

--Indexes not sorted by row, but by column.
--Appeared in SQL Server 2012.
--Will be more used for very consuming queries, more BI oriented, on fact tables (Datawarehouse).
--Will use compression, and will therefore save space.
--New execution mode: Batch mode.


-- Batch mode, instead of processing row by row like a traditional index, will process by block of rows.
-- The data is stored by columns on the disk, only the columns you need are extracted 
-- from the disk into memory


-- Download in this course and restore the DB AdventureWorksDW2016

restore database AdventureWorksDW2016 from disk ='D:\AdventureWorksDW2016.bak'
with replace, 
move 'AdventureWorksDW2014_Data' to 'd:\data\AdventureWorksDW2014_Data.mdf',
move 'AdventureWorksDW2014_log' to 'd:\data\AdventureWorksDW2014_Data.ldf'


USE [AdventureWorksDW2016]
GO
-- No. of lines :

SELECT  COUNT(*) AS [rowcount]
FROM    dbo.[FactInternetSales];
GO

-- create an index columstore 
CREATE NONCLUSTERED COLUMNSTORE INDEX [NCI_FactInternetSales] ON [dbo].[FactInternetSales]
(
	[ProductKey],
	[OrderDateKey],
	[DueDateKey],
	[ShipDateKey],
	[CustomerKey],
	[PromotionKey],
	[CurrencyKey],
	[SalesTerritoryKey],
	[SalesOrderNumber],
	[SalesOrderLineNumber],
	[RevisionNumber],
	[OrderQuantity],
	[UnitPrice],
	[ExtendedAmount],
	[UnitPriceDiscountPct],
	[DiscountAmount],
	[ProductStandardCost],
	[TotalProductCost],
	[SalesAmount],
	[TaxAmt],
	[Freight],
	[CarrierTrackingNumber],
	[CustomerPONumber],
	[OrderDate],
	[DueDate],
	[ShipDate]
)WITH (DROP_EXISTING = OFF) ON [PRIMARY]
GO

-- What does the result of this query look like with the execution plan: 

SELECT  p.[ProductLine],
		f.[SalesTerritoryKey],
		f.[CustomerKey],
        AVG(f.[SalesAmount]) AS [AvgSalesAmount],
        SUM(f.[SalesAmount]) AS [TotalSalesAmount]
FROM    dbo.[FactInternetSales] AS [f]
INNER JOIN dbo.[DimProduct] AS [p]
        ON f.[ProductKey] = p.[ProductKey]
WHERE   p.[Size] IS NOT NULL AND
		f.[UnitPriceDiscountPct] = 0
GROUP BY p.[ProductLine], f.[SalesTerritoryKey], f.[CustomerKey]
ORDER BY p.[ProductLine], f.[SalesTerritoryKey], f.[CustomerKey]
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);
GO

-- The query does an Index SCAN on the clustered

-- Let's clear the cache
DBCC DROPCLEANBUFFERS;

-- rerun the query and see the execution plan 

SELECT  p.[ProductLine],
		f.[SalesTerritoryKey],
		f.[CustomerKey],
        AVG(f.[SalesAmount]) AS [AvgSalesAmount],
        SUM(f.[SalesAmount]) AS [TotalSalesAmount]
FROM    dbo.[FactInternetSales] AS [f]
INNER JOIN dbo.[DimProduct] AS [p]
        ON f.[ProductKey] = p.[ProductKey]
WHERE   p.[Size] IS NOT NULL AND
		f.[UnitPriceDiscountPct] = 0
GROUP BY p.[ProductLine], f.[SalesTerritoryKey], f.[CustomerKey]
ORDER BY p.[ProductLine], f.[SalesTerritoryKey], f.[CustomerKey];
GO
-- 1 second.
-- You can see in the execution plan the batch mode
-- Index with INCLUDE and COLUMNSTORE ? 

SELECT  p.[ProductLine],
        SUM(f.SalesAmount) AS [TotalSalesAmount]
FROM    [dbo].[FactInternetSales] AS [f]
INNER JOIN [dbo].[DimProduct] AS [p]
        ON f.[ProductKey] = p.[ProductKey]
GROUP BY p.[ProductLine]
ORDER BY p.[ProductLine];

SELECT  p.[ProductLine],
        SUM(f.SalesAmount) AS [TotalSalesAmount]
FROM    [dbo].[FactInternetSales] AS [f]
INNER JOIN [dbo].[DimProduct] AS [p]
        ON f.[ProductKey] = p.[ProductKey]
GROUP BY p.[ProductLine]
ORDER BY p.[ProductLine]
OPTION (IGNORE_NONCLUSTERED_COLUMNSTORE_INDEX);

