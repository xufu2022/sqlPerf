-- Setup script for Using sys.dm_db_index_physical_stats demo
USE [master];
GO

IF DATABASEPROPERTYEX (N'StructuredindexIndex', N'Version') > 0
BEGIN
	ALTER DATABASE [Structuredindex] SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [Structuredindex];
END
GO

CREATE DATABASE [Structuredindex]

ALTER DATABASE [Structuredindex] SET RECOVERY SIMPLE;
GO

USE [Structuredindex];
GO

SET NOCOUNT ON;
GO

-- Create a table with a GUID key
CREATE TABLE [BadKeyTable] (
	[c1] UNIQUEIDENTIFIER DEFAULT NEWID () ROWGUIDCOL,
    [c2] DATETIME DEFAULT GETDATE (),
	[c3] CHAR (400) DEFAULT 'a',
	[c4] VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX [BadKeyTable_CL] ON
	[BadKeyTable] ([c1]);
CREATE NONCLUSTERED INDEX [BadKeyTable_NCL] ON
	[BadKeyTable] ([c2]);
GO

-- Create another one, but using
-- NEWSEQUENTIALID instead
CREATE TABLE [BetterKeyTable] (
	[c1] UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID () ROWGUIDCOL,
    [c2] DATETIME DEFAULT GETDATE (),
	[c3] CHAR (400) DEFAULT 'a',
	[c4] VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX [BetterKeyTable_CL] ON
	[BetterKeyTable] ([c1]);
CREATE NONCLUSTERED INDEX [BetterKeyTable_NCL] ON
	[BetterKeyTable] ([c2]);
GO

-- Insert 250,000 rows
SET NOCOUNT ON;
GO
DECLARE @a INT;
SELECT @a = 0;
WHILE (@a < 250000)
BEGIN
	INSERT INTO [BetterKeyTable] DEFAULT VALUES;
	SELECT @a = @a + 1;
END;
GO
DECLARE @a INT;
SELECT @a = 0;
WHILE (@a < 250000)
BEGIN
	INSERT INTO [BadKeyTable] DEFAULT VALUES;
	SELECT @a = @a + 1;
END;
GO
