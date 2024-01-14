USE [Credit];
GO

-- Let's say you're worried about concurrency, so you decide to 
-- "chunk" modifications into smaller blocks

-- And then let's go to the messages tab while it executes
WHILE EXISTS ( SELECT   1
               FROM     [dbo].[charge]
               WHERE    [charge_code] = '' )
    BEGIN
        UPDATE TOP ( 500 )
                [dbo].[charge]
        SET     [charge_code] = 'ZA'
        WHERE   [charge_code] = '';
    END

-- Options?  
-- Increase the "chunks" or 
-- decrease to one operation if concurrency permits
UPDATE  [dbo].[charge]
SET     [charge_code] = 'AB'
WHERE   [charge_code] = '';
GO

-- And to reduce network chatter even further, consider:
SET NOCOUNT ON;
UPDATE  [dbo].[charge]
SET     [charge_code] = ''
WHERE   [charge_code] = 'AB';
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
