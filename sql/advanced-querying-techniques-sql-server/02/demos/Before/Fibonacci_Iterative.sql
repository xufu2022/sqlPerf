-- Fibonacci numbers F0 through F11 -- Iterative

DECLARE @fib TABLE (Fn int, value bigint)

DECLARE @Fn_1 INT = 1,
        @Fn_2 INT = 0

INSERT INTO @fib (Fn, value) VALUES
    (0, 0)

DECLARE @Fn INT = 2, @maxFn int = 10
WHILE @Fn <= @maxFn
BEGIN
    DECLARE @value INT = @Fn_1 + @Fn_2

    INSERT INTO @fib (Fn, value) VALUES
        (@Fn, @value)

    SET @Fn_2 = @Fn_1
    SET @Fn_1 = @value    
    SET @Fn += 1
END

SELECT Fn, value
FROM @fib
ORDER BY Fn

GO
RETURN

-- First attempt at a recursive query

;WITH Fib (Fn, value) AS (

    -- Anchor member
    SELECT Fn, value 
    FROM (VALUES (0, 0), (1, 1)) fib(Fn, value)
    
    UNION ALL

    -- Reursive member
    SELECT Fn + 1,
        LAG(value, 1) OVER(ORDER BY Fn) + LAG(value, 2) OVER (ORDER BY FN)
    FROM FIb
    WHERE Fn <= 10
)

-- Show results
SELECT Fn, value 
FROM FIB
OPTION (MAXRECURSION 11)

GO
RETURN
