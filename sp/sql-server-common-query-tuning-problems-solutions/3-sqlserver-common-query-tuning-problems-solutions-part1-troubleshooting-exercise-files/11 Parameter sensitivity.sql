USE [Credit];
GO

CREATE PROCEDURE [dbo].[Charge_No_By_Amt]
	@charge_amt MONEY
AS
SELECT  [c].[charge_no], [m].[member_no], [m].[prev_balance]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m] 
		ON [m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] = @charge_amt;
GO

-- Index on charge_amt
CREATE NONCLUSTERED INDEX IX_Charge_Amt ON [dbo].[charge] ([charge_amt])
INCLUDE ([member_no]);
GO

-- Include the actual plan
EXEC [dbo].[Charge_No_By_Amt] .99;

-- Include the actual plan
EXEC [dbo].[Charge_No_By_Amt] 4714.00;

-- Reversed?
DBCC FREEPROCCACHE;
EXEC [dbo].[Charge_No_By_Amt] 4714.00;
EXEC [dbo].[Charge_No_By_Amt] .99;
GO

-- Options? (more common methods)
--		Query hints (OPTIMIZE FOR)
--		OPTION (RECOMPILE) for statement-level recompilation
--			(warning - we're trading off for compile-CPU!)
--		Procedure recompilation 
--		Procedure branching based on atypical value ranges
--		Dynamic SQL

ALTER PROCEDURE [dbo].[Charge_No_By_Amt]
	@charge_amt MONEY
AS
SELECT  [c].[charge_no], [m].[member_no], [m].[prev_balance]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m] 
		ON [m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] = @charge_amt
OPTION (RECOMPILE);
GO

-- Plans?
DBCC FREEPROCCACHE;
EXEC [dbo].[Charge_No_By_Amt] 4714.00;
EXEC [dbo].[Charge_No_By_Amt] .99;

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
