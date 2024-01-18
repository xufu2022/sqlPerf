USE PachaDataTraining;
GO

--CREATE SCHEMA Tools;
GO

DROP TABLE IF EXISTS Tools.TallyDate;
GO

CREATE TABLE Tools.TallyDate (
	[Day] date NOT NULL PRIMARY KEY,
	[DayOfWeek] tinyint NOT NULL DEFAULT (0),
	[DayOfMonth] tinyint NOT NULL DEFAULT (0),
	[Month] tinyint NOT NULL DEFAULT (0),
	[Year] smallint NOT NULL DEFAULT (0)
)
GO

SELECT TOP 40000 
	ROW_NUMBER() OVER (ORDER BY Name),
	DATEADD(day, ROW_NUMBER() OVER (ORDER BY Name), '20100101')
FROM master.dbo.spt_values
CROSS JOIN (VALUES (0), (0)) as t(c)
ORDER BY Name

INSERT INTO Tools.TallyDate ([Day])
SELECT TOP 40000 DATEADD(day, ROW_NUMBER() OVER (ORDER BY Name), '20100101')
FROM master.dbo.spt_values
CROSS JOIN (VALUES (0), (0)) as t(c)
ORDER BY Name

SET DATEFIRST 1;
GO

UPDATE Tools.TallyDate
SET [DayOfWeek] = DATEPART(weekday, [Day]),
	[DayOfMonth] = DAY([Day]),
	[Month] = MONTH([Day]),
	[Year] = YEAR([Day]);
GO

SELECT TOP 10 * FROM Tools.TallyDate;
GO

-- usage
SELECT SessionId, StartDate, DATEADD(DAY, Duration + 1, StartDate) as EndDate, d.[Day]
FROM Course.Session s
JOIN Tools.TallyDate d ON d.[Day] BETWEEN s.StartDate AND DATEADD(DAY, Duration - 1, StartDate)
WHERE d.[DayOfWeek] > 5

-- usage
SELECT 
	StartDate, Duration, SessionId,
	DATEPART(WeekDay, StartDate) as WeekDayOfStartDate,
	DATEPART(WeekDay, DATEADD(Day, Duration-1, StartDate)) as WeekDayOfEndDate
FROM Course.Session
WHERE SessionId IN (
	SELECT SessionId
	FROM Course.Session s
	JOIN Tools.TallyDate d ON d.[Day] BETWEEN s.StartDate AND DATEADD(DAY, Duration - 1, StartDate)
	WHERE d.[DayOfWeek] > 5
)
ORDER BY SessionId

BEGIN TRAN
GO

UPDATE Course.Session
SET
	StartDate = DATEADD(WeekDay, DATEDIFF(WeekDay,0,StartDate), 0)
FROM Course.Session
WHERE SessionId IN (
	SELECT SessionId
	FROM Course.Session s
	JOIN Tools.TallyDate d ON d.[Day] BETWEEN s.StartDate AND DATEADD(DAY, Duration + 1, StartDate)
	WHERE d.[DayOfWeek] = 7
)
AND StartDate > CURRENT_TIMESTAMP
GO

ROLLBACK;
GO

-- are they gaps in Id ?
SELECT *
FROM Enrollment.Invoice AS i
RIGHT JOIN Tools.TallyNumber AS tn ON CAST(SUBSTRING(i.InvoiceId, 2, 100) as int) = tn.Number
WHERE i.InvoiceId IS NULL
AND tn.Number < (SELECT MAX(CAST(SUBSTRING(InvoiceId, 2, 100) as int)) FROM Enrollment.Invoice)
