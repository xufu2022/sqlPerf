-- Temporarily disable auto-create stats
USE [master];
GO

-- If you see this disable in production, ask questions!
ALTER DATABASE [Credit] SET AUTO_CREATE_STATISTICS OFF WITH NO_WAIT;
GO

USE [Credit];
GO

-- Creating a new table based on charge
SELECT  [charge_no], [member_no], [provider_no], [category_no], [charge_dt],
        [charge_amt], [statement_no], [charge_code]
INTO    dbo.[charge_guess]
FROM    dbo.[charge];
GO

-- Several variations of predicates and associated heuristics (guesses)
SELECT  [charge_no], [member_no], [provider_no], [category_no],
        SUM([charge_amt]) AS [total_charge_amt]
FROM    ( SELECT    [charge_no], [member_no], [provider_no], [category_no],
                    [charge_dt], [charge_amt], [statement_no], [charge_code]
          FROM      dbo.[charge_guess]
          WHERE     [provider_no] = 500
          UNION
          SELECT    [charge_no], [member_no], [provider_no], [category_no],
                    [charge_dt], [charge_amt], [statement_no], [charge_code]
          FROM      dbo.[charge_guess]
          WHERE     [statement_no] BETWEEN 500 AND 1000
          UNION
          SELECT    [charge_no], [member_no], [provider_no], [category_no],
                    [charge_dt], [charge_amt], [statement_no], [charge_code]
          FROM      dbo.[charge_guess]
          WHERE     [charge_amt] < 100000
          UNION
          SELECT    [charge_no], [member_no], [provider_no], [category_no],
                    [charge_dt], [charge_amt], [statement_no], [charge_code]
          FROM      dbo.[charge_guess]
          WHERE     [category_no] LIKE 10
        ) AS t
GROUP BY [charge_no], [member_no], [provider_no], [category_no]
HAVING  SUM([charge_amt]) > 3999.99;
GO

WITH XMLNAMESPACES 
    (DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/showplan')    
 SELECT [s].[value]('@NodeId', 'int') AS [NodeId], 
		[s].[value]('@PhysicalOp', 'nvarchar(128)') AS [PhysicalOp],
		[s].[value]('@EstimateRows', 'real') AS [EstimateRows],
		[s].[value]('@TableCardinality', 'real') AS [TableCardinality],
		[c].[plan_handle], 
		[q].[query_plan],
		[t].[text]
 INTO #ProcessResults
 FROM [sys].[dm_exec_cached_plans] AS [c] 
 CROSS APPLY [sys].[dm_exec_query_plan]([plan_handle]) AS [q] 
 CROSS APPLY [query_plan].nodes('//RelOp') AS batch(s) 
 CROSS APPLY [sys].[dm_exec_sql_text](c.plan_handle) AS [t] 
 WHERE [t].[text]	LIKE '%provider_no%'
 OPTION(MAXDOP 1, RECOMPILE);
 GO

SELECT  [plan_handle], [NodeId], [PhysicalOp], [EstimateRows],
        COALESCE([TableCardinality],
                 LAG([EstimateRows], 1, 0) 
				 OVER ( ORDER BY [NodeId] DESC )) AS [Cardinality],
        CASE CAST([EstimateRows] / COALESCE([TableCardinality],
        LAG([EstimateRows], 1, 0) 
		OVER ( ORDER BY YEAR([NodeId]) )) AS NUMERIC(24, 4))
         WHEN 0.0316 THEN 'Potential Selectivity Guess'
          WHEN 0.09 THEN 'Potential Selectivity Guess'
          WHEN 0.30 THEN 'Potential Selectivity Guess'
          WHEN 0.10 THEN 'Potential Selectivity Guess'
          ELSE '-'
        END AS 'Potential Selectivity Guess?'
FROM    [#ProcessResults] AS pr
ORDER BY [NodeId] DESC;

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

DROP TABLE #ProcessResults;
