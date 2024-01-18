/*******************************************************************************
********************** Table SEEK    *******************************************
********************************************************************************/
USE [StructuredIndex];
GO

--An SQL seek is a much more efficient way to access data, it will traverse
-- the root, intermediate and data nodes much faster.
-- This greatly reduces the number of I/Os in a query.

-- Let's enable statistics and the execution plan
SET STATISTICS IO ON;
GO


-- select  

SELECT [e].* 
FROM [dbo].[Employee] AS [e]
WHERE [e].[EmployeeID] = 12345;
GO

-- number of readings 3 not bad :)

-- Another example:

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] = '749-21-9445';
GO

-- number of reads 2 not bad :)

-- with a like %. 
SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] LIKE  '%749-21-9445%';
GO
-- number of reads 210 :(

-- Is it the same with a HEAP table (without clustered index, but with a non-clustered index)? 
SELECT [e].[EmployeeID]
FROM [dbo].[EmployeeHeap] AS [e]
WHERE [e].[EmployeeID] = 12345;
GO
-- number of readings 2 not bad :)

--Adopt the SEEK it's good for your performance, but don't force it at every request:)
