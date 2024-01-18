/*******************************************************************************
***********************  Tracking page splits       ****************************
********************************************************************************/
USE [StructuredIndex];
GO
-- Investigate the transaction_log Extended Event

SELECT 
    [oc].[name], 
    [oc].[type_name], 
    [oc].[description]
FROM sys.dm_xe_packages AS [p]
INNER JOIN sys.dm_xe_objects AS [o]
    ON [p].[guid] = [o].[package_guid]
INNER JOIN sys.dm_xe_object_columns AS [oc]
    ON [oc].[object_name] = [o].[name]
		AND [oc].[object_package_guid] = [o].[package_guid]
WHERE [o].[name] = N'transaction_log'
	AND [oc].[column_type] = N'data';
GO

-- OK we'll invest in log_op

SELECT *
FROM sys.dm_xe_map_values
WHERE [name] = N'log_op'
	AND [map_value] = N'LOP_DELETE_SPLIT';
GO

-- If the session exists, delete it:
IF EXISTS (
	SELECT 1
	FROM sys.server_event_sessions 
	WHERE [name] = N'TrackPageSplits'
)
    DROP EVENT SESSION [TrackPageSplits] ON SERVER;
GO

-- Creation of the session that will catcher the logs_delete_split
CREATE EVENT SESSION [TrackPageSplits] ON SERVER
ADD EVENT [sqlserver].[transaction_log] (
    WHERE [operation] = 11  -- LOP_DELETE_SPLIT 
)
ADD TARGET [package0].[histogram] (
    SET filtering_event_name = 'sqlserver.transaction_log',
        source_type = 0, -- Event Column
        source = 'database_id'
);
GO
        
-- Start the Event Session
ALTER EVENT SESSION [TrackPageSplits] ON SERVER
STATE = START;
GO

-- Run the script that will cause the page split
-- Request that will catcher the page_split : 

SELECT 
    [n].[value] ('(value)[1]', 'bigint') AS [database_id],
    DB_NAME ([n].[value] ('(value)[1]', 'bigint')) AS [database_name],
    [n].[value] ('(@count)[1]', 'bigint') AS [split_count]
FROM (
	SELECT CAST ([target_data] as XML) [target_data]
	FROM sys.dm_xe_sessions AS [s] 
	JOIN sys.dm_xe_session_targets [t]
		ON [s].[address] = [t].[event_session_address]
	WHERE [s].[name] = 'TrackPageSplits'
		AND [t].[target_name] = 'histogram'
) AS [tab]
CROSS APPLY [target_data].[nodes]('HistogramTarget/Slot') AS [q] ([n]);
GO

-- 3 pages split 
