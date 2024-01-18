-- Run this script to follow along with the demo.
USE WiredBrainCoffee;
GO


-- How many rows are in the Numbers table?
SELECT COUNT(1) AS Row_Count
FROM dbo.Numbers;
GO


-- Below are two informative articles written by Paul Randal.
-- https://www.sqlskills.com/blogs/paul/inside-the-storage-engine-anatomy-of-a-page/
-- https://www.sqlskills.com/blogs/paul/inside-the-storage-engine-anatomy-of-a-record/


-- Dynamic Management View you can use to determine how many pages a table uses.
SELECT OBJECT_SCHEMA_NAME(s.object_id) schema_name,
	OBJECT_NAME(s.object_id) table_name,
	SUM(s.row_count) row_count,
	SUM(s.used_page_count) used_pages
FROM sys.dm_db_partition_stats s
INNER JOIN sys.tables t ON s.object_id = t.object_id
GROUP BY s.object_id
ORDER BY schema_name,
	table_name ASC;
GO