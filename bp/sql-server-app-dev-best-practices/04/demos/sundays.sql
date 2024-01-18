USE PachaDataTraining;
GO

DROP TABLE IF EXISTS #sessions
CREATE TABLE #sessions (SessionId int PRIMARY KEY)

DECLARE cur CURSOR FORWARD_ONLY
FOR 
	SELECT 
		SessionId,
		StartDate,
		Duration
	FROM Course.Session
	WHERE StartDate > CURRENT_TIMESTAMP;

DECLARE 
	@SessionId as int,
	@StartDate as date,
	@Duration as tinyint

OPEN cur

FETCH NEXT FROM cur INTO @SessionId, @StartDate, @Duration
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		DECLARE @i tinyint = 0
		WHILE @i < @Duration -1
		BEGIN
			IF DATEPART(WeekDay, DATEADD(day, @i, @StartDate)) > 5
			BEGIN
				INSERT INTO #sessions VALUES (@SessionId);
				BREAK;
			END
			SET @i += 1; 
		END
	END
	FETCH NEXT FROM cur INTO @SessionId, @StartDate, @Duration
END

CLOSE cur
DEALLOCATE cur
GO

SELECT *
FROM Course.Session
WHERE SessionId IN (
	SELECT SessionId
	FROM #sessions
);

SELECT DATEPART(WeekDay, '2018-04-17');

-- change !
BEGIN TRAN
GO
DECLARE cur CURSOR
FOR 
	SELECT 
		SessionId,
		StartDate,
		Duration
	FROM Course.Session

DECLARE 
	@SessionId as int,
	@StartDate as date,
	@Duration as tinyint

OPEN cur

FETCH NEXT FROM cur INTO @SessionId, @StartDate, @Duration
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		DECLARE @i tinyint = 0
		WHILE @i < @Duration -1
		BEGIN
			IF DATEPART(WeekDay, DATEADD(day, @i, @StartDate)) > 5
				UPDATE Course.Session
				SET StartDate = DATEADD(WeekDay, DATEDIFF(WeekDay,0,StartDate), 0)
				WHERE CURRENT OF cur;
			SET @i += 1; 
		END
	END
	FETCH NEXT FROM cur INTO @SessionId, @StartDate, @Duration
END

CLOSE cur
DEALLOCATE cur
GO

ROLLBACK;