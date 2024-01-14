USE [WiredBrainCoffee];
GO




-- Please do not run this in production!
-- This command will clear out our plan cache.
DBCC FREEPROCCACHE;
GO




-- Let's execute our procedure three times.
EXECUTE [Sales].[ReportSalesCommission] @StartDate = '1/1/2020',
										@EndDate = '1/31/2020',
										@SalesPersonLevelId = 3;
GO




-- Let's check our procedure stats.
-- In process executions will not show up.
SELECT	ps.[cached_time] AS 'Cached',
		ps.[execution_count] AS 'Execution Count',
		ps.[last_execution_time] AS 'Last Execution Time',
		ps.[last_logical_reads] AS 'Last Logical Reads',
		ps.[max_logical_reads] AS 'Max Logical Reads',
		ps.[last_logical_writes] AS 'Last Logical Writes',
		(ps.[last_elapsed_time] / 1000) AS 'Last Elapsed Time',
		(ps.[max_elapsed_time] / 1000) AS 'Max Elapsed Time',
		(ps.[min_elapsed_time] / 1000) AS 'Min Elapsed Time'
FROM [sys].[dm_exec_procedure_stats] ps
WHERE [object_id] = object_id('Sales.ReportSalesCommission');
GO




-- Let's execute our procedure three more times with different parameters.
EXECUTE [Sales].[ReportSalesCommission]	@StartDate = '1/1/2016',
										@EndDate = '12/31/2019',
										@SalesPersonLevelId = 3;
GO




-- Let's check our procedure stats.
-- In process executions will not show up.
SELECT	ps.[cached_time] AS 'Cached',
		ps.[execution_count] AS 'Execution Count',
		ps.[last_execution_time] AS 'Last Execution Time',
		ps.[last_logical_reads] AS 'Last Logical Reads',
		ps.[max_logical_reads] AS 'Max Logical Reads',
		ps.[last_logical_writes] AS 'Last Logical Writes',
		(ps.[last_elapsed_time] / 1000) AS 'Last Elapsed Time',
		(ps.[max_elapsed_time] / 1000) AS 'Max Elapsed Time',
		(ps.[min_elapsed_time] / 1000) AS 'Min Elapsed Time'
FROM [sys].[dm_exec_procedure_stats] ps
WHERE [object_id] = object_id('Sales.ReportSalesCommission');
GO




-- Let's enable our stats and see what the execution plan says.
SET STATISTICS IO ON;
GO

EXECUTE [Sales].[ReportSalesCommission] @StartDate = '2/1/2020',
										@EndDate = '2/28/2020',
										@SalesPersonLevelId = 3;
GO

SET STATISTICS IO OFF;
GO





-- Create our missing index on the salesorder table.
DROP INDEX IF EXISTS ix_SalesOrder_SalesDate
ON [Sales].[SalesOrder];
GO

CREATE NONCLUSTERED INDEX ix_SalesOrder_SalesDate 
ON [Sales].[SalesOrder]([SalesDate])
INCLUDE ([SalesPerson],[SalesAmount]);
GO





-- Let's enable our stats and see what the execution plan says.
SET STATISTICS IO ON;
GO

EXECUTE [Sales].[ReportSalesCommission] @StartDate = '2/1/2020',
										@EndDate = '2/28/2020',
										@SalesPersonLevelId = 3;
GO

SET STATISTICS IO OFF;
GO




-- Check out the Microsoft article on sys.dm_exec_procedure_stats.
-- https://docs.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-procedure-stats-transact-sql?view=sql-server-2017