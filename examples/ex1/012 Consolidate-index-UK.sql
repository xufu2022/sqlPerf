/*******************************************************************************
********************** Consolidate the indexes on your table     ****************
********************************************************************************/

-- It is not uncommon to see this type of indexing in (many) tables:

-- Index on : 

-- (Lastname), for example on a SELECT with a Where (lastname)
-- (Lastname,firstname,middleinitial)
-- (Lastname,Firstname) INCLUDE (phone)
-- (Lastname,Firstname) INCLUDE (SSN)

-- Lastname appears in 4 indexes, Firstname in three indexes...

-- So we'll consolidate our indexes to avoid redundant columns,
-- which will take up space on the page storage, take time on the index rebuild etc...

-- We can assume that an index of this type : 

-- (Lastname,firstname,middleinitial) INClUDE (phone,SSN) could be quite good :)

-- Play in the other window the script 

USE [master];
GO

-- ALTER DATABASE EmployeeCaseStudy SET SINGLE_USER WITH ROLLBACK immediate


RESTORE DATABASE [Structuredindex]
FROM DISK = N'D:\DATA\EmployeeCaseStudySampleDB2012.bak'
WITH MOVE N'EmployeeCaseStudyData' 
		TO N'D:\DATA\EmployeeCaseStudyData.mdf',  
	 MOVE N'EmployeeCaseStudyLog' 
		TO N'D:\DATA\EmployeeCaseStudyLog.ldf',
	 STATS = 10, REPLACE;
GO

USE [Structuredindex];
GO
-- Create 4 indexes: 

CREATE INDEX [EmployeeLnIX]
ON [Employee] ([LastName]);
GO

CREATE INDEX [EmployeeNameIX]
ON [Employee] ([LastName], [FirstName], [MiddleInitial]);
GO

CREATE INDEX [EmployeeLnIncludePhoneIX]
ON [Employee] ([LastName], [FirstName])
INCLUDE ([Phone]);
GO

CREATE INDEX [EmployeeLnFnIncludeSSNIX]
ON [Employee] ([LastName], [FirstName])
INCLUDE ([SSN]);
GO

-- Let's look at the indexes in detail 

EXEC [sp_SQLskills_helpindex] '[dbo].[Employee]';
GO

-- All indexes are enabled, and the clustered index is index_id =1
-- and the index_keys column shows the names of the unindexed columns 

-- Enable execution plan and statistics 

SET STATISTICS IO ON;
GO

-- Let's play this query and see which index is used: 
-- As a reminder, some queries use a SELECT * which is too large to cover the entire query
-- so it will do a bookmark lookup
-- Remember: we can't in some cases COVER the whole query!!!


SELECT [e].*
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] = N'Anderson'
	AND [e].[FirstName] = N'Tkim';
GO

-- This is the Employeename index is used 
-- And this one with the middleinitial column as well? 

SELECT [e].*
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] = N'Illmann'
	AND [e].[FirstName] = N'Kim'
	AND [e].[MiddleInitial] = N'M';
GO
-- This is the Employeename index is used 
-- OK let's define the columns in the index 

SELECT [e].[LastName], [e].[FirstName], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%'
ORDER BY [e].[LastName], [e].[FirstName];
GO
-- This is the index with the INCLUDE (phone) that is used 

-- And this one : 

SELECT [e].[LastName], [e].[FirstName], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[A-E]%'
ORDER BY [e].[LastName], [e].[FirstName];
GO

-- It is the index with the INCLUDE (SSN) that is used 

-- Note that in all of these queries there is a lot of similarity, 
-- and that for X reasons, these indexes were created by X person 
-- ( DBA, Developer, Tech Lead etc...)



-- And what does the sp_spaceused give?
 

EXEC [sp_spaceused] N'Structuredindex.dbo.Employee';
GO
--- 72 MB table with 40 MB of index 

-- OK let's analyse the index of the table again 

EXEC [sp_SQLskills_helpindex] '[dbo].[Employee]';
GO

-- Existing index :
--index_keys									included_columns
--[LastName]									NULL
--[LastName], [FirstName], [MiddleInitial]		NULL
--[LastName], [FirstName]						[Phone]
--[LastName], [FirstName]						[SSN]
 

-- In the logic, we will start with an index that will take Lastname, firstname (called several times)
-- and midlename, with an INCLUDE on phone and SSN

-- You can create an index with an INCLUDE like this: 

CREATE INDEX [ServerTuningIX] 
ON [dbo].[Employee] ([LastName], [FirstName], [MiddleInitial])
INCLUDE ([Phone], [SSN]);
GO
-- And you can disable the others, never delete an index without disabling it first :)

ALTER INDEX [EmployeeLnIX] ON [dbo].[Employee] DISABLE;
ALTER INDEX [EmployeeNameIX] ON [dbo].[Employee] DISABLE;
ALTER INDEX [EmployeeLnIncludePhoneIX] ON [dbo].[Employee] DISABLE;
ALTER INDEX [EmployeeLnFnIncludeSSNIX] ON [dbo].[Employee] DISABLE;
GO

EXEC [sp_SQLskills_helpindex] '[dbo].[Employee]';
GO
-- and we see the indexes that have been disabled in the is_disabled column

-- And let's replay our famous scripts 

SELECT [e].*
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] = N'Anderson'
	AND [e].[FirstName] = N'Tkim';
GO

-- Index servertuning used

-- And this one with the middleinitial column as well? 


SELECT [e].*
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] = N'Illmann'
	AND [e].[FirstName] = N'Kim'
	AND [e].[MiddleInitial] = N'M';
GO
-- Index servertuning used


-- OK let's define the columns in the index 
SELECT [e].[LastName], [e].[FirstName], [e].[Phone]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[S-Z]%'
ORDER BY [e].[LastName], [e].[FirstName];
GO
-- Index servertuning used

-- And this one: 

SELECT [e].[LastName], [e].[FirstName], [e].[SSN]
FROM [dbo].[Employee] AS [e]
WHERE [e].[LastName] LIKE '[A-E]%'
ORDER BY [e].[LastName], [e].[FirstName];
GO
-- Index servertuning used

-- Our index looks relevant, but what about storage? 


EXEC [sp_spaceused] N'Structuredindex.dbo.Employee';
GO  -- (15 MB instead of 41MB)


-- -- Test, test, test, test, test, ... ;-)