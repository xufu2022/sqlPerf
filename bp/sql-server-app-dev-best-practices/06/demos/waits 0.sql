SELECT *
FROM sys.dm_os_waiting_tasks
WHERE session_id > 50;