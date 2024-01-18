-- Use the SQLAuthority database
USE SQLAuthority;
GO

-- Add the HierarchyID column
ALTER TABLE employees
ADD HierarchyID hierarchyid;
GO

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
        CAST(eh.HierarchyString + CAST((ROW_NUMBER() OVER 
			(PARTITION BY e.ManagerID ORDER BY e.EmployeeID)) AS VARCHAR(MAX)) + '/' AS VARCHAR(MAX))
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
-- SELECT *, CAST(HierarchyString AS hierarchyid) AS  HierarchyID FROM EmployeeHierarchy;
UPDATE employees
SET HierarchyID = CAST(eh.HierarchyString AS hierarchyid)
FROM EmployeeHierarchy eh
WHERE employees.EmployeeID = eh.EmployeeID;
GO

-- Retrieving data from employees table
SELECT 
    *, 
    HierarchyID.ToString() as HierarchyString, 
    HierarchyID.GetLevel() as Level,
    CASE 
        WHEN HierarchyID.GetLevel() = 0 THEN HierarchyID.ToString() 
        ELSE HierarchyID.GetAncestor(1).ToString() 
    END as Parent,
    CASE 
        WHEN HierarchyID = hierarchyid::GetRoot() THEN 'Yes' 
        ELSE 'No' 
    END as IsRoot
	-- ,HierarchyID.GetDescendant(NULL, NULL).ToString() as HypotheticalChild
FROM employees;

