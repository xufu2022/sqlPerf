-- Multi pivot
USE AdventureWorks2022;
GO

;WITH subset AS (

SELECT od.SalesOrderID, od.ProductID, CONCAT('qty', od.ProductID) AS ProdIdQty, od.OrderQty, od.LineTotal AS Price
FROM Sales.SalesOrderDetail AS od
WHERE ProductID <= 715
)

SELECT SalesOrderID, 
    [707], [qty707], [708], [qty708], [709], [qty709], [710], [qty710]
FROM  subset

PIVOT (     -- First pivot on price total

    SUM(Price)
    FOR ProductID IN (
        [707],
        [708],
        [709],
        [710])
    ) AS pvt1

PIVOT(      -- Second pivot on order quantity

    SUM(OrderQty)
    FOR ProdIdQty IN (
        [qty707],
        [qty708],
        [qty709],
        [qty710])
    ) AS pvt2

ORDER BY SalesOrderID

GO
RETURN