-- Use this script to follow along with the demo.
USE WiredBrainCoffee;
GO

-- Let's create some helpful indexes.
CREATE NONCLUSTERED INDEX IX_SalesOrder_SalesDate ON Sales.SalesOrder(SalesDate); 
CREATE NONCLUSTERED INDEX IX_SalesOrder_SalesPersonId ON Sales.SalesOrder(SalesPerson);
CREATE NONCLUSTERED INDEX IX_SalesOrder_TerritoryId ON Sales.SalesOrder(SalesTerritory);
CREATE NONCLUSTERED INDEX IX_SalesPerson_Email ON Sales.SalesPerson(Email);
GO

/*
1) What's this query used for?
Sally uses this query to pull sales data for territories that are part of the North American Group.
The sales orders need to be in the In Progress status. She needs all the salesperson information included. The report should consist of orders from 2021.
*/

-- Please do not run this command in production.
DBCC DROPCLEANBUFFERS;
GO

-- Only the date filter is applied in the statement below.
SELECT *
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesTerritory st ON so.SalesTerritory = st.Id
INNER JOIN Sales.SalesPerson sp ON so.SalesPerson = sp.Id
INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
INNER JOIN Sales.SalesOrderStatus sos ON sos.Id = so.SalesOrderStatus
WHERE so.SalesDate >= '1/01/2021'
	AND so.SalesDate <= '12/31/2021'
ORDER BY so.SalesDate,
	so.SalesAmount DESC;
GO




-- Please do not run this command in production.
DBCC DROPCLEANBUFFERS

-- The statement below has the Date, and Sales Territory filters applied.
SELECT *
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesTerritory st ON so.SalesTerritory = st.Id
INNER JOIN Sales.SalesPerson sp ON so.SalesPerson = sp.Id
INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
INNER JOIN Sales.SalesOrderStatus sos ON sos.Id = so.SalesOrderStatus
WHERE so.SalesDate >= '1/01/2019'
	AND so.SalesDate <= '12/31/2019'
	AND st.[Group] = 'North America'
ORDER BY so.SalesDate,
	so.SalesAmount DESC;
GO





-- Please do not run this command in production.
DBCC DROPCLEANBUFFERS;

-- All of the filters are applied below.
SELECT *
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesTerritory st ON so.SalesTerritory = st.Id
INNER JOIN Sales.SalesPerson sp ON so.SalesPerson = sp.Id
INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
INNER JOIN Sales.SalesOrderStatus sos ON sos.Id = so.SalesOrderStatus
WHERE so.SalesDate >= '1/01/2019'
	AND so.SalesDate <= '12/31/2019'
	AND st.[Group] = 'North America'
	AND sos.StatusName = 'In Progress'
ORDER BY so.SalesDate,
	so.SalesAmount DESC;
GO




-- Please do not run this command in production.
DBCC DROPCLEANBUFFERS;

-- The statement below removes the Order By clause.
SELECT *
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesTerritory st ON so.SalesTerritory = st.Id
INNER JOIN Sales.SalesPerson sp ON so.SalesPerson = sp.Id
INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
INNER JOIN Sales.SalesOrderStatus sos ON sos.Id = so.SalesOrderStatus
WHERE so.SalesDate >= '1/01/2019'
	AND so.SalesDate <= '12/31/2019'
	AND st.[Group] = 'North America'
	AND sos.StatusName = 'In Progress';
GO