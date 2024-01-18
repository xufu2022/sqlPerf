USE [WiredBrainCoffee];
GO


-- Since we have an index on salesdate SQL should choose an index seek.
SELECT so.SalesDate
FROM Sales.SalesOrder so
WHERE so.SalesDate = '4/1/2022';
GO














-- This statement will use both seeks and scans.
SELECT so.SalesDate,
	sp.Email
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesPerson sp ON sp.Id = so.SalesPerson
WHERE so.SalesDate = '4/1/2022';
GO














-- Below we force SQL to not use a nonclustered index.
SELECT so.SalesDate,
	sp.Email
FROM Sales.SalesOrder so WITH (INDEX (0))
INNER JOIN Sales.SalesPerson sp ON sp.Id = so.SalesPerson
WHERE so.SalesDate = '4/1/2022';
GO
SELECT so.SalesDate,
	sp.Email
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesPerson sp ON sp.Id = so.SalesPerson
WHERE so.SalesDate = '4/1/2022';
GO












-- Here SQL performs a key lookup since the amount is not in the index.
SELECT so.SalesDate,
	so.SalesAmount
FROM Sales.SalesOrder so
WHERE so.SalesDate = '1/1/2022';
GO














-- Do we really need to order the data in the statement below?
SELECT sp.FirstName,
	sp.LastName,
	sp.StartDate
FROM Sales.SalesPerson sp
WHERE sp.IsActive = 1
ORDER BY sp.StartDate DESC;
GO