USE [WiredBrainCoffee];
GO


-- Pre 2016 method to check if it exists.
IF OBJECT_ID('Sales.GenerateSalesReport', 'P') IS NULL
   EXECUTE ('CREATE PROCEDURE Sales.GenerateSalesReport AS SELECT 1;')
GO
ALTER PROCEDURE [Sales].[GenerateSalesReport]
-- Replace with some cool code.
AS;
GO




-- Simply drop it if exists but we lose permissions.
IF OBJECT_ID('Sales.GenerateSalesReport', 'P') IS NOT NULL
DROP PROCEDURE [Sales].[GenerateSalesReport];
GO





CREATE PROCEDURE [Sales].[GenerateSalesReport]
AS
SELECT 1;
GO




-- This is much better.
CREATE OR ALTER PROCEDURE [Sales].[GenerateSalesReport]
AS
BEGIN
SELECT 1;
-- Insert some flashy commands here.
END;
GO




CREATE OR ALTER PROCEDURE [Sales].[GenerateSalesReport]
AS
BEGIN
SELECT CONCAT(sp.[LastName], ', ',sp.[FirstName]) AS 'SalesPersonName',
	   sp.[Email] AS 'SalesPersonEmail',
	   spl.[LevelName] AS 'SalesPersonLevel',
	   SUM(so.SalesAmount) AS 'SalesAmount',
	   MAX(so.SalesDate) AS 'OrderDate'
FROM [Sales].[SalesPerson] sp
INNER JOIN [Sales].[SalesOrder] so ON so.SalesPerson = sp.Id
INNER JOIN [Sales].[SalesPersonLevel] spl ON sp.[LevelId] = spl.[Id]
GROUP BY sp.[LastName],sp.[FirstName],sp.[Email],spl.[LevelName];
END
GO




-- Will this even work?
EXECUTE [GenerateSalesReport];
GO




-- Much better!
EXECUTE [Sales].[GenerateSalesReport];
GO




-- Does this work?
[Sales].[GenerateSalesReport];
GO




-- Does this even work?
SELECT 1;
[Sales].[GenerateSalesReport];
GO




-- There is nothing wrong with shorthand.
EXEC [Sales].[GenerateSalesReport];
GO