USE [Credit];
GO

-- Include actual execution plan
DECLARE @charge_amt MONEY = 50.00;

SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = @charge_amt;

-- The 318.916 estimated rows for the Clustered Index Scan
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0)
WITH DENSITY_VECTOR;

-- 318.9156800000
SELECT 0.0001993223 * (SELECT COUNT(*) FROM dbo.[charge]);

-- Does this "scale" as well?

-- Turn off actual execution plan before inserting
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

-- Test system only please
DBCC FREEPROCCACHE;

-- Include actual execution plan
DECLARE @charge_amt MONEY = 50.00;

SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = @charge_amt;

-- The 318.916 estimated rows for the Clustered Index Scan
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0)
WITH DENSITY_VECTOR;

-- 320.9089030000
SELECT 0.0001993223 * (SELECT COUNT(*) FROM dbo.[charge]);

DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0)
WITH STAT_HEADER;

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