USE [WiredBrainCoffee];
GO


SELECT so.SalesDate,
	sp.Email
FROM Sales.SalesOrder so
INNER JOIN Sales.SalesPerson sp ON sp.Id = so.SalesPerson
WHERE so.SalesDate = '1/1/2022';
GO




SELECT indgs.avg_user_impact AS Average_Impact,
	indgs.last_user_scan AS Last_Scan,
	indgs.user_scans AS Number_Scans,
	indgs.user_seeks AS Number_Seeks,
	indgs.last_user_seek AS Last_Seek,
	mind.[statement] AS [Object],
	mind.equality_columns AS Equality_Columns,
	mind.included_columns AS Included_Columns
FROM sys.dm_db_missing_index_groups indg
INNER JOIN sys.dm_db_missing_index_group_stats indgs ON indgs.group_handle = indg.index_group_handle
INNER JOIN sys.dm_db_missing_index_details mind ON indg.index_handle = mind.index_handle;
GO


--******************************************************************************
--*   Copyright (C) 2019 Glenn Berry, SQLskills.com
--*   All rights reserved. 
--*
--*   For more scripts and sample code, check out 
--*      https://www.sqlskills.com/blogs/glenn
--*
--*   You may alter this code for your own *non-commercial* purposes. You may
--*   republish altered code as long as you include this copyright and give due credit. 
--*
--*
--*   THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
--*   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
--*   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
--*   PARTICULAR PURPOSE. 
--*
--******************************************************************************

-- Get top total logical reads queries for entire instance (Query 49) (Top Logical Reads Queries)
SELECT TOP(10) DB_NAME(t.[dbid]) AS [Database Name],
REPLACE(REPLACE(LEFT(t.[text], 255), CHAR(10),''), CHAR(13),'') AS [Short Query Text], 
qs.total_logical_reads AS [Total Logical Reads],
qs.min_logical_reads AS [Min Logical Reads],
qs.total_logical_reads/qs.execution_count AS [Avg Logical Reads],
qs.max_logical_reads AS [Max Logical Reads],   
qs.min_worker_time AS [Min Worker Time],
qs.total_worker_time/qs.execution_count AS [Avg Worker Time], 
qs.max_worker_time AS [Max Worker Time], 
qs.min_elapsed_time AS [Min Elapsed Time], 
qs.total_elapsed_time/qs.execution_count AS [Avg Elapsed Time], 
qs.max_elapsed_time AS [Max Elapsed Time],
qs.execution_count AS [Execution Count], 
qs.creation_time AS [Creation Time]
FROM sys.dm_exec_query_stats AS qs WITH (NOLOCK)
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS t 
ORDER BY qs.execution_count, qs.total_logical_reads DESC OPTION (RECOMPILE);
GO