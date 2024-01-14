SELECT 
	AVG(AverageWorkerTime) AS AverageWorkerTime, 
	MAX(MaxWorkerTime) AS MaxWorkerTime, 
	MIN(MinWorkerTime) AS MinWorkerTime,  
	CASE WHEN AVG(AverageWorkerTime) = 0 
		THEN 0 
		ELSE (CAST(MAX(MaxWorkerTime) - MIN(MinWorkerTime) AS FLOAT))/AVG(AverageWorkerTime) 
	END AS WorkerTimeSpread,
	AVG(AverageLogicalReads) AS AverageLogicalReads, 
	MAX(MaxLogicalReads) AS MaxLogicalReads, 
	MIN(MinLogicalReads) AS MinLogicalReads,  
	CASE WHEN AVG(AverageLogicalReads) = 0 
		THEN 0 
		ELSE (CAST(MAX(MaxLogicalReads) - MIN(MinLogicalReads) AS FLOAT))/AVG(AverageLogicalReads) 
	END AS LogicalReadSpread,
	AVG(AverageElapsedTime) AS AverageElapsedTime, 
	MAX(MaxElapsedTime) AS MaxElapsedTime, 
	MIN(MinElapsedTime) AS MinElapsedTime,  
	CASE WHEN AVG(AverageElapsedTime) = 0 
		THEN 0 
		ELSE (CAST(MAX(MaxElapsedTime) - MIN(MinElapsedTime) AS FLOAT))/AVG(AverageElapsedTime) 
	END AS DurationSpread,
	query_hash
FROM dbo.ExecutionSamples
GROUP BY query_hash
ORDER BY DurationSpread DESC

