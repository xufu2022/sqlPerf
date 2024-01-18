/******************************************************************************
************            In search of the perfect index  ***********************
*******************************************************************************/
USE Structuredindex
GO

-- Activate STATISTICS and execution plan 
SET STATISTICS IO ON;
GO
-- Let's take the two requests and just change the number of employees

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[EmployeeID] < 10000;
GO

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[EmployeeID] < 1000;
GO  

-- If there are 1000 employees, we start with a SEEK index, whereas if there are 10000, 
-- we start with a SCAN index
-- SQL server preferred to start with SCAN, because going through a SEEK index 
-- would have been too costly 
-- let's try to force the index on him 
-- also called the tipping point

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e] WITH (INDEX (2))
WHERE [e].[EmployeeID] < 10000 
OPTION (RECOMPILE)
GO

-- We go from 210 logical reads to 503 reads by forcing the index...
-- so SQL is right :)


-- Let's say it's a critical query
-- Then a non-clustered index covering might do the trick :)

CREATE INDEX [NCCoveringSeekableIX] 
ON [dbo].[Employee] ([EmployeeID], [SSN]);
GO

-- Now, it doesn't matter what range I use!
SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[EmployeeID] < 10000;
GO

-- It's still best:
SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[EmployeeID] < 1000;
GO  

-- It's still best - even here:
SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[EmployeeID] < 80000;
GO  

-------------------------------------------------------------------------------
-- More than anything - what's best depends on the QUERY
-- and the different costs of the possible options!

-- For critical queries, I'd consider covering but be careful
-- covering ALWAYS works (and VERY well). 

-- You do not want to over index! (more coming up!)
-------------------------------------------------------------------------------