-- Use the SQLAuthority database
USE SQLAuthority;
GO

-- Turn on IO statistics
SET STATISTICS IO ON;
GO

-- Select the top 20 rows from EmployeeBig table
SELECT TOP 20 *
FROM EmployeeBig;

-- Select employee information with hierarchy details for Level 1 employees
SELECT
    e.EmployeeName,
    e.HierarchyID.GetLevel() AS Level,
    e.HierarchyID.GetAncestor(1).ToString() AS Parent,
    e.HierarchyID.ToString() AS Path
FROM EmployeeBig e
WHERE e.Level = 1
ORDER BY e.EmployeeName;

-- Create a non-clustered index for Level column
CREATE NONCLUSTERED INDEX idx_levels
ON EmployeeBig (Level) INCLUDE (EmployeeName, HierarchyID);
GO

-- Select employee information with hierarchy details for Level 1 employees using the index
SELECT
    e.EmployeeName,
    e.HierarchyID.GetLevel() AS Level,
    e.HierarchyID.GetAncestor(1).ToString() AS Parent,
    e.HierarchyID.ToString() AS Path
FROM EmployeeBig e
WHERE e.Level = 1
ORDER BY e.EmployeeName;

-- Drop the index
DROP INDEX idx_levels ON EmployeeBig;
