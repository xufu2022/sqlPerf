USE [Credit];
GO

-- Include actual execution plan
-- And feel free to cancel after a few seconds....
DECLARE @charge_no INT ,
    @charge_amt MONEY;

DECLARE [charge_cursor] CURSOR
FOR
    SELECT  [c].[charge_no] ,
            [c].[charge_amt]
    FROM    [dbo].[charge] AS [c]

OPEN [charge_cursor]

FETCH NEXT FROM [charge_cursor]
INTO @charge_no, @charge_amt;

WHILE @@FETCH_STATUS = 0
    BEGIN

        UPDATE  [dbo].[charge]
        SET     [charge_amt] = @charge_amt * 1.01
        WHERE   [charge_no] = @charge_no;

    END

CLOSE [charge_cursor];
DEALLOCATE [charge_cursor];

-- Contrast the prior method to the following
UPDATE  [dbo].[charge]
SET     [charge_amt] = [charge_amt] * 1.01;

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
