/*******************************************************************************
********************** INCLUDE     *********************************************
********************************************************************************/
-- We have now understood that index readings are generally less expensive than readings
-- data pages, as long as the size of the indexes is reasonable compared to that of the
-- data.

-- It can therefore be tempting to add columns to the indexes for performance purposes
--only. This is a bad strategy because it will make the knots exaggeratedly swell
-- intermediaries of index pages.
--This is why the included columns were added to the SQL Server indexes: we will not
-- store this data only in the leaf levels of the indexes.
 

USE [EmployeeCaseStudy];
GO


-- STATISTICS IO ON
SET STATISTICS IO ON;
GO

-- Let's do our tests from this request

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO
--4009 logic reads


-- 1st option to not index the lastname column

CREATE INDEX [EmployeeLastNameIX]
ON [dbo].[Employee] ([LastName]);
GO

-- SELECT  : 
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

--We go to SCAN, the index created is not relevant enough for SQL, we can also see
-- that SQL proposes an index with an INCLUDE ...

-- And if we force the index  

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLastNameIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

-- covering index

CREATE INDEX [EmployeeCoversAll4ColsIX] 
ON [dbo].[Employee] ([LastName], [FirstName], [MiddleInitial], [Phone]);
GO

-- select

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

-- SQL says Ok we're good for this one

-- with INCLUDE?

CREATE INDEX [EmployeeLNinKeyInclude3OtherColsIX] 
ON [dbo].[Employee] ([LastName])
INCLUDE ([FirstName], [MiddleInitial], [Phone]);
GO

-- Does SQL server use it?
SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

--SQL Server rather takes the covering index instead of the index with the INCLUDE

-- What if we force the index and play both requests at the same time?

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e] WITH (INDEX ([EmployeeLNinKeyInclude3OtherColsIX]))
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

SELECT [e].[LastName], [e].[FirstName], 
  [e].[MiddleInitial], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%';
GO

-- We gain 2 Io for the include

-- The spanning index stores all columns in intermediate pages and leaf-level pages of the index tree.
-- An index of this type therefore has a fairly strong impact on the volume.
-- In addition, it should be remembered that if the data of this type of column is modified,
-- this will impact the system because it is also necessary to modify the index in question.


-- The include index stores all the columns in the leaf level pages.
-- In the intermediate levels of the tree, only the key column is stored.
-- This allows more information to be stored on a page, and therefore provides more performance during the journey
-- of the tree.
-- In addition, when adding or modifying data on a column that is part of the index,
-- the system is much less penalized compared to a covering index, because only the leaf level will be impacted.