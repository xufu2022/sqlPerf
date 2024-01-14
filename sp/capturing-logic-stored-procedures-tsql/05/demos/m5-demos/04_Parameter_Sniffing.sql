USE [WiredBrainCoffee];
GO




-- Please do not run this in production!
DBCC FREEPROCCACHE;
GO




CREATE OR ALTER PROCEDURE [Sales].[GenerateSalesReport]
@StartDate date,
@EndDate date
AS
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount'
	   ,spl.[LevelName] AS 'Level'
	   ,CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName'
	   ,YEAR(so.[SalesDate]) AS 'SalesYear'
	   ,MONTH(so.[SalesDate]) AS 'SalesMonth'
	   ,so.[SalesOrderStatus] AS 'StatusId'
FROM [Sales].[SalesPerson] sp
INNER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
INNER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE so.[SalesDate] >= @StartDate AND so.[SalesDate] <= @EndDate
GROUP BY spl.[LevelName],
		 sp.[LastName],
		 sp.[FirstName],
		 YEAR(so.[SalesDate]),
		 MONTH(so.[SalesDate]),
		 so.[SalesOrderStatus];
GO





-- We are only pulling one day into this execution.
EXECUTE [Sales].[GenerateSalesReport] @StartDate = '01/01/2020',
									  @EndDate = '01/01/2020';
GO






-- On this execution we're pulling in a lot more data.
EXECUTE [Sales].[GenerateSalesReport] @StartDate = '01/01/2017',
									  @EndDate = '12/31/2020';
GO





-- Here we're using the recompile at runtime.
EXECUTE [Sales].[GenerateSalesReport] @StartDate = '01/01/2017',
								      @EndDate = '12/31/2020'
								      WITH RECOMPILE;
GO





-- Recompile every time the procedure is executed.
CREATE OR ALTER PROCEDURE Sales.GenerateSalesReport
@StartDate date,
@EndDate date
WITH RECOMPILE
AS
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount'
	   ,spl.[LevelName] AS 'Level'
	   ,CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName'
	   ,YEAR(so.[SalesDate]) AS 'SalesYear'
	   ,MONTH(so.[SalesDate]) AS 'SalesMonth'
	   ,so.[SalesOrderStatus] AS 'StatusId'
FROM [Sales].[SalesPerson] sp
INNER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
INNER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE so.[SalesDate] >= @StartDate AND so.[SalesDate] <= @EndDate
GROUP BY spl.[LevelName],
		 sp.[LastName],
		 sp.[FirstName],
		 YEAR(so.[SalesDate]),
		 MONTH(so.[SalesDate]),
		 so.[SalesOrderStatus];
GO




-- Here we are recompiling at the statement level.
CREATE OR ALTER PROCEDURE Sales.GenerateSalesReport
@StartDate date,
@EndDate date
AS
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount'
	   ,spl.[LevelName] AS 'Level'
	   ,CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName'
	   ,YEAR(so.[SalesDate]) AS 'SalesYear'
	   ,MONTH(so.[SalesDate]) AS 'SalesMonth'
	   ,so.[SalesOrderStatus] AS 'StatusId'
FROM [Sales].[SalesPerson] sp
INNER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
INNER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE so.[SalesDate] >= @StartDate AND so.[SalesDate] <= @EndDate
GROUP BY spl.[LevelName],
		 sp.[LastName],
		 sp.[FirstName],
		 YEAR(so.[SalesDate]),
		 MONTH(so.[SalesDate]),
		 so.[SalesOrderStatus]
OPTION (RECOMPILE);
GO



-- We are only pulling one day into this execution.
EXECUTE [Sales].[GenerateSalesReport] @StartDate = '01/01/2020',
									  @EndDate = '01/01/2020';
GO




-- On this execution we're pulling in a lot more data.
EXECUTE [Sales].[GenerateSalesReport] @StartDate = '01/01/2017',
									  @EndDate = '12/31/2020';
GO