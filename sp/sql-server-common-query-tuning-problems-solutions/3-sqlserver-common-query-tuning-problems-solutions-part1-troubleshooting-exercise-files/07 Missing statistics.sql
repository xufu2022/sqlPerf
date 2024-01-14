USE [master]
GO

-- If you see this disable in production, ask questions!
ALTER DATABASE [Credit] SET AUTO_CREATE_STATISTICS OFF WITH NO_WAIT;
GO

USE [Credit];
GO

-- Creating a new table based on charge
SELECT  [charge_no], [member_no], [provider_no], [category_no], [charge_dt],
        [charge_amt], [statement_no], [charge_code]
INTO    dbo.[charge_guess]
FROM    dbo.[charge];
GO

-- Include actual execution plan
SELECT  [charge_no], [member_no], [provider_no], [category_no], [charge_dt],
        [charge_amt], [statement_no], [charge_code]
FROM    [dbo].[charge_guess]
WHERE   [provider_no] = 500;

-- If you see a this warning, it should be top-of-the-list to address

-- Option #1, manually create statistics
-- Option #2 (recommended), re-enable AUTO_CREATE_STATISTICS
USE [master]
GO

ALTER DATABASE [Credit] SET AUTO_CREATE_STATISTICS ON WITH NO_WAIT;
GO

USE [Credit];
GO

SELECT  [charge_no], [member_no], [provider_no], [category_no], [charge_dt],
        [charge_amt], [statement_no], [charge_code]
FROM    [dbo].[charge_guess]
WHERE   [provider_no] = 500;

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
