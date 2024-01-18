/*******************************************************************************
********************** UNIQUE INDEX     ****************************************
********************************************************************************/

-- Be careful when creating a UNIQUE constraint, this creates by default a NON CLUSTERED index
-- As a reminder, UNIQUE = no duplicate but which accepts NULLs
-- It is one of the best practices to create a unique index, on columns with unique values


USE [AdventureWorks2014]
GO

SET NOCOUNT ON

-- Creation de la table et insertion de données :
SELECT *
INTO [Sales].[UniSalesOrderDetail]
FROM [Sales].[SalesOrderDetail]
WHERE 1 = 2
GO

INSERT INTO [Sales].[UniSalesOrderDetail]
([SalesOrderID],[CarrierTrackingNumber],[OrderQty]
,[ProductID],[SpecialOfferID],[UnitPrice]
,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate])
SELECT	[SalesOrderID],[CarrierTrackingNumber],[OrderQty]
		,[ProductID],[SpecialOfferID],[UnitPrice]
		,[UnitPriceDiscount],[LineTotal],[rowguid],[ModifiedDate]
FROM [Sales].[SalesOrderDetail]
GO

-- Select avec un DISTINCT avec activation du plan d'execution:

SELECT [SalesOrderDetailID]
FROM [Sales].[UniSalesOrderDetail]
GO
SELECT DISTINCT [SalesOrderDetailID]
FROM [Sales].[UniSalesOrderDetail] 
GO

-- Rajout de la contrainte Unique sur la table 

ALTER TABLE [Sales].[UniSalesOrderDetail] 
ADD CONSTRAINT [UX_UniSalesOrderDetail_SalesOrderDetailID] 
UNIQUE -- On peut rajouter aussi NONCLUSTERED
(
[SalesOrderDetailID]
) ON [PRIMARY]
GO

-- Que donne le SELECT ? 

SELECT [SalesOrderDetailID]
FROM [Sales].[UniSalesOrderDetail]
GO
SELECT DISTINCT [SalesOrderDetailID]
FROM [Sales].[UniSalesOrderDetail] 
GO

-- Ou sinon on peut l'unicité via l'index 

CREATE UNIQUE NONCLUSTERED INDEX
[IX_UniSalesOrderDetail_SalesOrderDetailID] 
ON [Sales].[UniSalesOrderDetail] 
(
[SalesOrderDetailID]
) ON [PRIMARY]
GO
--  SSMS >> Database >> Table >> Constraints
--  SSMS >> Database >> Table >> Indexes 
-- Clean up
DROP TABLE [Sales].[UniSalesOrderDetail]
GO