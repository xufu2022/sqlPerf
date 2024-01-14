SELECT  OBJECT_NAME(objectid, dbid) AS ObjectName,
        query_plan,
        qs.query_hash
FROM    sys.dm_exec_query_stats qs
        CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle)
WHERE   DB_NAME(dbid) = 'Nile' OR dbid IS NULL;
