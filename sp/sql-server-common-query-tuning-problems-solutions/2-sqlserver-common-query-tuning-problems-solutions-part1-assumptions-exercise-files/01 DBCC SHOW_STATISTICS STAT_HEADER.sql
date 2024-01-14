USE [Credit];
GO

-- Check statistics on the dbo.charge table
SELECT	[s].[object_id], [s].[name], [s].[auto_created],
		COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM	sys.[stats] AS [s]
		INNER JOIN sys.[stats_columns] AS [sc]
		ON [s].[stats_id] = [sc].[stats_id]
			AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.charge');

-- Predicate referencing charge_dt
SELECT	[charge_no]
FROM	[dbo].[charge] AS c
WHERE	[charge_dt] = '1999-07-20 10:44:42.157';

-- Check statistics again
SELECT	[s].[object_id], [s].[name], [s].[auto_created],
		COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM	sys.[stats] AS [s]
		INNER JOIN sys.[stats_columns] AS [sc]
		ON [s].[stats_id] = [sc].[stats_id]
			AND [s].[object_id] = [sc].[object_id]
WHERE	[s].[object_id] = OBJECT_ID(N'dbo.charge');

-- Use DBCC SHOW_STATISTICS with STAT_HEADER
-- And let's focus on:
	--	Updated date
	--	Rows
	--	Rows Sampled
	--  Steps
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH STAT_HEADER;
GO

-- Restoring from demo database from backup
USE [master];

ALTER DATABASE [Credit] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE [Credit]
FROM	DISK = N'C:\Temp\CreditBackup100.bak' 
WITH	FILE = 1,
		MOVE N'CreditData' TO
			N'S:\MSSQL12.MSSQLSERVER\MSSQL\DATA\CreditData.mdf',  
		MOVE N'CreditLog' TO
			N'S:\MSSQL12.MSSQLSERVER\MSSQL\DATA\CreditLog.ldf',
		NOUNLOAD,  STATS = 5;

ALTER DATABASE [Credit] SET MULTI_USER;
GO
