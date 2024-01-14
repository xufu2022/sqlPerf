-- Run this script to follow along with the demo.
USE [WiredBrainCoffee];
GO


-- Update your stored procedure to include a parameter.
CREATE OR ALTER PROCEDURE [Sales].[GenerateSalesReport] 
@LevelName nvarchar(500)
AS
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount',
	   spl.[LevelName] AS 'Level',
	   CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName'
FROM [Sales].[SalesPerson] sp
LEFT OUTER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
LEFT OUTER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE spl.[LevelName] = @LevelName
GROUP BY spl.[LevelName], sp.[LastName], sp.[FirstName];
GO


-- Please do not run this in production.
DBCC FREEPROCCACHE;
GO

-- Same query as your stored procedure.
-- Query 
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount',
	   spl.[LevelName] AS 'Level',
	   CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName'
FROM [Sales].[SalesPerson] sp
LEFT OUTER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
LEFT OUTER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE spl.[LevelName] = 'Associate'
GROUP BY spl.[LevelName], sp.[LastName], sp.[FirstName];
GO

-- Query
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount',
	   spl.[LevelName] AS 'Level',
	   CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName' 
FROM [Sales].[SalesPerson] sp
LEFT OUTER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
LEFT OUTER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE spl.[LevelName] = 'Manager'
GROUP BY spl.[LevelName], sp.[LastName], sp.[FirstName];
GO


-- Query
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount'
	   ,spl.[LevelName] AS 'Level'
	   ,CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName' 
FROM [Sales].[SalesPerson] sp
LEFT OUTER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
LEFT OUTER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE spl.[LevelName] = 'Staff'
GROUP BY spl.[LevelName], sp.[LastName], sp.[FirstName];
GO




-- Let's check out your plan cache.
SELECT cp.[usecounts]
	   ,cp.[size_in_bytes]
	   ,st.[text]
 FROM [sys].[dm_exec_cached_plans] cp
CROSS APPLY [sys].[dm_exec_sql_text](cp.[plan_handle]) st
WHERE st.text like '-- Query%';
GO


-- Query 
SELECT SUM(so.[SalesAmount]) AS 'SalesAmount',
	   spl.[LevelName] AS 'Level', 
	   CONCAT(sp.[LastName],', ',sp.[FirstName]) AS 'FullName' 
FROM [Sales].[SalesPerson] sp
LEFT OUTER JOIN [Sales].[SalesOrder] so ON so.[SalesPerson] = sp.[Id]
LEFT OUTER JOIN [Sales].[SalesPersonLevel] spl ON spl.[Id] = sp.[LevelId]
WHERE spl.[LevelName] = 'Staff'
GROUP BY spl.[LevelName], sp.[LastName], sp.[FirstName];
GO


-- Let�s check your cache again.
SELECT cp.[usecounts] 'Execution Counts'
	   ,cp.[size_in_bytes] 'Size in Bytes'
	   ,cp.[objtype] 'Type'
	   ,st.[text] 'SQL Text'
 FROM [sys].[dm_exec_cached_plans] cp
CROSS APPLY [sys].[dm_exec_sql_text](cp.[plan_handle]) st
WHERE st.[text] like '-- Query%';
GO


-- Execute your stored procedures.
EXECUTE [Sales].[GenerateSalesReport] @LevelName = 'Associate';
GO

EXECUTE [Sales].[GenerateSalesReport] @LevelName = 'Manager';
GO

EXECUTE [Sales].[GenerateSalesReport] @LevelName = 'Staff';
GO


-- Let�s check your cache one last time.
SELECT cp.[usecounts] 'Execution Counts'
	   ,cp.[size_in_bytes] 'Size in Bytes'
	   ,cp.[objtype]'Type'
	   ,st.[text] 'SQL Text'
 FROM [sys].[dm_exec_cached_plans] cp
CROSS APPLY [sys].[dm_exec_sql_text](cp.[plan_handle]) st
WHERE text like '%@LevelName%' AND cp.[objtype] = 'Proc';
GO