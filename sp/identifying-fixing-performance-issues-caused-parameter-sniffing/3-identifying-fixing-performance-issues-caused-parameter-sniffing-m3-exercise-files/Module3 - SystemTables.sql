SELECT  DB_NAME(st.dbid) AS DatabaseName,
        SUBSTRING(st.text, (qs.statement_start_offset / 2) + 1, 
			((CASE statement_end_offset
				WHEN -1 THEN DATALENGTH(st.text)
                ELSE qs.statement_end_offset
              END - qs.statement_start_offset) / 2) + 1) AS statement_text,
        total_worker_time / execution_count AS AverageWorkerTime,
        max_worker_time AS MaxWorkerTime,
        min_worker_time AS MinWorkerTime,
        total_logical_reads / execution_count AS AverageLogicalReads,
        max_logical_reads AS MaxLogicalReads,
        min_logical_reads AS MinLogicalReads,
        total_elapsed_time / execution_count AS AverageElapsedTime,
        max_elapsed_time AS MaxElapsedTime,
        min_elapsed_time AS MinElapsedTime,
		qs.execution_count,
        query_hash, 
		GETDATE() AS SampleTime
FROM    sys.dm_exec_query_stats qs
        CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
WHERE st.dbid IS NULL OR st.dbid > 4;

