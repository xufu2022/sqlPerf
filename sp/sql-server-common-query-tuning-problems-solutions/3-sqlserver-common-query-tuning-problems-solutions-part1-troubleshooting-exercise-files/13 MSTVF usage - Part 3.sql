USE [Credit];
GO

-- Creating an inline table-valued function
CREATE FUNCTION dbo.udf_in_charge_amt ( @member_no INT )
RETURNS TABLE
AS
RETURN
    ( SELECT    TOP 100000
				[charge_no], [charge_dt], [charge_amt]
      FROM      [dbo].[charge]
      WHERE     [member_no] = @member_no
	  ORDER BY [charge_no]
    );
GO

-- Whats the cost now?
SELECT  TOP 10 [m].[firstname], [m].[lastname], [c].[charge_no],
	 [c].[charge_dt], MAX([c].[charge_amt]) max_amount
FROM    [dbo].[member] AS [m]
        CROSS APPLY [dbo].[udf_in_charge_amt]([m].[member_no]) AS [c]
WHERE   [c].[charge_amt] > 1000.00
        AND [m].[region_no] = 2
GROUP BY [m].[firstname], [m].[lastname], [c].[charge_no], [c].[charge_dt];

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