-- Fibonacci numbers F0 through F11 -- Recursive

;WITH Fib (Fn, Fn_Cur, Fn_Next) 
AS (
   -- Anchor member 
   SELECT 0 AS Fn, 0 AS Fn_Cur, 1 as Fn_Next

   UNION ALL

   -- Recursive member
   SELECT  Fn + 1,
           Fn_Next, 
           CASE Fn 
                WHEN 1 Then 1 
                ELSE Fn_Cur + Fn_Next
           END
   FROM Fib
   WHERE Fn <= 10
)   
-- Show results
SELECT Fn, Fn_Next as value FROM Fib
GO
