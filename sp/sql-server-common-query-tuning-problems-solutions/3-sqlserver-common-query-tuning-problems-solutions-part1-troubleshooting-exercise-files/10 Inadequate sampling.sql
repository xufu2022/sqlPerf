-- Sometimes sampling isn't good enough and interesting "points"
-- can be missed

-- Typical tradeoff is between stats quality and full scan overhead
USE [Credit];
GO

-- Kick off auto-creation of stats (uses sampling!)
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

-- The histogram is not lossless:
--		Some distinct values aren't represented by steps
--	    Some frequencies are not accurate (enough)
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH HISTOGRAM;

-- For the 1999-06-24 10:45:25.720 step:
--	RANGE_ROWS = 19471.86	
--	DISTINCT_RANGE_ROWS = 1218
--	AVG_RANGE_ROWS = 15.98418

-- What do the date frequencies look like between two histogram steps?
SELECT [charge_dt], COUNT(*)
FROM [dbo].[charge]
WHERE [charge_dt] > '1999-06-22 10:49:24.263'
AND [charge_dt] < '1999-06-24 10:45:25.720'
GROUP BY [charge_dt]
ORDER BY [charge_dt];

-- So from a sampling perspective, this does reflect rows pretty well

-- Now let's UPDATE STATISTICS with FULLSCAN
UPDATE STATISTICS [dbo].[charge] _WA_Sys_00000005_0DAF0CB0
WITH FULLSCAN;

DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH HISTOGRAM;

-- For the 1999-06-24 10:45:25.720 step:
--	RANGE_ROWS = 7920 (was originally 19471.86)	
--	DISTINCT_RANGE_ROWS = 494 (was originally 1218)
--	AVG_RANGE_ROWS = 16.03239 (was originally 15.98418)

-- Even with the significant differences with RANGE_ROWS 
-- and DISTINCT_RANGE_ROWS, the average remains similar
-- But the key are to monitor is when AVG_RANGE_ROWS is significantly "off" 
-- (similar to the "Jagged Distributions" demo)

SELECT [charge_dt], COUNT(*)
FROM [dbo].[charge]
WHERE [charge_dt] > '1999-06-22 10:49:24.263'
AND [charge_dt] < '1999-06-24 10:45:25.720'
GROUP BY [charge_dt]
ORDER BY [charge_dt];

-- Let's modify several rows to a specific value 
UPDATE [dbo].[charge]
SET [charge_dt] = '1999-06-22 10:50:23.767'
WHERE [charge_dt] > '1999-06-22 10:49:24.353' AND
	[charge_dt] < '1999-06-22 10:50:23.767';
GO

-- Our estimate?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '1999-06-22 10:50:23.767';

-- Update using a sampling
UPDATE STATISTICS [dbo].[charge] _WA_Sys_00000005_0DAF0CB0
WITH SAMPLE 10 PERCENT;
GO

-- Our estimate?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '1999-06-22 10:50:23.767';

UPDATE STATISTICS [dbo].[charge] _WA_Sys_00000005_0DAF0CB0
WITH FULLSCAN;
GO

-- Our estimate?
SELECT [charge_no], [charge_dt] 
FROM  [dbo].[charge]
WHERE [charge_dt] = '1999-06-22 10:50:23.767';

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





