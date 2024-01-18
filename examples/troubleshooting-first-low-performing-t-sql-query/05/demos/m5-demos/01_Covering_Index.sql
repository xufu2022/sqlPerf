USE [WiredBrainCoffee];
GO


DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

SELECT sos.[StatusName] AS [Status],
	SUM(so.[SalesAmount]) AS [SalesAmount],
	so.[SalesDate] AS [SalesDate],
	YEAR(so.[SalesDate]) AS [SalesYear]
FROM [Sales].[SalesOrder] so
INNER JOIN [Sales].[SalesOrderStatus] sos ON so.[SalesOrderStatus] = sos.[Id]
WHERE so.[SalesDate] >= '1/1/2022'
	AND so.[SalesDate] <= '3/31/2022'
GROUP BY so.[SalesDate],
	sos.[StatusName];

SET STATISTICS IO OFF;
GO


EXECUTE sp_helpindex @objname = 'Sales.SalesOrder';
GO


/*
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Sales].[SalesOrder] ([SalesDate])
INCLUDE ([SalesAmount],[SalesOrderStatus])
*/



-- This script is from Pluralsight author Pinal Dave.
-- https://blog.sqlauthority.com/2019/02/21/sql-server-query-listing-all-the-indexes-key-column-with-included-column/
SELECT QUOTENAME(SCHEMA_NAME(t.schema_id)) AS [SchemaName]
	,QUOTENAME(t.name) AS [TableName]
	,QUOTENAME(i.name) AS [IndexName]
	,i.type_desc AS [IndexType]
	,STUFF(REPLACE(REPLACE((
					SELECT QUOTENAME(c.name) + CASE 
							WHEN ic.is_descending_key = 1
								THEN ' DESC'
							ELSE ''
							END AS [data()]
					FROM sys.index_columns AS ic
					INNER JOIN sys.columns AS c ON ic.object_id = c.object_id
						AND ic.column_id = c.column_id
					WHERE ic.object_id = i.object_id
						AND ic.index_id = i.index_id
						AND ic.is_included_column = 0
					ORDER BY ic.key_ordinal
					FOR XML PATH
					), '<row>', ', '), '</row>', ''), 1, 2, '') AS KeyColumns
	,STUFF(REPLACE(REPLACE((
					SELECT QUOTENAME(c.name) AS [data()]
					FROM sys.index_columns AS ic
					INNER JOIN sys.columns AS c ON ic.object_id = c.object_id
						AND ic.column_id = c.column_id
					WHERE ic.object_id = i.object_id
						AND ic.index_id = i.index_id
						AND ic.is_included_column = 1
					ORDER BY ic.index_column_id
					FOR XML PATH
					), '<row>', ', '), '</row>', ''), 1, 2, '') AS IncludedColumns
	,u.user_seeks AS [UserSeeks]
	,u.user_scans AS [UserScans]
	,u.user_lookups AS [UserLookups]
FROM sys.tables AS t
INNER JOIN sys.indexes AS i ON t.object_id = i.object_id
LEFT JOIN sys.dm_db_index_usage_stats AS u ON i.object_id = u.object_id
	AND i.index_id = u.index_id
WHERE t.is_ms_shipped = 0
	AND t.name = 'SalesOrder'
	AND i.type <> 0;
GO





CREATE NONCLUSTERED INDEX [IX_SalesOrder_SalesDate_OrderStatus+Amount]
ON [Sales].[SalesOrder] (
                        [SalesDate],
						[SalesOrderStatus]
                    )
INCLUDE ([SalesAmount]);
GO



-- Let's check how big our indexes are.
SELECT OBJECT_SCHEMA_NAME(i.object_id) AS [SchemaName],
       OBJECT_NAME(i.object_id) AS [TableName],
       p.rows AS [RowCount],
       i.name AS [IndexName],
       SUM(a.used_pages) AS [UsedPages],
       (8 * SUM(a.used_pages) / 1024) AS [Indexsize(MB)]
FROM sys.indexes i
    JOIN sys.partitions p
        ON p.object_id = i.object_id
           AND p.index_id = i.index_id
    JOIN sys.allocation_units a
        ON a.container_id = p.partition_id
WHERE OBJECT_NAME(i.object_id) IN ( 'SalesOrder' )
GROUP BY i.object_id,
         i.index_id,
         i.name,
         p.rows
ORDER BY OBJECT_NAME(i.object_id),
         i.index_id;
GO








ALTER INDEX [IX_SalesOrder_SalesDate] ON [Sales].[SalesOrder] DISABLE;
GO

DROP INDEX IF EXISTS [IX_SalesOrder_SalesDate] ON [Sales].[SalesOrder];
GO