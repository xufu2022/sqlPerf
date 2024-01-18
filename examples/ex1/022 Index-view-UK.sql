/*******************************************************************************
**************************   Creating an indexed view      ********************
********************************************************************************/

-- In principle, a view does not contain data. But the purpose of an indexed or materialized view
-- is to store the results of the view in an index. 
-- This is particularly useful when you want to query on very remote data 
-- This is particularly useful when you want to query on very distant data 
-- (crossing a large number of tables by joins) or even more, 
-- This is particularly interesting when you want to query on very distant data 
-- (crossing a large number of tables by joins) or even more, for aggregated data (SUM, COUNT in particular).

-- The creation of a single cluster index on a view improves query performance, 
-- because the view is stored in the database in the same way as a table with a cluster index.

-- Indexed views are probably the biggest performance enhancers in SQL Server. 
-- They are used on "DataWarehouse" type databases, 
-- i.e., mostly read-only databases with complex queries that cannot be optimized in conventional ways 
-- (many aggregates and/or joins).

USE AdventureWorks2014
GO

-- i.e. you can't create a non-clustered index on a view, as long as it's not clustered
-- Tables must be unambiguous (prefixed by their schema)

-- Creation of the view :

IF OBJECT_ID ('Sales.vOrders', 'view') IS NOT NULL  
DROP VIEW Sales.vOrders ;  
GO  
CREATE VIEW Sales.vOrders  
-- WITH SCHEMABINDING  
AS  
    SELECT SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Revenue,  
        OrderDate, ProductID, COUNT_BIG(*) AS COUNT  
    FROM Sales.SalesOrderDetail AS od, Sales.SalesOrderHeader AS o  
    WHERE od.SalesOrderID = o.SalesOrderID  
    GROUP BY OrderDate, ProductID;  
GO  

-- SELECT ? 

SET STATISTICS IO ON 

SELECT * FROM sales.vOrders

--Table 'SalesOrderHeader'. Number of analyses 5, logical readings 722
--Table 'SalesOrderDetail'. Number of analyses 5, logical readings 1311

--Creation of the index on the view : 
  
CREATE CLUSTERED INDEX IDX_V1   
    ON Sales.vOrders (OrderDate, ProductID);  

-- Error message 
-- In this case, the view must be "Materialised" using the WITH SCHEMABINDING option  
-- Recreate the view 


ALTER  VIEW Sales.vOrders  
WITH SCHEMABINDING  
AS  
    SELECT SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Revenue,  
        OrderDate, ProductID, COUNT_BIG(*) AS COUNT  
    FROM Sales.SalesOrderDetail AS od, Sales.SalesOrderHeader AS o  
    WHERE od.SalesOrderID = o.SalesOrderID  
    GROUP BY OrderDate, ProductID;  
GO

--Creation of the index on the view : 
  
CREATE NONCLUSTERED INDEX IDX_V1   
    ON Sales.vOrders (OrderDate, ProductID);    

-- You have to create an index cluster first...

CREATE CLUSTERED INDEX IDX_V1   
    ON Sales.vOrders (OrderDate, ProductID);  
	
-- Decidedly, a UNIQUE index must be created 	 
 
CREATE UNIQUE CLUSTERED INDEX IDX_V1   
    ON Sales.vOrders (OrderDate, ProductID);  

-- This is good

-- What does the SELECT do? 	 

SET STATISTICS IO ON 

SELECT * FROM sales.vOrders

-- Table 'vOrders'. Number of scans 1, logical reads 155

