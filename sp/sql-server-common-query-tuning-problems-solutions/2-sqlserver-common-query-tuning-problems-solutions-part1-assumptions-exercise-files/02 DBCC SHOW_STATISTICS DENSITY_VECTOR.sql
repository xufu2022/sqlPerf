USE [Credit];
GO

-- Predicate referencing charge_dt
SELECT	[charge_no]
FROM	[dbo].[charge] AS c
WHERE	[charge_dt] = '1999-07-20 10:44:42.157';

-- Use DBCC SHOW_STATISTICS with DENSITY_VECTOR
DBCC SHOW_STATISTICS(N'dbo.charge', _WA_Sys_00000005_0DAF0CB0)
WITH DENSITY_VECTOR;
GO

-- Density = 1/# of distinct values in a column

-- If we create multi-column stats or have a multi-column index,
-- what do we see?
CREATE STATISTICS [charge_multi_cols] ON
[dbo].[charge] ([charge_amt], [statement_no], [charge_dt]);
GO

DBCC SHOW_STATISTICS(N'dbo.charge', charge_multi_cols)
WITH DENSITY_VECTOR;
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