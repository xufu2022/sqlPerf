---------------------------------------------------------
-- Employee Case Study Sample Database Setup
-- Download location: http://bit.ly/2r6BR1g
---------------------------------------------------------

USE [master];
GO

RESTORE DATABASE [EmployeeCaseStudy]
FROM DISK = N'D:\Pluralsight\SampleDBs\EmployeeCaseStudySampleDB2012.bak'
WITH MOVE N'EmployeeCaseStudyData' 
		TO N'D:\Pluralsight\SampleDBs\EmployeeCaseStudyData.mdf',  
	 MOVE N'EmployeeCaseStudyLog' 
		TO N'D:\Pluralsight\SampleDBs\EmployeeCaseStudyLog.ldf',
	 STATS = 10, REPLACE;
GO

-- Set the database compat mode for the version you're running:
--	110 SQL Server 2012
--	120 SQL Server 2014
--	130 SQL Server 2016
-- Note: The compat mode does not affect the execution for most
-- of these indexing for performance scripts. When it does (when 
-- the cardinality estimation model affects the outcome, I will 
-- state what you will see differently).

ALTER DATABASE [EmployeeCaseStudy]
		SET COMPATIBILITY_LEVEL = 120; -- SQL Server 2014
GO

---------------------------------------------------------
-- Demo: Nonclustered covering seekable query
---------------------------------------------------------

USE [EmployeeCaseStudy];
GO

-- When you upgrade a database, you should always 
-- UPDATE STATISTICS! 
UPDATE STATISTICS [dbo].[Employee];
GO

-- Review index definitions
EXEC [sp_helpindex] '[dbo].[Employee]';
GO

-- Use this to get some insight into what's happening:
SET STATISTICS IO ON;
GO

-- NOTE: I/Os alone are not the ONLY way to understand
-- what's going on. We'll add graphical showplan as well.
-- Use Query, Include Actual Execution Plan

-- Without ANY useful indexes - what does this query do?
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

---------------------------------------------------------
-- Option 1: bookmark lookups
---------------------------------------------------------
CREATE INDEX [EmployeeLastNameIX]
ON [dbo].[Employee] ([LastName]);
GO

-- Without hints, SQL Server doesn't use it:
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

-- How bad is it?
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLastNameIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

---------------------------------------------------------
-- Option 2: all columns in key
---------------------------------------------------------
CREATE INDEX [EmployeeCoversAll4ColsIX] 
ON [dbo].[Employee] ([LastName], [FirstName], [MiddleInitial], [Phone]);
GO

-- Without hints, SQL Server uses this one!
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

---------------------------------------------------------
-- Option 3: only LastName in the key
---------------------------------------------------------
CREATE INDEX [EmployeeLNinKeyInclude3OtherColsIX] 
ON [dbo].[Employee] ([LastName])
INCLUDE ([FirstName], [MiddleInitial], [Phone]);
GO

-- But does SQL Server use it?
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLNinKeyInclude3OtherColsIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

---------------------------------------------------------
-- Option 4: only LastName in the key
---------------------------------------------------------
CREATE INDEX [EmployeeLnFnMiIncludePhoneIX]
ON [dbo].[Employee] ([LastName], [FirstName], [MiddleInitial])
INCLUDE ([Phone]);
GO

-- But does SQL Server use it?
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLnFnMiIncludePhoneIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLNinKeyInclude3OtherColsIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO


---------------------------------------------------------
-- Query Tuning
---------------------------------------------------------

-- Option 3 is the best option for the QUERY


---------------------------------------------------------
-- Server Tuning
---------------------------------------------------------

-- Option 4 is probably the best for the server
-- (this is likely during index consolidation)
