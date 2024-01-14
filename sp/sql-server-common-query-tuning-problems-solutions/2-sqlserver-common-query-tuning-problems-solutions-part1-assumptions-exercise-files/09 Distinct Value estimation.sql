USE [Credit];
GO

-- Include actual execution plan
SELECT DISTINCT [charge_dt]
FROM [dbo].[charge];
GO

-- Statistics?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS [s]
        INNER JOIN sys.[stats_columns] AS [sc]
		ON [s].[stats_id] = [sc].[stats_id]
		AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID(N'dbo.charge');

-- What is the "all density" value?
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH DENSITY_VECTOR;

-- Reciprocal 
SELECT 1/9.882204E-06;

-- 101192.001298496
-- Rounded up 101193

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