USE [Credit];
GO

-- Jagged distributions are difficult for the Uniformity assumption

-- Kick off auto-creation of stats
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-06 01:01:21';

-- Statistics?
SELECT  [s].[object_id], [s].[stats_id], [s].[name], [s].[auto_created],
        COL_NAME([s].[object_id], [sc].[column_id]) AS [col_name]
FROM    sys.[stats] AS s
        INNER JOIN sys.[stats_columns] AS [sc] 
		ON [s].[stats_id] = [sc].[stats_id]
        AND [s].[object_id] = [sc].[object_id]
WHERE   [s].[object_id] = OBJECT_ID('dbo.charge');

-- What is the highest RANGE_HI_KEY and how many steps?
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0);

-- Let's insert new rows with "jagged" distributions
-- Turn off "include actual plan"
SET NOCOUNT ON;

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-01', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-02', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-03', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-04', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-05', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-06', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-07', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-08', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-09', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-10', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-11', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-12', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-13', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-14', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-15', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-16', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-17', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-18', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-19', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-20', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-21', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-22', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-23', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-24', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-25', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-26', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-27', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000


INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-28', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1

INSERT [dbo].[charge] ( [member_no], [provider_no], [category_no],
                              [charge_dt], [charge_amt], [statement_no],
                              [charge_code] )
VALUES  ( 8842, -- member_no - numeric_id
          500, -- provider_no - numeric_id
          2, -- category_no - numeric_id
          '2014-04-29', -- charge_dt - datetime
          50.00, -- charge_amt - money
          5561, -- statement_no - numeric_id
          ''  -- charge_code - status_code
          )
GO 1000

-- Let's UPDATE STATS with FULLSCAN
UPDATE STATISTICS [dbo].[charge] _WA_Sys_00000005_0DAF0CB0
WITH FULLSCAN;

-- Our histogram shows how many of the most recent steps?
DBCC SHOW_STATISTICS('dbo.charge', _WA_Sys_00000005_0DAF0CB0);

-- Estimate for 1,000 actual rows? Direct histogram step?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-29';

-- Estimate for 1,000 actual rows? Intro histogram step?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-27';

-- Estimate for 1 actual row?
SELECT [charge_no], [charge_dt] 
FROM [dbo].[charge]
WHERE [charge_dt] = '2014-04-16';

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