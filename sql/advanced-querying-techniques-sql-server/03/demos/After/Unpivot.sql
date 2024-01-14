-- Toy example with constant values

USE AdventureWorks2022
GO

;WITH source(id, c1, c2, c3, c4, c5) AS (

    SELECT * FROM (
        VALUES
            ('a', 1, 2, 3, 4, 5),
            ('b', 6, 7, 8, 9, 10) 
    ) v(id, c1, c2, c3, c4, c5)
)

SELECT id, c1_5, val
FROM source
UNPIVOT (val FOR c1_5 IN
    (c1, c2, c3, c4, c5)
) AS upvt

GO
RETURN

-- Unpivot result from Pivot example

;WITH subset AS (

    SELECT od.SalesOrderID, od.ProductID, od.LineTotal AS Price
    FROM   Sales.SalesOrderDetail AS od
    WHERE  od.ProductID <= 715
),

pvt AS (
    SELECT SalesOrderID, [707], [708], [709], [710], [711], [712], [713], [714], [715]
    FROM subset
    PIVOT (

    SUM(Price)
    FOR ProductID IN ([707], [708], [709], [710], [711], [712], [713], [714], [715])
    ) AS pvt
)

SELECT * FROM pvt

-- SELECT SalesOrderID, ProductId, Price
-- FROM pvt
-- UNPIVOT (Price FOR ProductID IN ([707], [708], [709], [710], [711], [712], [713], [714], [715])) AS upvt
-- ORDER BY SalesOrderID

-- Unpivotting using CROSS APPLY VALUES

-- SELECT SalesOrderID, a.ProductId, Price
-- FROM pvt
-- CROSS APPLY (VALUES 
--     (707,  [707]),
--     (708,  [708]),
--     (709,  [709]),
--     (710,  [710]),
--     (711,  [711]),
--     (712,  [712]),
--     (713,  [713]),
--     (714,  [714]),
--     (715,  [715])           
    
-- ) a(ProductId, Price)
-- WHERE Price IS NOT NULL
-- ORDER BY SalesOrderID

GO
RETURN
