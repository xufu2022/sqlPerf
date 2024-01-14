SELECT cp.refcounts
	, cp.usecounts
	, cp.size_in_bytes
	, cp.cacheobjtype
	, cp.objtype
	, cp.plan_handle
FROM sys.dm_exec_cached_plans AS cp
