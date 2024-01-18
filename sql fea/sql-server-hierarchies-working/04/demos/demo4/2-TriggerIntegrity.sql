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
FROM employees;
GO

-- Create a trigger to prevent the deletion of employees with subordinates
CREATE OR ALTER TRIGGER trg_PreventEmployeeDeletion
ON employees
INSTEAD OF DELETE
AS
BEGIN
    -- Check if any deleted employee is a manager with subordinates
    IF EXISTS (
        SELECT *
        FROM deleted d
        WHERE d.EmployeeID IN (SELECT ManagerID FROM employees)
    )
    BEGIN
        -- Raise an error and rollback the transaction
        RAISERROR('Cannot delete an employee who is a manager.', 16, 1)
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO

-- Testing delete
DELETE FROM employees
WHERE EmployeeID = 2;
-- Fails

-- Testing delete
DELETE FROM employees
WHERE EmployeeID = 13;
-- Successeds
GO

-- Drop the trigger
DROP TRIGGER trg_PreventEmployeeDeletion;
GO

-- Prevent deletion of a manager with subordinates using HierarchyID
CREATE OR ALTER TRIGGER trg_PreventEmployeeDeletionHierarchy
ON employees
INSTEAD OF DELETE
AS
BEGIN
    -- Check if any deleted employee is a manager with subordinates
    IF EXISTS (
        SELECT *
        FROM deleted d
        INNER JOIN employees e ON e.HierarchyID.GetAncestor(1) = d.HierarchyID
    )
    BEGIN
        -- Raise an error and rollback the transaction
        RAISERROR('Cannot delete an employee who is a manager.', 16, 1)
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO

-- Create a trigger to enforce the rule that an employee must have a valid manager.
CREATE OR ALTER TRIGGER trg_EmployeeManagerCheck
ON employees
AFTER INSERT, UPDATE
AS
BEGIN
    -- Check if any inserted or updated row violates the integrity rule
    IF EXISTS (
        SELECT *
        FROM inserted i
        LEFT JOIN employees e ON i.ManagerID = e.EmployeeID
        WHERE e.EmployeeID IS NULL
    )
    BEGIN
        -- Rollback the transaction and display an error message
        RAISERROR('Invalid manager ID. The manager must be an existing employee.', 16, 1)
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO

-- Testing insert
INSERT INTO employees (EmployeeID, EmployeeName, ManagerID, Role)
VALUES
    (2002, 'Johnny', NULL, 'NotCEO');

INSERT INTO employees (EmployeeID, EmployeeName, ManagerID, Role)
VALUES
    (2002, 'Johnny', 1, 'NotCEO');
GO
