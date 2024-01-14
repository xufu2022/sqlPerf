USE [Credit];
GO

-- There is a balancing act between reducing page splits and
-- decreasing I/Os required for query execution

ALTER INDEX [ChargePK] ON [dbo].[charge] REBUILD
WITH (FILLFACTOR = 5);

-- I/O required?
SET STATISTICS IO ON;

SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_no] BETWEEN 1 AND 100000;

/*
Table 'charge'. Scan count 1, logical reads 11132, 
physical reads 0, read-ahead reads 0, 
lob logical reads 0, lob physical reads 0, 
lob read-ahead reads 0.
*/

ALTER INDEX [ChargePK] ON [dbo].[charge] REBUILD
WITH (FILLFACTOR = 90);

-- I/O required?
SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_no] BETWEEN 1 AND 100000;



/*
Table 'charge'. Scan count 1, logical reads 650, 
physical reads 0, read-ahead reads 4, 
lob logical reads 0, lob physical reads 0, 
lob read-ahead reads 0.
*/

-- What about singleton operations?
ALTER INDEX [ChargePK] ON [dbo].[charge] REBUILD
WITH (FILLFACTOR = 5);

-- I/O required?
SET STATISTICS IO ON;

SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_no] = 45;

ALTER INDEX [ChargePK] ON [dbo].[charge] REBUILD
WITH (FILLFACTOR = 90);

SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_no] = 45;

SET STATISTICS IO OFF;

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
