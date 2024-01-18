USE [WiredBrainCoffee];
GO



-- Dynamic Management View you can use to determine how many pages a table uses.
SELECT t.name AS [table_name],
	ix.name AS [index_name],
	s.in_row_used_page_count AS [in_row_pages],
	s.row_count AS [row_count]
FROM sys.dm_db_partition_stats s
INNER JOIN sys.tables t ON s.object_id = t.object_id
INNER JOIN sys.indexes ix ON s.object_id = ix.object_id
	AND s.index_id = ix.index_id
WHERE t.name = 'SalesOrder';
GO






-- Here we are performing a select * on our largest table.
DBCC DROPCLEANBUFFERS;
GO

SET STATISTICS IO ON;

SELECT *
FROM Sales.SalesOrder so;

SET STATISTICS IO OFF;
GO









-- In the statement below, we are specifying the SalesOrder Id.
DBCC DROPCLEANBUFFERS;
GO

SET STATISTICS IO ON;

SELECT so.SalesAmount
FROM Sales.SalesOrder so
WHERE so.Id = 1;

SET STATISTICS IO OFF;
GO









-- In this statement we are invalidating the index seek.
DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

SELECT so.SalesAmount
FROM Sales.SalesOrder so
WHERE CAST(so.Id AS NVARCHAR(256)) = 1;

SET STATISTICS IO OFF;
GO









-- In this statement we are telling SQL not to use the nonclustered index.
DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

SELECT so.SalesAmount
FROM Sales.SalesOrder so WITH (INDEX (0))
WHERE so.Id = 1;

SET STATISTICS IO OFF;
GO