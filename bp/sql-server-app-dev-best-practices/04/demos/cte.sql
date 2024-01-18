USE PachaDataTraining;
GO

-- find the manager
SELECT *
FROM Contact.Employee e1
WHERE e1.ManagerEmployeeId IS NULL;

-- find the VPs
SELECT e2.*
FROM Contact.Employee e1
JOIN Contact.Employee e2 ON e1.EmployeeId = e2.ManagerEmployeeId
WHERE e1.ManagerEmployeeId IS NULL;

-- traverse
CREATE TABLE #traversal (
	EmployeeId int NOT NULL PRIMARY KEY,
	ManagerId int NULL,
	HierarchyLevel tinyint NOT NULL
);
GO

INSERT INTO #traversal (EmployeeId, HierarchyLevel)
SELECT e1.EmployeeId, 1
FROM Contact.Employee e1
WHERE e1.ManagerEmployeeId IS NULL;

WHILE @@ROWCOUNT > 0 BEGIN
	INSERT INTO #traversal (EmployeeId, ManagerId, HierarchyLevel)
	SELECT e1.EmployeeId, e2.EmployeeId, e2.HierarchyLevel + 1
	FROM Contact.Employee e1
	JOIN #traversal e2 ON e1.ManagerEmployeeId = e2.EmployeeId
	WHERE e2.HierarchyLevel = (SELECT MAX(HierarchyLevel) FROM #traversal);
END
GO

SELECT * FROM #traversal;
GO


-- CTE example
;WITH cte AS (
	SELECT * FROM Contact.Employee
)
SELECT * FROM cte;
GO

SELECT *
FROM Contact.Contact WITH (INDEX = 0);
GO

SELECT *
FROM Contact.Contact

WITH cte AS (
	SELECT * FROM Contact.Employee
)
SELECT * FROM cte;
GO

;WITH cte AS (
	SELECT e.EmployeeId, e.ManagerEmployeeId, 1 as [Level]
	FROM Contact.Employee e
	WHERE e.ManagerEmployeeId IS NULL

	UNION ALL

	SELECT e2.EmployeeId, e2.ManagerEmployeeId, [Level] + 1
	FROM Contact.Employee e2
	JOIN cte ON e2.ManagerEmployeeId = cte.EmployeeId
)
SELECT * FROM cte;