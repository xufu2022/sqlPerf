USE [Credit];
GO

UPDATE  [dbo].[charge]
SET     [charge_code] = N'XY'
WHERE   [charge_no] = 1342773;
GO

CREATE PROCEDURE [dbo].[Charge_Member]
    @charge_code NVARCHAR(2)
AS
    SELECT  [m].[member_no], [c].[charge_amt]
    FROM    [dbo].[charge] AS [c]
            INNER JOIN [dbo].[member] AS [m]
			ON [m].[member_no] = [c].[member_no]
    WHERE   [c].[charge_code] = @charge_code;
GO

EXEC sp_helpindex 'dbo.charge';
GO

CREATE INDEX [IX_charge_charge_code] 
ON [dbo].[charge] ([charge_code])
INCLUDE ([charge_amt]);
GO

-- Include the plan
SET STATISTICS IO ON;

EXEC [dbo].[Charge_Member] N'XY';

SET STATISTICS IO OFF;
GO

-- And now?
ALTER PROCEDURE [dbo].[Charge_Member] @charge_code CHAR(2)
AS
    SELECT  [m].[member_no], [c].[charge_amt]
    FROM    [dbo].[charge] AS [c]
            INNER JOIN [dbo].[member] AS [m]
			ON [m].[member_no] = [c].[member_no]
    WHERE   [c].[charge_code] = @charge_code;
GO

-- Include the plan
SET STATISTICS IO ON;

EXEC [dbo].[Charge_Member] 'XY';

SET STATISTICS IO OFF;
GO


-- Takeaway:
-- Use matching data types for join and filter predicates

-- Naming conventions can help here
--	(t1.charge_code = t2.charge_code = @charge_code)

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
