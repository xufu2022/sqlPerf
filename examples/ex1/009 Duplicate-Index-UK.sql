/******************************************************************************
************          Duplicate INDEX    **************************************
*******************************************************************************/

USE [AdventureWorks2014]
GO

SET NOCOUNT ON

-- Create a new table

SELECT *
INTO [Sales].[DupSalesOrderDetail]
FROM [Sales].[SalesOrderDetail]
WHERE 1 = 2
GO

-- Activate STATISTICS
SET STATISTICS TIME ON
SET STATISTICS IO ON
GO

-- Insertion time : 

INSERT INTO [Sales].[DupSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO 5 -- 5 times

-- Truncate 
TRUNCATE TABLE [Sales].[DupSalesOrderDetail]
GO


CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber1] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber2] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber3] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber4] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber5] 
	ON [Sales].[DupSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO


-- Insert again : 

INSERT INTO [Sales].[DupSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO 5

-- Clean up
DROP TABLE [Sales].[DupSalesOrderDetail]
GO

-- Like over-indexing indexes for nothing, don't create indexes for nothing... as this has an impact on :
-- The performance of your insertions
-- Maintenance time on your indexes (REBUILD)
-- Disk space 

-- I've seen identical indexes in PROD...hopefully DMVs can identify them :)
