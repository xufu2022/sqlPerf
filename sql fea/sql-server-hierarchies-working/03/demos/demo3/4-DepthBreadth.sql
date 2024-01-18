-- Use the SQLAuthority database
USE SQLAuthority;
GO

SET STATISTICS IO ON;

-- Query to get depth and count of nodes at each depth using HierarchyID
SELECT 
    HierarchyID.GetLevel() AS Depth,
    COUNT(*) AS Breadth
FROM 
    employees
GROUP BY 
    HierarchyID.GetLevel()
ORDER BY 
    Depth;

-- Query to get depth and count of nodes at each depth using recursive CTE
WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID, 
        EmployeeName, 
        ManagerID, 
        1 AS Depth
    FROM employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT 
        e.EmployeeID, 
        e.EmployeeName, 
        e.ManagerID, 
        eh.Depth + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT 
    Depth, 
    COUNT(*) AS Breadth
FROM EmployeeHierarchy
GROUP BY Depth
ORDER BY Depth;

-- ------------------------------------------------------------------------------

-- Query to get EmployeeID, EmployeeName, HierarchyID as string, and depth
SELECT 
    EmployeeID, 
    EmployeeName, 
    HierarchyID.ToString() AS HierarchyString,
    HierarchyID.GetLevel() AS Depth
FROM 
    employees;

-- Query to get all employees and their depth in the hierarchy using recursive CTE
WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID, 
        EmployeeName, 
        ManagerID, 
        1 AS Depth
    FROM employees
    WHERE ManagerID IS NULL     
    UNION ALL    
    SELECT 
        e.EmployeeID, 
        e.EmployeeName, 
        e.ManagerID, 
        eh.Depth + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT * FROM EmployeeHierarchy;
