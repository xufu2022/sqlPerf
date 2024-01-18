-- Use the SQLAuthority database
USE SQLAuthority;
GO

-- Retrieving data from employees table with hierarchy information
SELECT 
    *, 
    HierarchyID.ToString() AS HierarchyString, 
    HierarchyID.GetLevel() AS Level,
    CASE 
        WHEN HierarchyID.GetLevel() = 0 THEN HierarchyID.ToString() 
        ELSE HierarchyID.GetAncestor(1).ToString() 
    END AS Parent,
    CASE 
        WHEN HierarchyID = hierarchyid::GetRoot() THEN 'Yes' 
        ELSE 'No' 
    END AS IsRoot
FROM employees
ORDER BY Level;
GO

-- Insert new row under John
INSERT INTO employees (EmployeeID, EmployeeName, ManagerID, Role)
VALUES (15, 'NewEmployee', 1, 'NewRole');
GO

-- Verify hierarchy after insertion
SELECT * 
FROM employees
ORDER BY HierarchyID.GetLevel();

-- Reset the HierarchyID column
UPDATE employees
SET HierarchyID = NULL;
GO

-- Populate hierarchyid column
WITH EmployeeHierarchy AS 
(
    -- Anchor member definition
    SELECT EmployeeID, ManagerID, 
        CAST('/' AS VARCHAR(MAX)) AS HierarchyString
    FROM employees
    WHERE ManagerID IS NULL
    UNION ALL
    -- Recursive member definition
    SELECT e.EmployeeID, e.ManagerID,
        CAST(eh.HierarchyString + 
			CAST((ROW_NUMBER() OVER (PARTITION BY e.ManagerID ORDER BY e.EmployeeID)) AS VARCHAR(MAX)) + '/' AS VARCHAR(MAX))
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
    WHERE e.HierarchyID IS NULL
)
UPDATE employees
SET HierarchyID = CAST(eh.HierarchyString AS hierarchyid)
FROM EmployeeHierarchy eh
WHERE employees.EmployeeID = eh.EmployeeID;
GO

-- Verify hierarchy after populating hierarchyid column
SELECT * 
FROM employees
ORDER BY HierarchyID;

-- Retrieving data from employees table with updated hierarchy information
SELECT 
    *, 
    HierarchyID.ToString() AS HierarchyString, 
    HierarchyID.GetLevel() AS Level,
    CASE 
        WHEN HierarchyID.GetLevel() = 0 THEN HierarchyID.ToString() 
        ELSE HierarchyID.GetAncestor(1).ToString() 
    END AS Parent,
    CASE 
        WHEN HierarchyID = hierarchyid::GetRoot() THEN 'Yes' 
        ELSE 'No' 
    END AS IsRoot
FROM employees
ORDER BY Level;
GO
