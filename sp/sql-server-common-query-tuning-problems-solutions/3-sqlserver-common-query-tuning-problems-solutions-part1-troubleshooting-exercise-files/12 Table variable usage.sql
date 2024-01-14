USE [Credit];
GO

-- Include actual plan
DECLARE @charge TABLE
	([charge_no] INT,
	 [member_no] INT,
	 [charge_amt] MONEY);

INSERT @charge
([charge_no] , [member_no], [charge_amt])
SELECT [charge_no] , [member_no], [charge_amt]
FROM [dbo].[charge];

SELECT  [c].[charge_no], [m].[member_no], [m].[prev_balance]
FROM    @charge AS [c]
        INNER JOIN [dbo].[member] AS [m] ON 
		[m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] > 1.00;
GO

-- Switch to a temporary table?
CREATE TABLE #charge 
	([charge_no] INT,
	 [member_no] INT,
	 [charge_amt] MONEY);

INSERT #charge
([charge_no] , [member_no], [charge_amt])
SELECT [charge_no] , [member_no], [charge_amt]
FROM [dbo].[charge];

SELECT  [c].[charge_no], [m].[member_no], [m].[prev_balance]
FROM    #charge AS [c]
        INNER JOIN [dbo].[member] AS [m] ON 
		[m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] > 1.00;
GO

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

DROP TABLE #charge;
GO
