-- Database Name and Compatibility Level
SELECT name, compatibility_level
FROM sys.databases
WHERE name = 'Pluralsight'
GO
-- Change Compatibility Level to 140 of SQL Server 2012
ALTER DATABASE Pluralsight 
SET COMPATIBILITY_LEVEL = 140
GO