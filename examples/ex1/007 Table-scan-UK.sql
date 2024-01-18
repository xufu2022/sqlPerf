/*******************************************************************************
********************** Table Scan    *******************************************
********************************************************************************/

-- let's analyze the employee table

EXEC [sp_help] '[dbo].[Employee]';
GO

-- table with a clustered index
-- Let's activate the SET STATISTICS 

USE [StructuredIndex];
GO

SET STATISTICS IO ON;
GO

-- Add the execution plan 
-- In LIKE %% a scan cannot be inevitable (NOT SARGABLE)
-- We look for an E in each employee, so a SCAN is logically used


SELECT [e].* 
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE N'%e%';
GO

-- 4009 pages read through the scan
-- Let's try to refine the search:


SELECT [e].* 
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE N'E%';
GO

-- We'll refine the search further, is the SCAN still there? 

SELECT [e].*
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] = N'Eaton';
GO
-- It still goes to SCAN (4009 pages still read) but why?
-- SQL server doesn't have a selective enough index to help us find this data

-- We can go to SCAN for several reasons:
-- Not SARGABLE (searchable in the first example)
-- A query that is not very selective like the second example
-- But also with a query that can be very selective (3rd example)

-------------------------------------------------------------------------------
-- Let's start with a table in HEAP
-------------------------------------------------------------------------------

-- Let's analyze the table
EXEC [sp_help] [EmployeeHeap];
GO

-- Absence of index clustered
-- With %e% :

SELECT [e].* 
FROM [dbo].[EmployeeHeap] AS [e]
WHERE [e].[LastName] LIKE N'%e%';
GO
-- The Scan has changed 
-- 4000 pages read

-- Let's try to refine the search :

SELECT [e].* 
FROM [dbo].[EmployeeHeap] AS [e]
WHERE [e].[LastName] LIKE N'E%';
GO

-- We'll refine the search further, is the SCAN still there? 
SELECT [e].* 
FROM [dbo].[EmployeeHeap] AS [e]
WHERE [e].[LastName] = N'Eaton';
GO

-- So we see that even on a HEAP table the scan is still present

-------------------------------------------------------------------------------
-- But is a scan really a scan of the table
-------------------------------------------------------------------------------

-- Let's review the table
EXEC [sp_help] '[dbo].[Employee]';
GO
-- Index clustered on the table 

-- Logically the scan will scan all 4000 pages, like the other queries

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e];
GO

--There we see that there are 210 pages read instead of 4000 pages
-- which means that scanning a table does not automatically mean that it scans the whole table 
-- it may be that the scan will just scan the index sheets
