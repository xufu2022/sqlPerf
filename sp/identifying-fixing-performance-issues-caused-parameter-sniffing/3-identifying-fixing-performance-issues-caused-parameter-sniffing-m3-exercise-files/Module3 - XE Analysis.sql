SELECT MIN(duration) AS MinDuration, MAX(duration) AS MaxDuration, 
			AVG(duration) AS AvgDuration, STDEV(duration) AS StdDevDuration,
       MIN(cpu_time) AS MinCPUTime, MAX(cpu_time) AS MaxCPUTime, 
			AVG(cpu_time) AS AvgCPUTime, STDEV(cpu_time) AS StdDevCPUTime,
       MIN(logical_reads) AS MinLogicalReads, MAX(logical_reads) AS MaxLogicalReads, 
			AVG(logical_reads) AS AvgLogicalReads, STDEV(logical_reads) AS StdDevLogicalReads,
       query_hash
FROM dbo.ExtendedEventsResults
GROUP BY query_hash
ORDER BY StdDevDuration DESC
