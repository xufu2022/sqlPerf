-- Keep column references as "clean" as possible
USE [Credit];
GO

-- Index on charge_amt
CREATE NONCLUSTERED INDEX [IX_Charge_Charge_Amt] 
ON [dbo].[charge] ([charge_amt]);
GO

-- In this example, cardinality matches, BUT...
-- Include Actual Execution plan
SELECT  [charge_no], [charge_amt]
FROM [dbo].[charge]
WHERE [charge_amt] * 2 < 3.00;

-- And this?
SELECT  [charge_no], [charge_amt]
FROM [dbo].[charge]
WHERE [charge_amt]  < 3.00 / 2;

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