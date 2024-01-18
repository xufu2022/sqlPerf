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

-- Get the HierarchyID for NewEmployee
DECLARE @NewManagerHierarchyID hierarchyid = (SELECT HierarchyID FROM employees WHERE EmployeeName = 'NewEmployee');

-- Get the old and new parent HierarchyID for Emma
DECLARE @OldParentHierarchyID hierarchyid = (SELECT HierarchyID FROM employees WHERE EmployeeName = 'Emma').GetAncestor(1);
DECLARE @NewParentHierarchyID hierarchyid = @NewManagerHierarchyID;

-- Update the HierarchyID for Emma
UPDATE employees
SET HierarchyID = HierarchyID.GetReparentedValue(@OldParentHierarchyID, @NewParentHierarchyID)
WHERE EmployeeName = 'Emma';

-- Update the ManagerID for Emma
UPDATE employees
SET ManagerID = (SELECT EmployeeID FROM employees WHERE EmployeeName = 'NewEmployee')
WHERE EmployeeName = 'Emma';
GO

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
