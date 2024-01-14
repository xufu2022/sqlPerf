USE [Credit];
GO

-- Include actual execution plan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 50.00;

-- Statistics for charge_amt?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS s
        INNER JOIN sys.[stats_columns] AS [sc] 
		ON [s].[stats_id] = [sc].[stats_id]
        AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.charge');

-- What is the highest RANGE_HI_KEY?
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000006_0DAF0CB0);

-- What is the estimate now?
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 5002.00;

-- What if we add 10,000 rows (small enough not to tip auto-update)?
-- (Turn off Actual Execution Plan)
SET NOCOUNT ON;
GO

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          484, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-06 01:01:21', -- charge_dt - datetime
          5002.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 10000

-- Did the estimate change?
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 5002.00;

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
