-- Use the SQLAuthority database
USE SQLAuthority;
GO

-- Creating and populating EmployeeBig table
IF OBJECT_ID('EmployeeBig', 'U') IS NOT NULL
    DROP TABLE EmployeeBig;

CREATE TABLE EmployeeBig (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    ManagerID INT,
    Role VARCHAR(255)
);

-- Initial data insertion
INSERT INTO EmployeeBig (EmployeeID, EmployeeName, ManagerID, Role)
VALUES
(1, 'John', NULL, 'CEO'),
(2, 'Emily', 1, 'CTO'),
(3, 'Michael', 1, 'CRO'),
(4, 'Sophia', 2, 'Developer'),
(5, 'David', 2, 'Developer'),
(6, 'Jane', 3, 'Sales'),
(7, 'Rachel', 3, 'Marketing'),
(8, 'Daniel', 4, 'Developer'),
(9, 'Olivia', 4, 'Designer'),
(10, 'William', 3, 'Finance'),
(11, 'Liam', 2, 'Developer'),
(12, 'Emma', 7, 'Analyst'),
(13, 'Ava', 6, 'Sales'),
(14, 'Noah', 2, 'Designer'),
(15, 'Sophie', 5, 'Developer'),
(16, 'James', 5, 'Developer'),
(17, 'Lily', 6, 'Sales'),
(18, 'Benjamin', 6, 'Sales'),
(19, 'Mia', 7, 'Marketing'),
(20, 'Lucas', 7, 'Marketing'),
(21, 'Harper', 1, 'CRO'),
(22, 'Henry', 1, 'CRO'),
(23, 'Ella', 3, 'Finance'),
(24, 'Alexander', 3, 'Finance'),
(25, 'Grace', 2, 'Developer'),
(26, 'Jackson', 2, 'Developer'),
(27, 'Chloe', 4, 'Designer'),
(28, 'Sebastian', 4, 'Designer'),
(29, 'Zoe', 5, 'Developer'),
(30, 'Aiden', 5, 'Developer'),
(31, 'Penelope', 6, 'Sales'),
(32, 'Leo', 6, 'Sales'),
(33, 'Victoria', 7, 'Marketing'),
(34, 'Gabriel', 7, 'Marketing'),
(35, 'Sofia', 1, 'CRO'),
(36, 'Carter', 1, 'CRO'),
(37, 'Avery', 3, 'Finance'),
(38, 'Matthew', 3, 'Finance'),
(39, 'Aubrey', 2, 'Developer'),
(40, 'Wyatt', 2, 'Developer'),
(41, 'Scarlett', 4, 'Designer'),
(42, 'Owen', 4, 'Designer'),
(43, 'Lillian', 5, 'Developer'),
(44, 'Daniel', 5, 'Developer'),
(45, 'Nora', 6, 'Sales'),
(46, 'Luke', 6, 'Sales'),
(47, 'Hannah', 7, 'Marketing'),
(48, 'Jack', 7, 'Marketing'),
(49, 'Layla', 1, 'CRO'),
(50, 'Jayden', 1, 'CRO'),
(51, 'Elizabeth', 3, 'Finance'),
(52, 'Oliver', 3, 'Finance'),
(53, 'Evelyn', 2, 'Developer'),
(54, 'Gabriel', 2, 'Developer'),
(55, 'Aria', 4, 'Designer'),
(56, 'Julian', 4, 'Designer'),
(57, 'Addison', 5, 'Developer'),
(58, 'Ryan', 5, 'Developer'),
(59, 'Brooklyn', 6, 'Sales'),
(60, 'Nathan', 6, 'Sales'),
(61, 'Samantha', 7, 'Marketing'),
(62, 'Isaac', 7, 'Marketing'),
(63, 'Zoey', 1, 'CRO'),
(64, 'Henry', 1, 'CRO'),
(65, 'Leah', 3, 'Finance'),
(66, 'Mason', 3, 'Finance'),
(67, 'Audrey', 2, 'Developer'),
(68, 'Elijah', 2, 'Developer'),
(69, 'Claire', 4, 'Designer'),
(70, 'Julian', 4, 'Designer'),
(71, 'Skylar', 5, 'Developer'),
(72, 'Caleb', 5, 'Developer'),
(73, 'Bella', 6, 'Sales'),
(74, 'Isaiah', 6, 'Sales'),
(75, 'Stella', 7, 'Marketing'),
(76, 'Andrew', 7, 'Marketing'),
(77, 'Violet', 1, 'CRO'),
(78, 'Oscar', 1, 'CRO'),
(79, 'Aaliyah', 3, 'Finance'),
(80, 'Connor', 3, 'Finance'),
(81, 'Skylar', 2, 'Developer'),
(82, 'William', 2, 'Developer'),
(83, 'Ellie', 4, 'Designer'),
(84, 'Julian', 4, 'Designer'),
(85, 'Natalie', 5, 'Developer'),
(86, 'Eli', 5, 'Developer'),
(87, 'Hailey', 6, 'Sales'),
(88, 'Josiah', 6, 'Sales'),
(89, 'Paisley', 7, 'Marketing'),
(90, 'Christopher', 7, 'Marketing'),
(91, 'Maya', 1, 'CRO'),
(92, 'Nolan', 1, 'CRO'),
(93, 'Addison', 3, 'Finance'),
(94, 'Jonathan', 3, 'Finance'),
(95, 'Naomi', 2, 'Developer'),
(96, 'Oliver', 2, 'Developer'),
(97, 'Brooklyn', 4, 'Designer'),
(98, 'Julian', 4, 'Designer'),
(99, 'Eleanor', 5, 'Developer'),
(100, 'Samuel', 5, 'Developer');
GO

-- Populate additional data in a loop
DECLARE @i INT = 0;
WHILE @i < 10
BEGIN
    SET @i = @i + 1;
    INSERT INTO EmployeeBig (EmployeeID, EmployeeName, ManagerID, Role)
    SELECT TOP 100
        EmployeeID + @i * 100,
        EmployeeName,
        ManagerID,
        Role
    FROM EmployeeBig
    ORDER BY EmployeeID;
END;

-- Add the HierarchyID column
ALTER TABLE EmployeeBig
ADD HierarchyID hierarchyid;
GO

-- Reset the HierarchyID column
UPDATE EmployeeBig
SET HierarchyID = NULL;
GO

-- Add the Level column using hierarchy functions
ALTER TABLE EmployeeBig ADD Level AS HierarchyID.GetLevel();
GO

-- Populate hierarchyid column
WITH EmployeeHierarchy AS 
(
    -- Anchor member definition
    SELECT EmployeeID, ManagerID, 
        CAST('/' AS VARCHAR(MAX)) AS HierarchyString
    FROM EmployeeBig
    WHERE ManagerID IS NULL
    UNION ALL
    -- Recursive member definition
    SELECT e.EmployeeID, e.ManagerID,
        CAST(eh.HierarchyString + CAST((ROW_NUMBER() OVER (PARTITION BY e.ManagerID ORDER BY e.EmployeeID)) AS VARCHAR(MAX)) + '/' AS VARCHAR(MAX))
    FROM EmployeeBig e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
UPDATE EmployeeBig
SET HierarchyID = CAST(eh.HierarchyString AS hierarchyid)
FROM EmployeeHierarchy eh
WHERE EmployeeBig.EmployeeID = eh.EmployeeID;
GO