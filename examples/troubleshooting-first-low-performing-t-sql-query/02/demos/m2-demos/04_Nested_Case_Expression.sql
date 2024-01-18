-- Run this script to follow along with the demo.
USE WiredBrainCoffee;
GO

-- This is a free tool for formatting T-SQL code.
-- https://poorsql.com/


-- This statement compares different salaries and assigns tiers to them.
SELECT sp.FirstName,
	sp.LastName,
	sp.SalaryHr,
	CASE 
		WHEN sp.LevelId = 2
			THEN CASE 
					WHEN sp.SalaryHr > 80
						AND sp.SalaryHr <= 100
						THEN 'Tier1'
					WHEN sp.SalaryHr >= 100
						AND sp.SalaryHr < 200
						THEN 'Tier3'
					ELSE NULL
					END
		WHEN sp.LevelId = 3
			THEN CASE 
					WHEN sp.SalaryHr > 50
						THEN 'Tier2'
					ELSE NULL
					END
		ELSE NULL
		END AS 'Salary Tier'
FROM Sales.SalesPerson sp;
GO
		


-- This statement removes some of the nesting and uses a string in the CASE expression.
SELECT sp.FirstName,
	sp.LastName,
	sp.SalaryHr,
	CASE 
		WHEN spl.LevelName = 'Senior Staff'
			AND sp.SalaryHr > 80
			AND sp.SalaryHr <= 100
			THEN 'Tier1'
		WHEN spl.LevelName = 'Senior Staff'
			AND sp.SalaryHr >= 100
			AND sp.SalaryHr < 200
			THEN 'Tier3'
		WHEN spl.LevelName = 'Staff'
			AND sp.SalaryHr > 50
			THEN 'Tier2'
		ELSE NULL
		END AS 'Salary Tier'
FROM Sales.SalesPerson sp
INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId;
GO