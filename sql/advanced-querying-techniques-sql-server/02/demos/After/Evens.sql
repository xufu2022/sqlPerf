-- Generate even natural numbers

;WITH Naturals (n, rd)
AS (
    SELECT 0 AS n, 0 as rd
    
    UNION ALL
    
    SELECT n + 2, rd + 1
    FROM Naturals
    WHERE n <= 18
    )

SELECT n, rd
FROM Naturals
ORDER BY n
OPTION (MAXRECURSION 10)

GO
