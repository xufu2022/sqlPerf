USE WiredBrainCoffee;
GO

-- Let's expand the first 10,000 rows in the SalesOrders for OrderDescription.
UPDATE Sales.SalesOrder
SET OrderDescription = REPLICATE(OrderDescription, 400)
WHERE Id < 10001;
GO



-- Please do not run this command in Production.
DBCC DROPCLEANBUFFERS;
GO

-- Query 1
-- In the statement below, we select all the columns.
SELECT *
FROM Sales.SalesOrder so
WHERE so.Id < 10001;
GO










-- Query 2
-- Please do not run this command in Production.
DBCC DROPCLEANBUFFERS;
GO

-- In this statement, we only select two columns.
SELECT so.SalesDate,
	so.SalesAmount
FROM Sales.SalesOrder so
WHERE so.Id < 10001;
GO