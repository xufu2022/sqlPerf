USE WiredBrainCoffee;
GO

-- Query 1
-- This statement applies a CONVERT function to the SalesDate column.
SELECT so.SalesDate,
	so.Id,
	so.SalesAmount
FROM Sales.SalesOrder so
WHERE CONVERT(CHAR(10),so.SalesDate,121) = '2019-03-03';
GO


















-- Query 2
-- This statement applies a LOWER function to the email address.
SELECT Id
FROM Sales.SalesPerson sp
WHERE LOWER(sp.Email) = 'Sally.Friend21@WiredBrainCoffee.com';
GO




















-- Query 3
-- Using a LTRIM & RTRIM will invalidate a seek on our index.
SELECT sp.Id,
	sp.Email
FROM Sales.SalesPerson sp
WHERE LTRIM(RTRIM((sp.Email))) = 'Sally.Friend21@WiredBrainCoffee.com';
GO


















-- Query 4
-- Using a like operator with a wild card on the left causes a table scan.
SELECT so.Id FROM Sales.SalesOrder so
WHERE so.Id LIKE '%500';
GO