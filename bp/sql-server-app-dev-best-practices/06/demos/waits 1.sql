SELECT 
	st.text, 
	qs.last_worker_time	 / 1000.0 as worker_time, 
	qs.last_elapsed_time / 1000.0 as elapsed_time
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
WHERE qs.last_elapsed_time > qs.last_worker_time * 1.1
ORDER BY st.text;