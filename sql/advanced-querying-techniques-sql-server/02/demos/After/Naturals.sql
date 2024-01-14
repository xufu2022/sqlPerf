-- Generate natural numbers

;WITH Naturals (n)
AS (
    SELECT 0 AS n
    
    UNION ALL
    
    SELECT n + 1
    FROM Naturals
    WHERE n <= 9
    )

SELECT n
FROM Naturals
ORDER BY n
OPTION (MAXRECURSION 10)

GO
