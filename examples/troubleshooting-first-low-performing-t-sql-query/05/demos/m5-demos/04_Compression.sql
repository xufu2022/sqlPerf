USE [WiredBrainCoffee];
GO



SET STATISTICS IO ON;

-- This query shows in-progress orders over $50 for all of time.
SELECT SUM(so.[SalesAmount]) AS [SalesAmount],
       so.[SalesDate] AS [SalesDate],
       so.[Id]
FROM [Sales].[SalesOrder] so
    INNER JOIN [Sales].[SalesOrderStatus] sos
        ON sos.[Id] = so.[SalesOrderStatus]
WHERE so.[SalesOrderStatus] = 2 -- Does this value stay the same most times?
      AND so.[SalesAmount] > 55 -- Will I always include this and does this value change?
GROUP BY so.[Id],
         so.[SalesDate];

SET STATISTICS IO OFF;
GO



/*
USE [WiredBrainCoffee]
GO
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Sales].[SalesOrder] ([SalesOrderStatus],[SalesAmount])
INCLUDE ([SalesDate])
GO
*/


CREATE NONCLUSTERED INDEX [IX_SalesOrder_OrderStatus_SalesAmount+SalesDate]
ON [Sales].[SalesOrder] (
                        [SalesOrderStatus],
                        [SalesAmount]
                    )
INCLUDE ([SalesDate]);
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
ORDER BY i.index_id;
GO







CREATE NONCLUSTERED INDEX [IXC_SalesOrder_OrderStatus_SalesAmount+SalesDate]
ON [Sales].[SalesOrder] (
                        [SalesOrderStatus],
                        [SalesAmount]
                    )
INCLUDE ([SalesDate]);
GO





ALTER INDEX [IXC_SalesOrder_OrderStatus_SalesAmount+SalesDate]
ON [Sales].[SalesOrder]
REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = PAGE);
GO