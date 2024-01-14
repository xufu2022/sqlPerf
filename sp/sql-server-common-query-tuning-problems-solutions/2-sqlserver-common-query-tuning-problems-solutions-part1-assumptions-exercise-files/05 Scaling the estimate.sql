USE [Credit];
GO

-- The prior demo showed that EQ_ROWS and estimated rows matched
-- Include actual execution plan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 50.00;

-- What if we add 10,000 rows (small enough not to tip auto-update)?
SET NOCOUNT ON;
GO

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
						[charge_dt], [charge_amt], [statement_no],
						[charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          484, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-06 01:01:21', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          );
GO 10000

-- Include actual execution plan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 50.00;

-- Estimate is up to 516.683 from 513.474

-- Statistics for charge_amt?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS [s]
        INNER JOIN sys.[stats_columns] AS [sc]
		ON [s].[stats_id] = [sc].[stats_id]
		AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID(N'dbo.charge');

-- What is the selectivity for the specific 50.00 step?
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0);

SELECT 513.4741/1600000;
GO

-- And what is the selectivity * current rowcount?
SELECT 0.000320921312 * (SELECT COUNT(*) FROM [dbo].[charge]);

-- 516.683!

-- So we take selectivity of the predicate multiplied times 
-- the * current * table cardinality

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
