USE [Credit];
GO

EXEC sp_helpindex 'dbo.member';
GO

CREATE INDEX [IX_member_lastname] 
ON [dbo].[member] ([lastname])
INCLUDE ([firstname], [middleinitial], [street]);
GO

-- Include actual plan
-- Is our index used?
SELECT  [member_no], [firstname], [middleinitial], [street]
FROM [dbo].[member]
WHERE [lastname] = 'CHEN';

-- What about this?
SELECT  [member_no], [lastname], [firstname], [middleinitial],
	[street]
FROM [dbo].[member]
WHERE [lastname] LIKE 'CHEN%';

-- And this?
SELECT  [member_no], [lastname], [firstname], [middleinitial],
	[street]
FROM [dbo].[member]
WHERE [lastname] LIKE '%CHEN%';

-- Takeaway:
-- Big tables, coupled with leading wildcards means you'll be
-- scanning (index or heap).

-- If you can re-write without the leading wildcard, great,
-- otherwise you might need to consider other methods like
-- Full Text Search (FTS).

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