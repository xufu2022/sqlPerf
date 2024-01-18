/******************************************************************************
**********************  Covering Index  ***************************************
*******************************************************************************/

USE [StructuredIndex];
GO

-- Let's review the structure of the table:
EXEC [sp_helpindex] '[dbo].[Employee]';
GO

-- Let's activate STATISTICS and the execution plan

SET STATISTICS IO ON;
GO

-- Let's see the execution plan of this request

SELECT [e].* 
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] BETWEEN '123-43-4550' AND '123-67-0000';
GO  

-- Total 44 logic readings

-- We have a clustered index on EmployeeID and a predicate on the SSN column (which has a non-clustered)
-- This request will make a SEEK index, in the clustered index, but since the request requires 
-- other columns
-- SSN, it will add the columns which are not in this index (60%).
-- The KEY LOOKUP operator must absolutely disappear from your execution plans :)
-- The KEY LOOKUP operator is in fact a BOOKMARK LOOKUP and which always appears with a clustered index
-- As soon as you see it, eliminate it as quickly as possible :), because this one can be very consuming

-- And if we add the SSN column in our request?

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] BETWEEN '123-43-4550' AND '123-67-0000';
GO 

-- We switch to SEEK and we go from 38 readings to 2 logical readings

-- Let's start again with a SELECT * by bringing in even more data:

SELECT [e].* 
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] BETWEEN '123-43-4550' AND '200-00-0000';
GO  

--Total 4009 logical reads and 6000 rows brought back, because the clustered index is not selective enough.
-- No key lookup but SQL prefers to choose an Index Scan to bring back

-- Let's limit the SELECT a little more, by adding the SSN column:

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] BETWEEN '123-43-4550' AND '200-00-0000';
GO 

--Total 19 logic readings

-- And if we bring back all the rows of the table (80000), by these 2 queries,
-- what does the execution plan give?
SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[SSN] BETWEEN '000-00-0001' AND '999-99-9999';
GO 

-- without the WHERE filter?

SELECT [e].[EmployeeID], [e].[SSN]
FROM [dbo].[Employee] AS [e]
GO 

--We have 210 logical readings in both cases
-- But without the WHERE filter, SQL went to a SCAN index without the WHERE filter
-- In some cases do not hesitate to filter your data, to take the SEEK index :)



--In summary, limit the number of columns in your queries if possible
-- this can be greatly beneficial, compared to your indexes in place, or to be created

-- ban the SELECT * and remove as much as possible the KEY LOOKUP in your execution plans.