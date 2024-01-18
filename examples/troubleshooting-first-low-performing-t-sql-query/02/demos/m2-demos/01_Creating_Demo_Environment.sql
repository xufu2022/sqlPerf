-- Run this script to follow along with the demo.
USE master;
GO

-- Checking to see if our database exists and if it does drop it.
IF DATABASEPROPERTYEX ('WiredBrainCoffee','Version') IS NOT NULL
BEGIN
	ALTER DATABASE WiredBrainCoffee SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE;
	DROP DATABASE WiredBrainCoffee;
END
GO

-- Make sure you have at least 3GB to follow along.
CREATE DATABASE WiredBrainCoffee
 ON PRIMARY 
( NAME = N'WiredBrainCoffee', FILENAME = N'C:\Pluralsight\SQLFiles\WiredBrainCoffee.mdf',SIZE = 1000000KB , FILEGROWTH = 100000KB )
 LOG ON 
( NAME = N'WiredBrainCoffee_log', FILENAME = N'C:\Pluralsight\SQLFiles\WiredBrainCoffee_log.ldf',SIZE = 100000KB , FILEGROWTH = 100000KB )
GO


ALTER DATABASE WiredBrainCoffee SET RECOVERY SIMPLE;
GO

USE WiredBrainCoffee;
GO

CREATE SCHEMA Sales;
GO


CREATE TABLE Sales.SalesPersonLevel (
	Id INT identity(1, 1) NOT NULL,
	LevelName NVARCHAR(500) NOT NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesPersonLevel_Id PRIMARY KEY CLUSTERED (Id)
	);
GO

INSERT INTO Sales.SalesPersonLevel (LevelName)
VALUES
	('Manager'),
    ('Senior Staff'),
	('Staff'),
	('Associate');
GO

CREATE TABLE Sales.SalesPerson (
	Id INT identity(1, 1) NOT NULL,
	EmployeeNumber NVARCHAR(10) NOT NULL,
	FirstName NVARCHAR(500) NOT NULL,
	LastName NVARCHAR(500) NOT NULL,
	SalaryHr DECIMAL(32, 2) NULL,
	LevelId INT NOT NULL,
	Email NVARCHAR(500) NULL,
	IsActive BIT NOT NULL,
	StartDate DATE NOT NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesPerson_Id PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_SalesPersonLevel_Id FOREIGN KEY (LevelId) REFERENCES Sales.SalesPersonLevel(Id)
	);
GO

-- I borrowed this script from Aaron Bertrand at the following link https://sqlperformance.com/2013/01/t-sql-queries/generate-a-set-1.
SELECT TOP (5000000) Number = CONVERT(INT, ROW_NUMBER() OVER (
			ORDER BY s1.object_id
			))
INTO dbo.Numbers
FROM sys.all_objects AS s1
CROSS JOIN sys.all_objects AS s2
GO


WITH FirstName AS (
	SELECT 'Tom'	AS FirstName UNION ALL
	SELECT 'Sally'	AS FirstName UNION ALL
	SELECT 'Bill'	AS FirstName UNION ALL
	SELECT 'Ted'	AS FirstName UNION ALL
	SELECT 'Lisa'	AS FirstName UNION ALL
	SELECT 'Kerrie' AS FirstName UNION ALL
	SELECT 'Arun'	AS FirstName UNION ALL
	SELECT 'Wanda'	AS FirstName UNION ALL
	SELECT 'Tammy'	AS FirstName UNION ALL
	SELECT 'Dione'	AS FirstName
), LastName AS (
	SELECT 'Jones'	AS LastName UNION ALL
	SELECT 'Smith'	AS LastName UNION ALL
	SELECT 'Knocks' AS LastName UNION ALL
	SELECT 'James'	AS LastName UNION ALL
	SELECT 'Friend'	AS LastName UNION ALL
	SELECT 'Seker'	AS LastName UNION ALL
	SELECT 'Lincoln' AS LastName UNION ALL
	SELECT 'Morgan'	AS LastName UNION ALL
	SELECT 'Jones'	AS LastName UNION ALL
	SELECT 'Kumar'	AS LastName 
	)
INSERT INTO Sales.SalesPerson (
		EmployeeNumber,
		FirstName,
		LastName,
		SalaryHr,
		LevelId,
		Email,
		IsActive,
		StartDate
		) 
