-- Create the database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SQLAuthority')
BEGIN
    CREATE DATABASE SQLAuthority;
END;
GO

-- Use the SQLAuthority database
USE SQLAuthority;

-- Drop the employees table if it exists
IF OBJECT_ID('employees', 'U') IS NOT NULL
BEGIN
    DROP TABLE employees;
END

-- Create the employees table
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),
    ManagerID INT,
    Role NVARCHAR(50)
);

-- Insert initial data
INSERT INTO employees (EmployeeID, EmployeeName, ManagerID, Role)
VALUES
    (1, 'John', NULL, 'CEO'),
    (2, 'Emily', 1, 'CTO'),
    (3, 'Michael', 1, 'CRO'),
    (4, 'Sophia', 2, 'Developer'),
    (5, 'David', 2, 'Developer'),
    (6, 'Jane', 3, 'Sales'),
    (7, 'Rachel', 3, 'Marketing');

-- Insert additional relevant rows
INSERT INTO employees (EmployeeID, EmployeeName, ManagerID, Role)
VALUES
    (8, 'Daniel', 4, 'Developer'),
    (9, 'Olivia', 4, 'Designer'),
    (10, 'William', 3, 'Finance'),
    (11, 'Liam', 2, 'Developer'),
    (12, 'Emma', 7, 'Analyst'),
    (13, 'Ava', 6, 'Sales'),
    (14, 'Noah', 2, 'Designer');

-- Select data from employees table
SELECT * FROM employees;
