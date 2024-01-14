USE [Credit];
GO

-- Include actual execution plan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 50.00;

-- Statistics for charge_amt?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS [s]
        INNER JOIN sys.[stats_columns] AS [sc]
		ON [s].[stats_id] = [sc].[stats_id]
		AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID(N'dbo.charge');

-- The 513.474 estimated rows for the Clustered Index Scan
-- suggests we used sampled statistics.  Did we?
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0);

-- EQ_ROWS is 513.4741

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