SELECT	CONCAT('000',ROW_NUMBER() OVER(ORDER BY (SELECT NULL))) AS EmployeeNumber,
		FirstName AS FirstName,
		LastName AS LastName,
		ABS(CHECKSUM(NEWID()) % 100) + 50 AS SalaryHr,
		ABS(CHECKSUM(NEWID()) % 4) + 1 AS LevelId,
		CONCAT(FirstName,'.',LastName,n.Number,'@WiredBrainCoffee.com') AS Email,
		CASE	WHEN n.Number % 20 = 0 THEN 0
					ELSE 1 END AS IsActive,
		DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, '01/01/2016', '10/11/2022')),'01/01/2016') AS StartDate
FROM FirstName
CROSS JOIN LastName
CROSS JOIN dbo.Numbers n
WHERE n.Number <= 50;
GO


CREATE TABLE Sales.SalesTerritoryStatus (
	Id INT identity(1, 1) NOT NULL,
	StatusName NVARCHAR(500) NOT NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesTerritoryStatus_Id PRIMARY KEY CLUSTERED (Id)
	);
GO


INSERT INTO Sales.SalesTerritoryStatus (StatusName)
VALUES	('Active'),
		('Closing'),
		('In Review');
GO

CREATE TABLE Sales.SalesTerritory (
	Id INT identity(1, 1) NOT NULL,
	TerritoryName NVARCHAR(500) NOT NULL,
	[Group] NVARCHAR(500) NULL,
	StatusId INT NOT NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesTerritory_Id PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_Status_Id FOREIGN KEY (StatusId) REFERENCES Sales.SalesTerritoryStatus(Id)
	);
GO


INSERT INTO Sales.SalesTerritory (TerritoryName,[Group],StatusId) 
VALUES	('Northwest','North America',1),
		('Northeast','North America',1),
		('Southwest','North America',1),
		('Southeast','North America',1),
		('Canada','North America',3),
		('France','Europe',1),
		('Germany','Europe',2),
		('Australia','Pacific',2),
		('United Kingdom','Europe',3),
		('Spain','Europe',1);
GO

CREATE TABLE Sales.SalesOrderStatus (
	Id INT identity(1, 1) NOT NULL,
	StatusName NVARCHAR(500) NOT NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesOrderStatus_Id PRIMARY KEY CLUSTERED (Id)
	);
GO

INSERT INTO Sales.SalesOrderStatus (StatusName)
VALUES	('Complete'),
		('In Progress'),
		('Returned');
GO

CREATE TABLE Sales.SalesOrder (
	Id INT identity(1, 1) NOT NULL,
	SalesPerson INT NOT NULL,
	SalesAmount DECIMAL(36, 2) NOT NULL,
	SalesDate DATE NOT NULL,
	SalesTerritory INT NOT NULL,
	SalesOrderStatus INT NOT NULL,
	OrderDescription NVARCHAR(MAX) NULL,
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	ModifyDate DATETIME NULL,
	CONSTRAINT PK_SalesOrder_Id PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT FK_SalesPerson_Id FOREIGN KEY (SalesPerson) REFERENCES Sales.SalesPerson(Id),
	CONSTRAINT FK_SalesTerritory_Id FOREIGN KEY (SalesTerritory) REFERENCES Sales.SalesTerritory(Id),
	CONSTRAINT FK_SalesOrderStatus_Id FOREIGN KEY (SalesOrderStatus) REFERENCES Sales.SalesOrderStatus(Id)
	);
GO

-- The statement below will insert 5 million rows.
INSERT INTO Sales.SalesOrder (
		SalesPerson,
		SalesAmount,
		SalesDate,
		SalesTerritory,
		SalesOrderStatus,
		OrderDescription
		) 
SELECT TOP 5000000
		ABS(CHECKSUM(NEWID()) % 5000) + 1 AS SalesPerson,
		ABS(CHECKSUM(NEWID()) % 50) + 10 AS SalesAmount,
		DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, '01/01/2016', '04/30/2022')),'01/01/2016') AS SalesDate,
		ABS(CHECKSUM(NEWID()) % 10) + 1 AS SalesTerritory,
		CASE	
				WHEN n.Number % 1000 = 0 
						THEN 3
				ELSE ABS(CHECKSUM(NEWID()) % 2) + 1 END AS SalesOrderStatus,
		'I love selling coffee' AS SalesDescription
FROM dbo.Numbers AS n;
GO


-- This command will shrink the transaction log.
DBCC SHRINKFILE (N'WiredBrainCoffee_log' , 0, TRUNCATEONLY);
GO