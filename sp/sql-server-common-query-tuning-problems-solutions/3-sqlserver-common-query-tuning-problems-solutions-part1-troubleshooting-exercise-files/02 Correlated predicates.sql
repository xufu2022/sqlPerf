USE [Credit];
GO

-- First we'll update to specific city/state combinations
UPDATE  [dbo].[member]
SET     [city] = 'Minneapolis', [state_prov] = 'MN'
WHERE   [member_no] % 10 = 0;

UPDATE  [dbo].[member]
SET     [city] = 'New York', [state_prov] = 'NY'
WHERE   [member_no] % 10 = 1;

UPDATE  [dbo].[member]
SET     [city] = 'Chicago', [state_prov] = 'IL'
WHERE   [member_no] % 10 = 2;

UPDATE  [dbo].[member]
SET     [city] = 'Houston', [state_prov] = 'TX'
WHERE   [member_no] % 10 = 3;

UPDATE  [dbo].[member]
SET     [city] = 'Philadelphia', [state_prov] = 'PA'
WHERE   [member_no] % 10 = 4;

UPDATE  [dbo].[member]
SET     [city] = 'Phoenix', [state_prov] = 'AZ'
WHERE   [member_no] % 10 = 5;

UPDATE  [dbo].[member]
SET     [city] = 'San Antonio', [state_prov] = 'TX'
WHERE   [member_no] % 10 = 6;

UPDATE  [dbo].[member]
SET     [city] = 'San Diego', [state_prov] = 'CA'
WHERE   [member_no] % 10 = 7;

UPDATE  [dbo].[member]
SET     [city] = 'Dallas', [state_prov] = 'TX'
WHERE   [member_no] % 10 = 8;
 GO

 -- This demo assumes our database has a 
 -- compatibility level < 120 (you'll see why this matters)
SELECT  [name], [compatibility_level]
FROM    [sys].[databases];

-- Minneapolis estimate?
SELECT  [lastname], [firstname]
FROM    [dbo].[member]
WHERE   [city] = 'Minneapolis';
 GO

-- Statistics?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS s
        INNER JOIN sys.[stats_columns] 
		AS [sc] ON [s].[stats_id] = [sc].[stats_id]
        AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.member');

DBCC SHOW_STATISTICS('member', _WA_Sys_00000006_0CBAE877);

-- Minneapolis and Minnesota?
-- In absence of multi-column statistics, QO assumes independence
SELECT  [lastname], [firstname]
FROM    [dbo].[member]
WHERE   [city] = 'Minneapolis'
        AND [state_prov] = 'MN'
OPTION  ( RECOMPILE );
GO

-- Statistics?
SELECT  [s].[object_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS s
        INNER JOIN sys.[stats_columns] AS [sc] ON 
		[s].[stats_id] = [sc].[stats_id]
        AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.member');

-- What about the statistics?
DBCC SHOW_STATISTICS('member', _WA_Sys_00000007_0CBAE877);

-- Create multi-column stats
CREATE STATISTICS [member_city_state_prov]
ON [dbo].[member]([city],[state_prov]);
GO

-- Now what is the estimate?
SELECT  [lastname], [firstname]
FROM    [dbo].[member]
WHERE   [city] = 'Minneapolis'
        AND [state_prov] = 'MN'
OPTION  ( RECOMPILE );
GO

-- What about the statistics?
DBCC SHOW_STATISTICS('member', 'member_city_state_prov');

-- But this isn't perfect...
SELECT  [lastname], [firstname]
FROM    [dbo].[member]
WHERE   [city] = 'Minneapolis'
        AND [state_prov] = 'TX'
OPTION  ( RECOMPILE );
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
