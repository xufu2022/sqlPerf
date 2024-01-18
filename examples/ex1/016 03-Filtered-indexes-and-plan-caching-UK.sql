/*******************************************************************************
********************** Filtered indexes and the cache plan      *****************
********************************************************************************/

-- Beware of the behavior of the filtered index in some PS calls, let's see why in demo

USE [master];
GO

-- ALTER DATABASE EmployeeCaseStudy SET SINGLE_USER WITH ROLLBACK immediate


RESTORE DATABASE [Structuredindex]
FROM DISK = N'D:\DATA\EmployeeCaseStudySampleDB2012.bak'
WITH MOVE N'EmployeeCaseStudyData' 
		TO N'D:\EmployeeCaseStudyData.mdf',  
	 MOVE N'EmployeeCaseStudyLog' 
		TO N'D:\EmployeeCaseStudyLog.ldf',
	 STATS = 10, REPLACE;
GO

USE [Structuredindex];
GO


-- Activation of statistics and execution plan
SET STATISTICS IO ON;
GO


--Creation of a filtered index

CREATE INDEX [EmployeeWestCoastCoveringFilteredIX]
ON [dbo].[Employee] ([State])
INCLUDE ([EmployeeID], [Address], [Status])
WHERE [State] IN ('AK', 'WA', 'OR', 'CA');
GO

-- Let's launch this query which will take into account our filtered index

SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e]
WHERE [e].[State] = ('AK');
GO

-- Ok the filtered index is used

-- and washington ? 

SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e]
WHERE [e].[State] = ('WA');
GO

-- Ok the filtered index is used 
-- And Miami ? 

SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e]
WHERE [e].[State] IN ('MI');
GO

-- Of course he only took the filtered, logical index ...

-- Creation of the PS to call a state:

CREATE PROCEDURE [GetDataByState] (@State char(2)) -- call a state
AS
SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e]
WHERE [e].[State] = @State;
GO

EXECUTE [GetDataByState] 'AK';-- Index filtered
EXECUTE [GetDataByState] 'WA';-- Index filtered
EXECUTE [GetDataByState] 'MI';-- Index non filtered
GO

-- None uses the filtered index !!!!
-- SQL server detected a filtered index and could say be careful, this execution plan could not be
-- not be the right one, hence the yellow triangle

-- If you go to the properties of SELECT (F4) we can see an unmatched index ...

--Ok so let's go on a RECOMPILE

EXECUTE [GetDataByState] 'AK' WITH RECOMPILE;
EXECUTE [GetDataByState] 'WA' WITH RECOMPILE;
EXECUTE [GetDataByState] 'MI' WITH RECOMPILE;
GO

-- Same result

--So forced the index

ALTER PROCEDURE [GetDataByState] (@State char(2)) 
AS
SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e] 
	WITH (INDEX ([EmployeeWestCoastCoveringFilteredIX]))
WHERE [e].[State] = @State;
GO

EXECUTE [GetDataByState] 'AK';
EXECUTE [GetDataByState] 'WA';
EXECUTE [GetDataByState] 'MI';
GO

--Error message we can't do it

--with option WITH RECOMPILE

ALTER PROCEDURE [GetDataByState] (@State char(2)) 
WITH RECOMPILE
AS
SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[State] = @State;
GO

EXECUTE [GetDataByState] 'AK';
EXECUTE [GetDataByState] 'WA';
EXECUTE [GetDataByState] 'MI';
GO

-- And the OPTION (OPTIMIZE FOR ...) ??


ALTER PROCEDURE [GetDataByState] (@State char(2)) 
AS
SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[State] = @State
OPTION (OPTIMIZE FOR (@State = 'AK'));
GO

EXECUTE [GetDataByState] 'AK';
EXECUTE [GetDataByState] 'WA';
EXECUTE [GetDataByState] 'MI';
GO

-- RECOMPILE OPTION in the PS


ALTER PROCEDURE [GetDataByState] (@State char(2)) 
AS
SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
FROM [dbo].[Employee] AS [e] 
WHERE [e].[State] = @State
OPTION (RECOMPILE);
GO

EXECUTE [GetDataByState] 'AK';
EXECUTE [GetDataByState] 'WA';
EXECUTE [GetDataByState] 'MI';
GO

--It was hard ... :)

--We can also do it this way (little tip)

ALTER PROCEDURE [GetDataByState] (@State char(2)) 
AS
IF @State IN ('AK', 'WA', 'OR', 'CA')
	SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
	FROM [dbo].[Employee] AS [e] 
	WHERE [e].[State] = @State
		AND [e].[State] IN ('AK', 'WA', 'OR', 'CA')
ELSE
	SELECT [e].[EmployeeID], [e].[Address], [e].[Status]
	FROM [dbo].[Employee] AS [e] 
	WHERE [e].[State] = @State;
GO

EXECUTE [GetDataByState] 'AK';
EXECUTE [GetDataByState] 'WA';
EXECUTE [GetDataByState] 'MI';
GO