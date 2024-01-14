USE [Credit];
GO

CREATE PROCEDURE [dbo].[Charge_No_by_Charge_Amt]
	@charge_amt MONEY
AS

SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = @charge_amt;
GO

-- Include actual execution plan
EXECUTE [dbo].[Charge_No_by_Charge_Amt] 50.00;

-- Estimated number of rows 513.474 (instead of 318.916
-- density vector guess)

-- Also, look at the parameter compiled and runtime values

-- EQ_ROWS = 513.4741
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0)
WITH HISTOGRAM;

-- Does this "scale"?

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

-- Any change in estimates?
EXECUTE [dbo].[Charge_No_by_Charge_Amt] 50.00;

-- In test only, please
DBCC FREEPROCCACHE;

-- Now we see an estimate of 516.683, from 513.4741
EXECUTE [dbo].[Charge_No_by_Charge_Amt] 50.00;

DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000006_0DAF0CB0);

SELECT 513.4741/1600000;
GO

-- 516.683312320000
SELECT 0.000320921312 * (SELECT COUNT(*) FROM [dbo].[charge]);

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
