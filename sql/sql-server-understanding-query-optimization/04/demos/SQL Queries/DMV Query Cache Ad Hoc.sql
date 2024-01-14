SELECT cp.usecounts
	, cp.cacheobjtype
	, cp.objtype
	, txt.text
FROM sys.dm_exec_cached_plans AS cp
	CROSS APPLY sys.dm_exec_sql_text (cp.plan_handle) AS txt
WHERE txt.text like '%' + 'geo.RegionCountryName = ''Australia''' + '%'