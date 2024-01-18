/*******************************************************************************
********************** Deactivation of an index     ****************************
********************************************************************************/

--You can disable an index to improve the time of insertions (really?)

USE [AdventureWorks2014]
GO

SET NOCOUNT ON

-- Create a new table
SELECT *
INTO [Sales].[DeleteSalesOrderDetail]
FROM [Sales].[SalesOrderDetail]
WHERE 1 = 2
GO
-- Insert  : 

INSERT INTO [Sales].[DeleteSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO


-- Creation of a clustered and non-clustered index on the table

ALTER TABLE [Sales].[DeleteSalesOrderDetail] 
	ADD CONSTRAINT [PK_DeleteSalesOrderDetail_SalesOrderID_DeleteSalesOrderDetailID] 
	PRIMARY KEY CLUSTERED 
	([SalesOrderID] ASC,
	[SalesOrderDetailID] ASC) ON [PRIMARY]
GO
-- Create Non-Clustered Index
CREATE NONCLUSTERED INDEX [IX_DeleteSalesOrderDetail_CarrierTrackingNumber] 
	ON [Sales].[DeleteSalesOrderDetail]
	([CarrierTrackingNumber] ASC) ON [PRIMARY]
GO


-- Activate the execution plan
SELECT [CarrierTrackingNumber]
FROM [Sales].[DeleteSalesOrderDetail]
WHERE [CarrierTrackingNumber] IS NOT NULL
GO

-- We see that it is a index non clustered which is solicited

-- Let's deactivate it :

ALTER INDEX [IX_DeleteSalesOrderDetail_CarrierTrackingNumber] 
ON [Sales].[DeleteSalesOrderDetail] DISABLE
GO

-- SELECT ? 

SELECT [CarrierTrackingNumber]
FROM [Sales].[DeleteSalesOrderDetail]
WHERE [CarrierTrackingNumber] IS NOT NULL
GO

-- We see that SQL has chosen the clustered index 
-- But how to reactivate it? 
-- No option in SSMS
-- We reactivate it by doing a rebuild 


ALTER INDEX [IX_DeleteSalesOrderDetail_CarrierTrackingNumber] ON [Sales].[DeleteSalesOrderDetail] 
REBUILD PARTITION = ALL 
GO

-- SELECT ? 

SELECT [CarrierTrackingNumber]
FROM [Sales].[DeleteSalesOrderDetail]
WHERE [CarrierTrackingNumber] IS NOT NULL
GO

-- The non-clustered index is used 
-- Test of insertion time 
-- Take the time with the index not deactivated

INSERT INTO [Sales].[DeleteSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO 50 -- 50 

-- Time 1 minute 10


-- TRUNCATE the table and deactivate the index 

TRUNCATE TABLE [Sales].[DeleteSalesOrderDetail]

ALTER INDEX [IX_DeleteSalesOrderDetail_CarrierTrackingNumber] 
ON [Sales].[DeleteSalesOrderDetail] DISABLE
GO

INSERT INTO [Sales].[DeleteSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO 50 -- 50 


-- you have to count also the time of the REBUILD index 

ALTER INDEX [IX_DeleteSalesOrderDetail_CarrierTrackingNumber] ON [Sales].[DeleteSalesOrderDetail] 
REBUILD PARTITION = ALL 
GO

-- 17 seconds  

-- So in this case we can see that we have a time saving, but be extremely vigilant because it can depend:
-- your DB recovery mode (simple, full, BULK LOGGUED)
-- the increment size of your logs (be large)
-- calculate the sum of the insertion and rebuild of lindex
-- try a SSIS :)

-- TEST TEST TEST !!!


