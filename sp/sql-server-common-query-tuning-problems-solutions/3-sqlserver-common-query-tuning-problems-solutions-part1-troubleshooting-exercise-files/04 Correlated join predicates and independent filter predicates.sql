USE [Credit];
GO

 -- For this first query, we'll want to use
 -- compatibility level < 120 (you'll see why this matters)
SELECT  [name], [compatibility_level]
FROM    [sys].[databases];

-- "Simple" containment for the Merge Join
-- Estimated rows, 266.284
SELECT  [c].[charge_no], [m].[prev_balance]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m] 
		ON [m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] = 50.00
        AND [m].[lastname] = 'ZUCKER';

USE [master];
GO
ALTER DATABASE [Credit] SET COMPATIBILITY_LEVEL = 120;
GO

-- Validate
SELECT  [name], [compatibility_level]
FROM    [sys].[databases];



-- SQL Server 2014 New CE "Base" containment
-- Estimated rows for the join, 21.8087
USE [Credit];
GO

SELECT  [c].[charge_no], [m].[prev_balance]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m] 
		ON [m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] = 50.00
        AND [m].[lastname] = 'ZUCKER';

-- Reduced correlation assumed for non-join predicates

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
