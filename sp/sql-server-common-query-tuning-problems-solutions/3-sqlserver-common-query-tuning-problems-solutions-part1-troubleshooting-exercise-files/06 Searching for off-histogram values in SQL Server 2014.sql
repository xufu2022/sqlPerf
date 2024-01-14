USE [Credit];
GO

-- Include actual execution plan
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-06 01:01:21';

-- Let's insert 10,000 new rows 
-- (Not enough to exceed the auto-update threshold)
-- Turn off "include actual plan"
SET NOCOUNT ON;

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-06 01:01:21', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 10000

-- The estimate?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-06 01:01:21';

-- Now let's see the behavior with the new CE
USE [master];
GO
ALTER DATABASE [Credit] SET COMPATIBILITY_LEVEL = 120;
GO

-- Estimate in SQL Server 2014, model 120?
USE [Credit];
GO

SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-06 01:01:21';

-- Where did 15.8115 come from?
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0);

-- The new CE uses the average frequency of distinct values in the column
SELECT 9.882204E-06 * 1600000;

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