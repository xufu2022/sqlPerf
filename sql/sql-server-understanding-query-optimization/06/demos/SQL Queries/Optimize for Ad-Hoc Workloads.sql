/*Check plan cache*/
SELECT usecounts
	, cacheobjtype
	, objtype
	, size_in_bytes
	, [text]
FROM sys.dm_exec_cached_plans
CROSS APPLY sys.dm_exec_sql_text(plan_handle)


/*Enable Optimize for ad-hoc workloads*/


/*Execute the query again*/
SELECT TOP 1000 *
FROM dbo.DimCustomer
WHERE LastName = 'Yang'