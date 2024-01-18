-- Run this script to follow along.
USE WiredBrainCoffee;
GO

-- This statement uses a derived table to compare average salaries.
SELECT sp.FirstName,
	sp.LastName,
	sp.SalaryHr,
	AverageSalary.AverageSalary
FROM Sales.SalesPerson sp
INNER JOIN (
	SELECT CAST(AVG(sp.SalaryHr) AS DECIMAL(32, 2)) AS 'AverageSalary',
		sp.LevelId
	FROM Sales.SalesPerson sp
	JOIN Sales.SalesPersonLevel spl ON sp.LevelId = spl.Id
	WHERE spl.LevelName <> 'Manager'
	GROUP BY sp.LevelId
	) AverageSalary ON AverageSalary.LevelId = sp.LevelId
WHERE AverageSalary.AverageSalary > sp.SalaryHr;
GO

-- This statement uses a Common Table Expression.
;WITH AverageSalary
AS (
	SELECT CAST(AVG(sp.SalaryHr) AS DECIMAL(32, 2)) AS 'AverageSalary',
		sp.LevelId
	FROM Sales.SalesPerson sp
	JOIN Sales.SalesPersonLevel spl ON sp.LevelId = spl.Id
	WHERE spl.LevelName <> 'Manager'
	GROUP BY sp.LevelId
	)
SELECT sp.FirstName,
	sp.LastName,
	sp.SalaryHr,
	AverageSalary.AverageSalary
FROM Sales.SalesPerson sp
INNER JOIN AverageSalary ON AverageSalary.LevelId = sp.LevelId
WHERE AverageSalary.AverageSalary > sp.SalaryHr;
GO