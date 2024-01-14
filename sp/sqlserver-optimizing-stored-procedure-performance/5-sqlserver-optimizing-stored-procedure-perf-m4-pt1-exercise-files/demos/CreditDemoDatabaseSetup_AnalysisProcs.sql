-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup Analysis Procedures
-----------------------------------------------------------------------

USE [Credit];
GO

-----------------------------------------------------
-- Viewing Executions and Plan Version
-----------------------------------------------------

IF OBJECTPROPERTY(OBJECT_ID(N'ProcedurePlans')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[ProcedurePlans];
GO

CREATE PROCEDURE [ProcedurePlans]
AS
SELECT OBJECT_NAME([ps].[object_id], [ps].[database_id]) 
            AS [ProcedureName]
	, [ps].[execution_count] AS [ProcedureExecutes]
	, [qs].[plan_generation_num] AS [VersionOfPlan]
	, [qs].[execution_count] AS [ExecutionsOfCurrentPlan]
	, SUBSTRING ([st].[text], 
		([qs].[statement_start_offset] / 2) + 1, 
	    ((CASE [statement_end_offset] 
			WHEN -1 THEN DATALENGTH ([st].[text]) 
		    ELSE [qs].[statement_end_offset] END 
			- [qs].[statement_start_offset]) / 2) + 1) 
		    AS [StatementText]
    , [qs].[statement_start_offset] AS [offset]
    , [qs].[statement_end_offset] AS [offset_end]
    , [qp].[query_plan] AS [Query Plan XML]
    , [qs].[query_hash] AS [Query Fingerprint]
    , [qs].[query_plan_hash] AS [Query Plan Fingerprint]
FROM [sys].[dm_exec_procedure_stats] AS [ps]
	JOIN [sys].[dm_exec_query_stats] AS [qs]
		ON [ps].[plan_handle] = [qs].[plan_handle]
    CROSS APPLY [sys].[dm_exec_query_plan] 
                        ([qs].[plan_handle]) AS [qp]
	CROSS APPLY [sys].[dm_exec_sql_text] 
                        ([qs].[sql_handle]) AS [st]
WHERE [ps].[database_id] = DB_ID()
	AND OBJECT_NAME([ps].[object_id], [ps].[database_id]) 
		NOT IN (N'ProcedurePlans', N'RecompileEvents')
ORDER BY [ProcedureName]
	, [qs].[statement_start_offset];
GO	

-----------------------------------------------------
-- Viewing Recompilation Causes using Extended Events
-----------------------------------------------------

-- Create an event session to watch recompile events

USE [master];
GO

IF (SELECT COUNT(*) 
    FROM [sys].[dm_xe_sessions] AS [xes]
    WHERE [xes].[name] = N'XE_Recompiles') = 1
BEGIN
    ALTER EVENT SESSION [XE_Recompiles]
	ON SERVER
	STATE = STOP;

    DROP EVENT SESSION [XE_Recompiles]
    ON SERVER;
END;
GO

DECLARE @ExecString nvarchar(4000);

IF DATABASEPROPERTYEX(N'Credit', 'Status') = N'ONLINE'
BEGIN
    SELECT @ExecString =
        N'CREATE EVENT SESSION [XE_Recompiles] ON SERVER'
        + N' ADD EVENT sqlserver.sql_statement_recompile( '
        + N' WHERE ([package0].[equal_uint64]([source_database_id], ( '
                + CONVERT(VARCHAR(5), DB_ID(N'Credit'))
        + ')) AND [object_type]=(8272)))'
        + ' ADD TARGET package0.ring_buffer'
        + ' WITH (MAX_MEMORY=4096 KB'
	    + ' , MAX_DISPATCH_LATENCY=1 SECONDS)';
        
    EXEC ( @ExecString );
        
    ALTER EVENT SESSION [XE_Recompiles]
	    ON SERVER
	    STATE = START;
END;
ELSE
BEGIN
    RAISERROR ('The sample database:Credit does not exist.', 16, -1);
    RETURN;
END;
GO

-----------------------------------------------------
-- Procedure to view the recompile events / causes
-----------------------------------------------------

USE [Credit];
GO

IF OBJECTPROPERTY(OBJECT_ID(N'RecompileEvents')
    , 'IsProcedure') = 1
    DROP PROCEDURE [dbo].[RecompileEvents];
GO

CREATE PROCEDURE [dbo].[RecompileEvents]
AS
SET NOCOUNT ON;
SELECT 
       [event].[value]('(event/@name)[1]', 'VARCHAR(50)') 
            AS [EventName]
       
       , DATEADD(hh, 
            DATEDIFF(hh, GETUTCDATE(), CURRENT_TIMESTAMP), 
            [event].[value]('(event/@timestamp)[1]', 'DATETIME2')) 
            AS [EventTime]
       
       , [event].[value]('(event/data[@name="recompile_cause"]/text)[1]'
            , 'VARCHAR(255)') AS [RecompileCause]

       , OBJECT_NAME ([event].[value]('(event/data[@name="object_id"]/value)[1]'
                , 'INT') 
            , [event].[value]('(event/data[@name="source_database_id"]/value)[1]'
                , 'INT')) AS [ObjectName]

       , [event].[value]('(event/data[@name="offset"]/value)[1]'
            , 'INT') AS [offset]

       , [event].[value]('(event/data[@name="offset_end"]/value)[1]'
            , 'INT') AS [offset_end]

FROM 
     (   SELECT [n].[query]('.') AS [event] 
         FROM 
         ( 
             SELECT CAST([target_data] AS XML) AS [target_data] 
             FROM [sys].[dm_xe_sessions] AS [s]
             JOIN [sys].[dm_xe_session_targets] AS [t] 
                 ON [s].[address] = [t].[event_session_address]
             WHERE [s].[name] = N'XE_Recompiles' 
               AND [t].[target_name] = N'ring_buffer' 
         ) AS [sub] 
         CROSS APPLY [target_data].[nodes]('RingBufferTarget/event') 
            AS [q]([n]) 
     ) AS [tab]; 
GO

-----------------------------------------------------
-- If needed (when not completing demo scripts)
-- Clean up / drop the XE Session
-----------------------------------------------------

--IF (SELECT COUNT(*) 
--    FROM [sys].[dm_xe_sessions] AS [xes]
--    WHERE [xes].[name] = N'XE_Recompiles') = 1
--BEGIN
--    ALTER EVENT SESSION [XE_Recompiles]
--	ON SERVER
--	STATE = STOP;

--    DROP EVENT SESSION [XE_Recompiles]
--    ON SERVER;
--END;
--GO
