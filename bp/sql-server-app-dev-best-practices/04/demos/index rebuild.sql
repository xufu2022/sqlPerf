DECLARE cur CURSOR
FORWARD_ONLY
FOR
	WITH ctePartitions AS (
		SELECT object_id, index_id, CAST(COUNT(*) -1 as bit) as Partitionne
		FROM sys.partitions p WITH (READUNCOMMITTED)
		GROUP BY object_id, index_id
	) 
	SELECT 
		CASE 
			WHEN i.name IS NOT NULL THEN 'ALTER INDEX [' + i.name + '] ON'
			ELSE 'ALTER TABLE'
		END + ' [' + OBJECT_SCHEMA_NAME(ps.OBJECT_ID) + '].[' + OBJECT_NAME(ps.OBJECT_ID) + '] REBUILD'
		+ CASE p.Partitionne WHEN 1 THEN  ' PARTITION = ' + CAST(ps.partition_number as char(2)) ELSE '' END as cmd
	FROM sys.dm_db_index_physical_stats(DB_ID(),NULL, NULL, NULL ,'LIMITED') AS ps
	JOIN sys.indexes AS i WITH (READUNCOMMITTED) ON ps.[object_id] = i.[object_id] 
		AND ps.index_id = i.index_id
	JOIN ctePartitions p ON i.[object_id] = p.[object_id] AND p.index_id = i.index_id
	WHERE avg_fragmentation_in_percent > 30
	AND page_count > 500;

DECLARE @cmd varchar(200)
OPEN cur

FETCH NEXT FROM cur INTO @cmd
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		PRINT @cmd
		EXEC (@cmd)
	END
	FETCH NEXT FROM cur INTO @cmd
END

CLOSE cur
DEALLOCATE cur
GO

