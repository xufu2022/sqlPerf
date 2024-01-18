/*******************************************************************************
**************************   REORGANIZE VS REBUILD      *************************
********************************************************************************/

-- The differences between REORGANIZE and REBUILD : 
-- 1:/Rebuild will use multiple CPUs, REORGANIZE will use a single thread
-- 2:/Rebuild will update the statistics, REOGANIZE will not
-- 3:/Rebuild will always perform better for highly fragmented tables 
-- 4:/You can reduce the number of logs by switching to BULK_LOGGUED compatibility mode
-- the REORGANIZE will log everything
-- 5:/You can redo an ONLINE or OFFLINE REBUILD on a REBUILD, not on a REORGANIZE.
-- play the createfragmentation.sql script before 

USE [StructuredIndex];
GO

-- Let's look at fragmentation:
SELECT
	OBJECT_NAME ([ips].[object_id]) AS [Object Name],
	[si].[name] AS [Index Name],
	ROUND ([ips].[avg_fragmentation_in_percent], 2) AS [Fragmentation],
	[ips].[page_count] AS [Pages],
	ROUND ([ips].[avg_page_space_used_in_percent], 2) AS [Page Density]
FROM sys.dm_db_index_physical_stats (
	DB_ID (N'StructureIndex'),
	NULL,
	NULL,
	NULL,
	N'DETAILED') [ips]
CROSS APPLY [sys].[indexes] [si]
WHERE
	[si].[object_id] = [ips].[object_id]
	AND [si].[index_id] = [ips].[index_id]
	AND [ips].[index_level] = 0 -- Just the leaf level
	AND [ips].[alloc_unit_type_desc] = N'IN_ROW_DATA'
	and OBJECT_NAME ([ips].[object_id]) like '%keytable%'
	order by 3 desc
	;
GO

-- Very high fragmentation rate for BadKeyTable_CL
-- Index rebuild with 70% FILL FACTOR 

ALTER INDEX [BadKeyTable_CL] ON [BadKeyTable] REBUILD
WITH (ONLINE = ON, FILLFACTOR = 70);
GO

-- Time: 1 sec
-- Let's look at the fragmentation we went from 99 to 0.2 ...
-- Reorganize the non-clustered index

ALTER INDEX [BadKeyTable_NCL] ON [BadKeyTable] REORGANIZE;
GO

-- Time: 1 sec
-- Let's look at the fragmentation we went from 43 to 1,39 ...
-- No comment :)
-- So when to do a REBUILD or a REORGANIZE?
-- Vast Topic :) in most cases :
-- 0 and 5-10% => do nothing 
-- 5-10 to 30% => REORGANIZE 
-- 30% to 100% => REBUILD