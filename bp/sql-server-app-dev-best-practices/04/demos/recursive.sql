USE PachaDataTraining;
GO

-- DROP TABLE IF EXISTS Contact.Employee
CREATE TABLE Contact.Employee (
	EmployeeId int NOT NULL IDENTITY (1, 1) PRIMARY KEY,
	ContactId int NOT NULL FOREIGN KEY REFERENCES Contact.Contact (ContactId),
	ManagerEmployeeId int NULL FOREIGN KEY REFERENCES Contact.Employee (EmployeeId),
	YearlySalary int NOT NULL
)
GO

INSERT INTO Contact.Employee (ContactId, ManagerEmployeeId, YearlySalary)
SELECT TOP 20 ContactId, NULL, 80000
FROM Contact.Contact
ORDER BY NEWID();
GO

SELECT *
FROM Contact.Employee;
GO

UPDATE Contact.Employee SET ManagerEmployeeId = 1 WHERE EmployeeId IN (2, 3, 4);
UPDATE Contact.Employee SET ManagerEmployeeId = 2 WHERE EmployeeId IN (5, 6, 7);
UPDATE Contact.Employee SET ManagerEmployeeId = 3 WHERE EmployeeId IN (8);
UPDATE Contact.Employee SET ManagerEmployeeId = 5 WHERE EmployeeId IN (9, 10, 20);
UPDATE Contact.Employee SET ManagerEmployeeId = 7 WHERE EmployeeId IN (11, 12);
UPDATE Contact.Employee SET ManagerEmployeeId = 10 WHERE EmployeeId IN (13, 14);
UPDATE Contact.Employee SET ManagerEmployeeId = 12 WHERE EmployeeId IN (15, 16, 17);
UPDATE Contact.Employee SET ManagerEmployeeId = 17 WHERE EmployeeId IN (18, 19);







