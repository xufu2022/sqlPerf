SET Statistics IO ON;
GO
-- Select all employees managed directly or indirectly by the CEO (EmployeeID = 1)
WITH EmployeeDescendants AS (
    SELECT 
        EmployeeID, 
		EmployeeName,
		ManagerID, 
		HierarchyID,
		HierarchyID.ToString() as HierarchyString
    FROM 
        employees
    WHERE 
        EmployeeID = 1
    UNION ALL
    SELECT 
        e.EmployeeID, 
        e.EmployeeName, 
        e.ManagerID, 
        e.HierarchyID,
		e.HierarchyID.ToString() as HierarchyString
    FROM 
        employees e
    INNER JOIN 
        EmployeeDescendants ed ON e.ManagerID = ed.EmployeeID
)
SELECT * 
FROM EmployeeDescendants
ORDER BY EmployeeID;
GO


-- Select all employees managed directly or indirectly by the CEO (EmployeeID = 1)
SELECT 
    EmployeeID, 
    EmployeeName,
	ManagerID, 
    HierarchyID,
    HierarchyID.ToString() as HierarchyString
FROM 
    employees
WHERE 
    HierarchyID.IsDescendantOf((SELECT HierarchyID FROM employees WHERE EmployeeID = 1)) = 1
ORDER BY EmployeeID;	
GO

-- Select all employees managed directly or indirectly by the CEO (EmployeeID = 1)
SELECT
	e.EmployeeID, 
	e.EmployeeName, 
	e.ManagerID, 
	e.HierarchyID,
	e.HierarchyID.ToString() AS HierarchyString
FROM employees e
WHERE EXISTS 
(
  SELECT 1
  FROM employees e2
  WHERE e2.EmployeeID = 1 AND e.HierarchyID.IsDescendantOf(e2.HierarchyID) = 1
)
ORDER BY EmployeeID;
GO

SELECT
	e.EmployeeID, 
	e.EmployeeName, 
	e.ManagerID, 
	e.HierarchyID,
	e.HierarchyID.ToString() AS HierarchyString
FROM employees e
CROSS APPLY
(
  SELECT 1 col
  FROM employees e2 
  WHERE e2.EmployeeID = 1 AND e.HierarchyID.IsDescendantOf(e2.HierarchyID) = 1
) ca
WHERE ca.col IS NOT NULL
ORDER BY EmployeeID;
GO



-- -------------------------------------------------------------------------------------------------------


-- Extra example for practice on your own
-- Select the entire management chain for an employee (EmployeeID = 9)
WITH ManagementChain AS (
    SELECT 
        EmployeeID, 
        EmployeeName, 
        ManagerID, 
        HierarchyID
    FROM 
        employees
    WHERE 
        EmployeeID = 9
    UNION ALL
    SELECT 
        e.EmployeeID, 
        e.EmployeeName, 
        e.ManagerID, 
        e.HierarchyID
    FROM 
        employees e
    INNER JOIN 
        ManagementChain mc ON e.EmployeeID = mc.ManagerID
)
SELECT * 
FROM ManagementChain;

-- TempVariable Method
-- Declare a table variable
DECLARE @ManagementChain TABLE (
    EmployeeID int,
    EmployeeName varchar(255),
    ManagerID int,
    HierarchyID hierarchyid,
    HierarchyString nvarchar(4000)
);

-- Get the HierarchyID for the employee (EmployeeID = 9)
DECLARE @EmployeeHierarchyID hierarchyid;
SELECT @EmployeeHierarchyID = HierarchyID
FROM employees
WHERE EmployeeID = 9;

-- Select the entire management chain for the employee
WHILE @EmployeeHierarchyID.GetLevel() >= 0
BEGIN
    INSERT INTO @ManagementChain (EmployeeID, EmployeeName, ManagerID, HierarchyID, HierarchyString)
    SELECT 
        EmployeeID, 
        EmployeeName,
        ManagerID,
        HierarchyID,
        HierarchyID.ToString()
    FROM 
        employees
    WHERE 
        HierarchyID = @EmployeeHierarchyID;
    -- Move up the hierarchy
    SET @EmployeeHierarchyID = @EmployeeHierarchyID.GetAncestor(1);
END;

-- Display the management chain
SELECT * FROM @ManagementChain;