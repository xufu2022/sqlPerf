USE [Credit];
GO

CREATE NONCLUSTERED INDEX [charge_charge_dt]
ON [dbo].[charge] ([charge_dt])
INCLUDE ([charge_amt], [charge_code],[member_no]);
GO

CREATE PROCEDURE [dbo].[Charge_Member]
    @charge_dt NVARCHAR(MAX)
AS
    SELECT  [m].[member_no], [c].[charge_amt]
    FROM    [dbo].[charge] AS [c]
            INNER JOIN [dbo].[member] AS [m] ON 
			[m].[member_no] = [c].[member_no]
    WHERE   CONVERT(NVARCHAR(MAX), [c].[charge_dt], 121) = @charge_dt;
GO

CREATE PROCEDURE [dbo].[Charge_Member_v2] @charge_dt DATETIME
AS
    SELECT  [m].[member_no], [c].[charge_amt]
    FROM    [dbo].[charge] AS [c]
            INNER JOIN [dbo].[member] AS [m] ON 
			[m].[member_no] = [c].[member_no]
    WHERE   [c].[charge_dt] = @charge_dt;
GO

-- Include actual plans
EXEC [dbo].[Charge_Member] '1999-07-14 10:43:38.273';
EXEC [dbo].[Charge_Member_v2] '1999-07-14 10:43:38.273';
GO

-- False positives
SELECT  CAST([m].[member_no] AS VARCHAR(25)) AS [member_no], [c].[charge_dt],
        [c].[charge_amt], [c].[charge_code]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m] ON 
		[m].[member_no] = [c].[member_no]
WHERE   [c].[charge_dt] = '1999-07-14 10:43:38.273';

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