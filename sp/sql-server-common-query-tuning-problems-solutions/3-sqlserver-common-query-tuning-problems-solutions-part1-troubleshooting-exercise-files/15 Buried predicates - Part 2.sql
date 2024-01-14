-- Keep column references as "clean" as possible
USE [Credit];
GO

-- Now here is an example where cardinality is guessed
SELECT  [member_no], [middleinitial], [street]
FROM [dbo].[member]
WHERE [firstname] + ' ' + [lastname] = 'BWRAE ZUCKER';

-- And this?
SELECT  [member_no], [middleinitial], [street]
FROM [dbo].[member]
WHERE [firstname] = 'BWRAE' AND
		[lastname] = 'ZUCKER';

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