--Actively executed queries
SELECT txt.[text]
	, qp.query_plan
	, req.cpu_time
	, req.logical_reads
	, req.writes
FROM sys.dm_exec_requests AS req
CROSS APPLY sys.dm_exec_query_plan (req.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(req.plan_handle) AS txt


--Previously executed queries
SELECT txt.[text]
	, qp.query_plan
	, st.execution_count
	, st.min_logical_writes
	, st.max_logical_reads
	, st.total_logical_reads
	, st.total_elapsed_time
	, st.last_elapsed_time
FROM sys.dm_exec_query_stats AS st
CROSS APPLY sys.dm_exec_query_plan (st.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(st.sql_handle) AS txt