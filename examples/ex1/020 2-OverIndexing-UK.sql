/******************************************************************************
************          Over Indexing    ***************************************
*******************************************************************************/

USE [AdventureWorks2014]
GO

-- Create a new table : 
SELECT *
INTO [Sales].[NewDeleteSalesOrderDetail]
FROM [Sales].[DeleteSalesOrderDetail]
WHERE 1 = 1
GO

-- drop table [Sales].[NewDeleteSalesOrderDetail]

-- Activate  :

SET STATISTICS TIME ON
GO

-- How long to insert?

INSERT INTO [Sales].[NewDeleteSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[NewDeleteSalesOrderDetail]
GO

-- Time 375 Ms

-- We will empty the table and create 9 indexes on it...

TRUNCATE TABLE [Sales].[NewSalesOrderDetail]
GO

ALTER TABLE [Sales].[NewSalesOrderDetail] 
	ADD CONSTRAINT [PK_NewSalesOrderDetail_SalesOrderID_NewSalesOrderDetailID] 
	PRIMARY KEY CLUSTERED 
	([SalesOrderID] ASC,
	[SalesOrderDetailID] ASC) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_CarrierTrackingNumber] 
	ON [Sales].[NewSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_OrderQty] 
	ON [Sales].[NewSalesOrderDetail]
	([OrderQty] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_ProductID] 
	ON [Sales].[NewSalesOrderDetail]
	([ProductID] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_SpecialOfferID] 
	ON [Sales].[NewSalesOrderDetail]
	([SpecialOfferID] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_UnitPrice] 
	ON [Sales].[NewSalesOrderDetail]
	([UnitPrice] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_UnitPriceDiscount] 
	ON [Sales].[NewSalesOrderDetail]
	([UnitPriceDiscount] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_LineTotal] 
	ON [Sales].[NewSalesOrderDetail]
	([LineTotal] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_rowguid] 
	ON [Sales].[NewSalesOrderDetail]
	([rowguid] ASC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_NewSalesOrderDetail_ModifiedDate] 
	ON [Sales].[NewSalesOrderDetail]
	([ModifiedDate] ASC) ON [PRIMARY]
GO

-- And what happens during insertion? 

INSERT INTO [Sales].[NewSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO


-- Time 9 seconds...

TRUNCATE TABLE [Sales].[NewSalesOrderDetail]
GO

-- Clean up
DROP TABLE [Sales].[NewSalesOrderDetail]
GO

-- NEVER CREATE indexes for nothing, as this has an impact on :
-- The performance of your insertions
-- Maintenance time on your indexes (REBUILD)
-- Disk space 

-- Every index you create requires maintenance 
-- (it must be updated for every insert, update and delete operation)
-- and takes up space
-- If you have a highly transactional environment (10,000 insertions per minute)
-- I'll let you imagine the damage it can do ...
