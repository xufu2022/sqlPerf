-- Use the SQLAuthority database
USE SQLAuthority;
GO

-- Get all parent-child relationships
SELECT
    e1.EmployeeName AS Parent, 
    e2.EmployeeName AS Child
FROM employees e1  
JOIN employees e2 ON e2.HierarchyID.IsDescendantOf(e1.HierarchyID) = 1;

-- Get all descendants of 'John'
-- Traverses the entire hierarchy below John
SELECT 
    e1.EmployeeName AS Ancestor,
    des.EmployeeName AS Descendant
FROM employees e1
JOIN employees des ON des.HierarchyID.IsDescendantOf(e1.HierarchyID) = 1
WHERE e1.EmployeeName = 'John';

-- Get descendants of 'John' at level 2
-- More efficient than traversing everything
SELECT  
    e1.EmployeeName AS Ancestor,
    des.EmployeeName AS Descendant
FROM employees e1
JOIN employees des ON des.HierarchyID.IsDescendantOf(e1.HierarchyID) = 1
WHERE e1.EmployeeName = 'John'
AND des.HierarchyID.GetLevel() = 2;

-- Get all descendants of 'John' at any level
SELECT  
    e1.EmployeeName AS Ancestor,
    des.EmployeeName AS Descendant  
FROM employees e1
JOIN employees des ON des.HierarchyID.IsDescendantOf(e1.HierarchyID) = 1
WHERE e1.EmployeeName = 'John';

-- Get direct children of 'John'
SELECT
    e1.EmployeeName AS Parent,
    e2.EmployeeName AS Child
FROM employees e1
JOIN employees e2 ON e2.HierarchyID.GetAncestor(1) = e1.HierarchyID
WHERE e1.EmployeeName = 'John';

-- Get level of each node
SELECT
    EmployeeName,
    HierarchyID.GetLevel() AS Level
FROM employees;

-- Get nodes at level 2
SELECT EmployeeName  
FROM employees
WHERE HierarchyID.GetLevel() = 2;

-- Find root node
SELECT EmployeeName
FROM employees
WHERE HierarchyID = hierarchyid::GetRoot();

-- Find all nodes at the same level as a given node
SELECT e1.EmployeeName AS Peer, e2.EmployeeName 
FROM employees e1
JOIN employees e2 ON e2.HierarchyID.GetAncestor(1) = e1.HierarchyID.GetAncestor(1)
WHERE e1.EmployeeName = 'Emily';

-- Get the depth of the hierarchy
SELECT MAX(HierarchyID.GetLevel()) AS Depth
FROM employees;

-- Find leaf nodes (nodes with no children)
SELECT EmployeeName
FROM employees e1 
WHERE NOT EXISTS (
  SELECT 1 
  FROM employees e2
  WHERE e2.HierarchyID.GetAncestor(1) = e1.HierarchyID
);
