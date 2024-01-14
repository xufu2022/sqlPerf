USE [Credit];
GO

-- Create the following indexes
CREATE INDEX [IX_Redundant_Charge_No] ON
[dbo].[charge] ([charge_no]);
GO

CREATE INDEX [IX_Overlap_1_Charge] ON
[dbo].[charge] ([charge_no], [member_no], [provider_no]);
GO

CREATE INDEX [IX_Overlap_2_Charge] ON
[dbo].[charge] ([charge_no], [member_no], [provider_no],
                [charge_dt], [statement_no]);
GO

CREATE INDEX [IX_Overlap_3_Charge] ON
[dbo].[charge] ([member_no], [provider_no],
                [charge_dt], [statement_no],
				[charge_code], [charge_amt]);
GO

CREATE INDEX [IX_Overlap_4_Charge] ON
[dbo].[charge] ([charge_code], [charge_amt]);
GO

-- How many indexes on charge?
EXEC [dbo].[sp_helpindex] 'charge';

-- With OLTP designs, less-is-more
-- Balance workload performance against index overhead
SET NOCOUNT ON;
SET STATISTICS IO ON;

INSERT  [dbo].[charge]
        ( [member_no] ,
          [provider_no] ,
          [category_no] ,
          [charge_dt] ,
          [charge_amt] ,
          [statement_no] ,
          [charge_code]
        )
        SELECT TOP 100
                [charge].[member_no] ,
                [charge].[provider_no] ,
                [charge].[category_no] ,
                [charge].[charge_dt] ,
                [charge].[charge_amt] ,
                [charge].[statement_no] ,
                [charge].[charge_code]
        FROM    [dbo].[charge];

SET STATISTICS IO OFF;

-- Removing the indexes we created
DROP INDEX [IX_Redundant_Charge_No] ON
[dbo].[charge];
GO

DROP INDEX [IX_Overlap_1_Charge] ON
[dbo].[charge];
GO

DROP INDEX [IX_Overlap_2_Charge] ON
[dbo].[charge];
GO

DROP INDEX [IX_Overlap_3_Charge] ON
[dbo].[charge];
GO

DROP INDEX [IX_Overlap_4_Charge] ON
[dbo].[charge];
GO

SET NOCOUNT ON;
SET STATISTICS IO ON;

INSERT  [dbo].[charge]
        ( [member_no] ,
          [provider_no] ,
          [category_no] ,
          [charge_dt] ,
          [charge_amt] ,
          [statement_no] ,
          [charge_code]
        )
        SELECT TOP 100
                [charge].[member_no] ,
                [charge].[provider_no] ,
                [charge].[category_no] ,
                [charge].[charge_dt] ,
                [charge].[charge_amt] ,
                [charge].[statement_no] ,
                [charge].[charge_code]
        FROM    [dbo].[charge];

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
