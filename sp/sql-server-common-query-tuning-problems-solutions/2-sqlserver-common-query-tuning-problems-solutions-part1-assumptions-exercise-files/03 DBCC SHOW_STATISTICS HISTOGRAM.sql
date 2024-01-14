USE [Credit];
GO

-- Predicate referencing charge_dt
SELECT	[charge_no]
FROM	[dbo].[charge] AS c
WHERE	[charge_dt] = '1999-07-20 10:44:42.157';

-- Use DBCC SHOW_STATISTICS with HISTOGRAM
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH HISTOGRAM;
GO

-- RANGE_HI_KEY = Upper-bound column value for a step

-- RANGE_ROWS = # of rows with a value falling within a histogram
--		step, excluding the upper bound

-- EQ_ROWS = # of rows whose value equals the RANGE_HI_KEY

-- DISTINCT_RANGE_ROWS = # rows with a distinct column value within
--		a histogram step, excluding the upper bound

-- AVG_RANGE_ROWS = Average number of rows with duplicate column
--		values within a histogram step, excluding the upper bound 
--		calculation -> RANGE_ROWS / DISTINCT_RANGE_ROWS 

-- RANGE_HI_KEY is * always * based on leftmost column
CREATE STATISTICS [charge_multi_cols] ON
[dbo].[charge] ([charge_amt], [statement_no], [charge_dt]);
GO

DBCC SHOW_STATISTICS(N'dbo.charge', charge_multi_cols)
WITH HISTOGRAM;
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