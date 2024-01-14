USE [Credit];
GO

-- Stale <> old
-- Stale = no longer reflects current state in an helpful way

-- Kick off auto-creation of stats
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '1999-06-21 10:45:09.627';

-- Statistics?
SELECT  [s].[object_id], [s].[stats_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS s
        INNER JOIN sys.[stats_columns] AS [sc] 
		ON [s].[stats_id] = [sc].[stats_id]
        AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.charge');

DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0);

-- Let's modify 10,000 rows (still underneath an auto-update threshold)
UPDATE [dbo].[charge]
SET [charge_dt] = '1999-06-21 10:45:09.627'
WHERE charge_no BETWEEN 1 AND 10000;
GO

-- Our estimate?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '1999-06-21 10:45:09.627';

-- Stale stats options?
-- Option 1 - more frequent manual updates
-- Option 2 - Trace flag 2371 for more frequent updates on large tables
--			  See "SQL Server: Troubleshooting Query Plan Quality Issues" 
--			  for a demonstration of this trace flag.
--			  http://bit.ly/PlanQuality 

UPDATE STATISTICS [dbo].[charge] _WA_Sys_00000005_0DAF0CB0
WITH RESAMPLE;

-- Our estimate?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '1999-06-21 10:45:09.627';

-- Why?
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0);

-- We'll talk about sampling issues next

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
