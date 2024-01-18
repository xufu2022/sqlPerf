USE PachaDataTraining;
GO

SELECT TOP 10 
	SessionId,
	StartDate,
	Duration,
	DATEADD(Day, Duration-1, StartDate) as EndDate
FROM Course.Session; 