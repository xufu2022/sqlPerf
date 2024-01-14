-- Doing this in a * test * environment
DBCC DROPCLEANBUFFERS;
GO

USE [Credit];
GO

SELECT  COUNT(*) AS [buffer_count]
FROM    [sys].[dm_os_buffer_descriptors]
WHERE   [dm_os_buffer_descriptors].[database_id] = DB_ID();

-- Selecting ALL rows from charge
-- Show actual execution plan
SELECT  [charge].[charge_no]
FROM    [dbo].[charge]
ORDER BY [charge].[charge_no];
GO

SELECT  COUNT(*) AS [buffer_count]
FROM    [sys].[dm_os_buffer_descriptors]
WHERE   [dm_os_buffer_descriptors].[database_id] = DB_ID();

DBCC DROPCLEANBUFFERS;
GO

USE [Credit];
GO

SELECT  COUNT(*) AS [buffer_count]
FROM    [sys].[dm_os_buffer_descriptors]
WHERE   [dm_os_buffer_descriptors].[database_id] = DB_ID();

SELECT TOP 100
        [charge].[charge_no]
FROM    [dbo].[charge]
ORDER BY [charge].[charge_no];
GO

SELECT  COUNT(*) AS [buffer_count]
FROM    [sys].[dm_os_buffer_descriptors]
WHERE   [dm_os_buffer_descriptors].[database_id] = DB_ID();