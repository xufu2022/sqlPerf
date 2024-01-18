/*******************************************************************************
**************************   FILLFACTOR        ********************************
********************************************************************************/

-- A good way to avoid disk fragmentation is to set the FILL FACTOR appropriately.
-- 70% = 30% free data pages
-- 100% = 0% free data pages

-- The idea is to leave a certain amount of space to avoid filling the pages, 
-- and to avoid fragmentation

-- Caution: FILLFACTOR is only used when an INDEX is created, rebuilt or reorganized
-- Most DBAs usually choose 70% first


USE [master]
GO

IF DATABASEPROPERTYEX (N'Structuredindex', N'Version') > 0
BEGIN
	ALTER DATABASE [Structuredindex] SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [Structuredindex];
END
GO

CREATE DATABASE [Structuredindex];
GO

USE Structuredindex
go
-- Create a table : 
drop TABLE [Random]
CREATE TABLE [Random] (
	[intCol]		INT,
	[charCol]		CHAR (2000));

INSERT INTO [Random] VALUES (1, REPLICATE ('Row1', 500));
GO
INSERT INTO [Random] VALUES (3, REPLICATE ('Row3', 500));
GO
INSERT INTO [Random] VALUES (5, REPLICATE ('Row5', 500));
GO
INSERT INTO [Random] VALUES (7, REPLICATE ('Row7', 500));
GO
INSERT INTO [Random] VALUES (9, REPLICATE ('Row9', 500));
GO
INSERT INTO [Random] VALUES (11, REPLICATE ('Row11', 400));
GO
INSERT INTO [Random] VALUES (13, REPLICATE ('Row13', 400));
GO
INSERT INTO [Random] VALUES (15, REPLICATE ('Row15', 400));
GO
INSERT INTO [Random] VALUES (17, REPLICATE ('Row17', 400));
GO
INSERT INTO [Random] VALUES (19, REPLICATE ('Row19', 400));
GO
INSERT INTO [Random] VALUES (21, REPLICATE ('Row21', 400));
GO
INSERT INTO [Random] VALUES (23, REPLICATE ('Row23', 400));
GO

-- No predefined fill FACTOR when creating the clustered index: 

CREATE CLUSTERED INDEX [Random_CL] ON [Random] ([intCol]);
GO


--  TRACEFLAG
DBCC TRACEON (3604);
GO

-- Let's check the root page:

DBCC SEMETADATA (N'Random');
GO

-- let's look in detail: 

DBCC PAGE (N'Structuredindex', 1, 280, 3);
GO

-- Next page (1:280) and 44 bytes left on the root page

-- Let's talk about fragmentation:

INSERT INTO [Random] VALUES (2, REPLICATE ('Row2', 500));
GO

-- let's look in detail: 

DBCC PAGE (N'Structuredindex', 1, 232, 3);
GO

-- The page has been split in two, due to fragmentation, and half of the page remains: 2614 bytes

-- Let's start again:

-- Set FILLFACTOR to 70:


CREATE CLUSTERED INDEX [Random_CL] ON [Random] ([intCol])
WITH (FILLFACTOR = 70);
GO

-- let's look at the root page: 

DBCC SEMETADATA (N'Random');
GO

-- let's look at the relevant page

DBCC PAGE (N'Structuredindex', 1,240,3);
GO

-- This leaves 2057 bytes instead of 44 bytes, with 3 lines to insert a new line without creating a split

-- fragmentation?

INSERT INTO [Random] VALUES (2, REPLICATE ('Row2', 500));
GO

-- let's look at the relevant page
DBCC PAGE (N'Structuredindex', 1, 240, 3);
GO
-- Bingo no fragmentation created by inserting a new line

-- Can we touch the FILL FACTOR by rebuilding the index:


CREATE CLUSTERED INDEX [Random_CL] ON [Random] ([intCol])
GO

-- Let's look at the FILLFACTOR:
SELECT
	[s].[name] AS [schema_name],
    [o].[name] AS [table_name],
    [i].[name] AS [index_name],
    [i].[fill_factor]
FROM sys.indexes AS [i]
JOIN sys.objects AS [o]
    ON [i].[object_id] = [o].[object_id]
JOIN sys.schemas AS [s]
    ON [o].[schema_id] = [s].[schema_id]
WHERE [o].[is_ms_shipped] = 0;
GO

-- FILL Factor 0 :

-- Reorganize to set the fill factor?
ALTER INDEX [Random_CL] ON [Random] REORGANIZE
WITH (FILLFACTOR = 70);
GO

ALTER INDEX [Random_CL] ON [Random] REBUILD
WITH (FILLFACTOR = 70);
GO
-- We can change the FILL FACTOR by doing a REBUILD

-- In summary : 

-- There is actually no magic solution to implement a FILL FACTOR
-- choose your FILL FACTOR and see if fragmentation occurs very quickly
-- If it does, increase or decrease it
-- For an index that does not have fragmentation, there is no reason to change the FILLFACTOR
-- 



