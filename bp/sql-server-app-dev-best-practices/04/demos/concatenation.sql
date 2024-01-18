SELECT cl.Title as Course, s.StartDate
FROM Course.CourseLanguage AS cl
JOIN Course.Session as s 
	ON cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
WHERE Title LIKE 'Firebird%'
ORDER BY Title, s.StartDate;

SELECT cl.Title as Course --, ... ?
FROM Course.CourseLanguage AS cl
JOIN Course.Session as s 
	ON cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
WHERE Title LIKE 'Firebird%'
GROUP BY cl.Title
ORDER BY Title;

SELECT cl.Title as Course , 
	STRING_AGG(FORMAT(StartDate, 'd', 'en-US'), ', ') 
	WITHIN GROUP (ORDER BY StartDate) as Schedule
FROM Course.CourseLanguage AS cl
JOIN Course.Session as s 
	ON cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
WHERE Title LIKE 'Firebird%'
GROUP BY cl.Title
ORDER BY Title;

SELECT st.text, qs.*
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
WHERE st.text LIKE '%STRING_AGG%'
AND st.text NOT LIKE '%dm_exec_query_stats%';

SELECT cl.Title as Course , 
	STRING_AGG(CONVERT(CHAR(10), StartDate, 110), ', ') 
	WITHIN GROUP (ORDER BY StartDate) as Schedule
FROM Course.CourseLanguage AS cl
JOIN Course.Session as s 
	ON cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
WHERE Title LIKE 'Firebird%'
GROUP BY cl.Title
ORDER BY Title;

-- XML
SELECT TOP 10 CONVERT(CHAR(10), StartDate, 101) as StartDate
FROM Course.Session as s 
ORDER BY StartDate
FOR XML AUTO;

SELECT TOP 10 ', ' + CONVERT(CHAR(10), StartDate, 101) as [data()]
FROM Course.Session as s 
ORDER BY StartDate
FOR XML PATH('');

SELECT TOP 10 STUFF(', ' + CONVERT(CHAR(10), StartDate, 101), 1, 2, '') as [data()]
FROM Course.Session as s 
ORDER BY StartDate
FOR XML PATH(''), TYPE;


SELECT MIN(cl.Title) as Course,
	(
		SELECT CONVERT(CHAR(10), StartDate, 101)
		FROM Course.Session as s 
		WHERE cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
		ORDER BY StartDate
	) 
FROM Course.CourseLanguage AS cl
WHERE Title LIKE 'Firebird%'
GROUP BY cl.CourseId, cl.LanguageCd
ORDER BY Course;
GO

SELECT MIN(cl.Title) as Course,
	(
		SELECT STUFF(', ' + CONVERT(CHAR(10), StartDate, 101), 1, 2, '') as [data()]
		FROM Course.Session as s 
		WHERE cl.CourseId = s.CourseId AND cl.LanguageCd = s.LanguageCd
		ORDER BY StartDate
		FOR XML PATH('')
	) 
FROM Course.CourseLanguage AS cl
WHERE Title LIKE 'Firebird%'
GROUP BY cl.CourseId, cl.LanguageCd
ORDER BY Course;
GO

SELECT st.text, qs.*
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
WHERE st.text LIKE '%FROM Course.CourseLanguage%'
AND st.text NOT LIKE '%dm_exec_query_stats%';