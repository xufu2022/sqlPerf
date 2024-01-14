-- Pre-size your database to reduce auto-growth operations
USE [master];
GO
ALTER DATABASE [AdventureWorksDW2012] 
MODIFY FILE ( NAME = N'AdventureWorksDW2012_Data', 
SIZE = 10485760KB, FILEGROWTH = 1048576KB );
GO

ALTER DATABASE [AdventureWorksDW2012] 
MODIFY FILE ( NAME = N'AdventureWorksDW2012_Log', 
SIZE = 1048576KB , FILEGROWTH = 1048576KB );
GO

-- Current row count in FactInternetSales
USE [AdventureWorksDW2012];
GO

SELECT COUNT(*) 
FROM [dbo].[FactInternetSales];
GO

ALTER TABLE [dbo].[FactInternetSalesReason] 
DROP CONSTRAINT [FK_FactInternetSalesReason_FactInternetSales];
GO

ALTER TABLE [dbo].[FactInternetSales] 
DROP CONSTRAINT
	[PK_FactInternetSales_SalesOrderNumber_SalesOrderLineNumber];
GO

-- Drop additional nonclustered indexes, to minimize QO surface
-- area
DROP INDEX [IX_FactIneternetSales_ShipDateKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_CurrencyKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_CustomerKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_DueDateKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_OrderDateKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_ProductKey] 
ON [dbo].[FactInternetSales];
GO

DROP INDEX [IX_FactInternetSales_PromotionKey] 
ON [dbo].[FactInternetSales];
GO

-- Creating a clustered index with PAGE data compression
CREATE CLUSTERED INDEX [CI_FactInternetSales_OrderDateKey] 
ON [dbo].[FactInternetSales]
(
	[OrderDateKey] ASC
)WITH (DATA_COMPRESSION = PAGE) 
ON [PRIMARY];
GO

-- Increase the number of rows by changing the executions
-- below
SET NOCOUNT ON;

INSERT  [dbo].[FactInternetSales]
        ( [ProductKey] ,
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
        )
        SELECT  [f].[ProductKey] ,
                [f].[OrderDateKey] ,
                [f].[DueDateKey] ,
                [f].[ShipDateKey] ,
                [f].[CustomerKey] ,
                [f].[PromotionKey] ,
                [f].[CurrencyKey] ,
                [f].[SalesTerritoryKey] ,
                LEFT(CAST(NEWID() AS NVARCHAR(36)), 20) ,
                [f].[SalesOrderLineNumber] ,
                [f].[RevisionNumber] ,
                [f].[OrderQuantity] ,
                [f].[UnitPrice] ,
                [f].[ExtendedAmount] ,
                [f].[UnitPriceDiscountPct] ,
                [f].[DiscountAmount] ,
                [f].[ProductStandardCost] ,
                [f].[TotalProductCost] ,
                [f].[SalesAmount] ,
                [f].[TaxAmt] ,
                [f].[Freight] ,
                [f].[CarrierTrackingNumber] ,
                [f].[CustomerPONumber] ,
                [f].[OrderDate] ,
                [f].[DueDate] ,
                [f].[ShipDate]
        FROM    [dbo].[FactInternetSales] AS [f];
GO 8 -- Change this based on your test environment storage and 
-- time you want to wait (Row count = 15,461,888, 14 minutes)


