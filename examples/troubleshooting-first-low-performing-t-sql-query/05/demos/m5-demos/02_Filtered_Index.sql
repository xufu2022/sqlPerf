USE [WiredBrainCoffee];
GO



DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

-- This query shows returned orders over $50 for anything after January.
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id] = so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] = 3
      AND so.[SalesAmount] > 50
      AND so.[SalesDate] >= '01/01/2022'
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO




CREATE NONCLUSTERED INDEX [IXF_SalesOrder_SalesDate+Amount-Returned]
ON [Sales].[SalesOrder] (
						[SalesDate]
                    )
INCLUDE ([SalesAmount], [SalesOrderStatus])
WHERE [SalesOrderStatus] = 3 AND [SalesAmount] > 50 AND [SalesDate] >= '01/01/2022';
GO



-- Let's check how big our indexes are.
SELECT OBJECT_SCHEMA_NAME(i.object_id) AS [SchemaName],
       OBJECT_NAME(i.object_id) AS [TableName],
       p.rows AS [RowCount],
       i.name AS [IndexName],
       i.index_id AS [IndexID],
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




DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

-- What will happen if we take out the salesdate filter?
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id] = so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] = 3
      AND so.[SalesAmount] > 50
--AND so.SalesDate > '01/01/2022'
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO




DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

-- What happens when we are even more selective?
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id] = so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] = 3
      AND so.[SalesAmount] > 50
      AND so.[SalesDate] >= '02/01/2022'
      AND so.[SalesDate] <= '02/28/2022'
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO




DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

-- What happens when we include amounts outside our range?
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id]= so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] = 3
      AND so.[SalesAmount] > 45
      AND so.[SalesDate] >= '02/01/2022'
      AND so.[SalesDate] <= '02/28/2022'
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO





DBCC DROPCLEANBUFFERS;

SET STATISTICS IO ON;

-- What happens when we use a NOT IN operator?
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id] = so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] NOT IN ( 1, 2 )
      AND so.[SalesAmount] > 50
      AND so.[SalesDate] >= '02/01/2022'
      AND so.[SalesDate] <= '02/28/2022'
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO



-- Please checkout the Microsoft article to learn more about filtered index limitations.
-- https://learn.microsoft.com/en-us/sql/relational-databases/indexes/create-filtered-indexes?view=sql-server-ver16