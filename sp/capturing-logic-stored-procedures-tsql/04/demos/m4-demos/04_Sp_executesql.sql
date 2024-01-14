USE [WiredBrainCoffee];
GO


-- Please don't run this in production!
DBCC FREEPROCCACHE;
GO


-- First, we're going to use sp_executesql.
DECLARE @SqlCmd AS nvarchar(max);
DECLARE @SalesPersonEmailInput AS nvarchar(500);
SET @SalesPersonEmailInput = 'Tom.Jones1@WiredBrainCoffee.com';

SET @SqlCmd = N'SELECT sp.LastName,
					   sp.FirstName,
					   sp.StartDate,
					   spl.LevelName
				FROM Sales.SalesPerson sp
				INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
				WHERE Email = @SalesPersonEmail';

EXECUTE sys.sp_executesql @SqlCmd, N'@SalesPersonEmail nvarchar(500)',
						  @SalesPersonEmail = @SalesPersonEmailInput;
GO


-- We're using a different email.
DECLARE @SqlCmd AS nvarchar(1000);
DECLARE @SalesPersonEmailInput AS nvarchar(500);
SET @SalesPersonEmailInput = 'Sally.Jones1@WiredBrainCoffee.com';

SET @SqlCmd = N'SELECT sp.LastName,
					   sp.FirstName,
					   sp.StartDate,
					   spl.LevelName
				FROM Sales.SalesPerson sp
				INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
				WHERE Email = @SalesPersonEmail';

EXECUTE sys.sp_executesql @SqlCmd, N'@SalesPersonEmail nvarchar(500)',
						  @SalesPersonEmail = @SalesPersonEmailInput;
GO


-- Let’s check our cache.
SELECT cp.[usecounts] 'Execution Counts'
	   ,cp.[size_in_bytes] 'Size in Bytes'
	   ,cp.[objtype] 'Type'
	   ,st.[text] 'SQL Text'
 FROM [sys].[dm_exec_cached_plans] cp
CROSS APPLY [sys].[dm_exec_sql_text](cp.[plan_handle]) st
WHERE st.[text] like '%Sales.SalesPersonLevel%';
GO



-- Here we're using EXEC or EXECUTE.
DECLARE @SqlCmd AS nvarchar(max);
DECLARE @SalesPersonEmail AS nvarchar(500);
SET @SalesPersonEmail = 'Sally.Jones1@WiredBrainCoffee.com';

SET @SqlCmd = N'SELECT sp.LastName,
					   sp.FirstName,
					   sp.StartDate,
					   spl.LevelName
				FROM Sales.SalesPerson sp
				INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
				WHERE Email = '''+@SalesPersonEmail+'''';

EXECUTE (@SqlCmd);
GO



-- Now let's use a different email.
DECLARE @SqlCmd AS nvarchar(max);
DECLARE @SalesPersonEmail AS nvarchar(500);
SET @SalesPersonEmail = 'Lisa.Jones1@WiredBrainCoffee.com';

SET @SqlCmd = N'SELECT sp.LastName,
					   sp.FirstName,
					   sp.StartDate,
					   spl.LevelName
				FROM Sales.SalesPerson sp
				INNER JOIN Sales.SalesPersonLevel spl ON spl.Id = sp.LevelId
				WHERE Email = '''+@SalesPersonEmail+'''';

EXECUTE (@SqlCmd);
GO



-- Let’s check our cache again.
SELECT cp.[usecounts] 'Execution Counts'
	   ,cp.[size_in_bytes] 'Size in Bytes'
	   ,cp.[objtype] 'Type'
	   ,st.[text] 'SQL Text'
 FROM [sys].[dm_exec_cached_plans] cp
CROSS APPLY [sys].[dm_exec_sql_text](cp.[plan_handle]) st
WHERE st.[text] like '%Sales.SalesPersonLevel%';
GO



-- Excellent article from Microsoft covering SQL injection.
-- https://docs.microsoft.com/en-us/sql/relational-databases/security/sql-injection?view=sql-server-2017