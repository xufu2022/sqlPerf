USE [Credit];
GO

-- Do you need all columns?
SELECT  *
FROM    [dbo].[charge]
WHERE   [statement_no] = 18408;

-- What if all you just needed the charge_no?
SELECT  [charge_no]
FROM    [dbo].[charge]
WHERE   [statement_no] = 18408;

-- Additional columns?
SELECT  [charge_no], [charge_amt]
FROM    [dbo].[charge]
WHERE   [statement_no] = 18408;

-- You can create a covering index - but what if you don't have to?
-- (consider index overhead)

-- And consider if you can modify an existing index
DROP INDEX [charge_statement_link] ON [dbo].[charge];
GO

CREATE NONCLUSTERED INDEX [charge_statement_link] ON [dbo].[charge]
(
	[statement_no] ASC
)
INCLUDE ([charge_amt])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, 
ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON);
GO

-- The plan?
SELECT  [charge_no], [charge_amt]
FROM    [dbo].[charge]
WHERE   [statement_no] = 18408;

-- Takeaway:
-- Only retrieve columns you will actually need and use

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
