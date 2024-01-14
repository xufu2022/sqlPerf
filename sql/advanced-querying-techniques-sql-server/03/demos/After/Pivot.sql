-- Use PIVOT to to generate a report
USE AdventureWorks2022
GO

;WITH subset AS ( -- PIVOT data source

    SELECT od.SalesOrderID, od.ProductID, od.LineTotal
    FROM   Sales.SalesOrderDetail AS od
    WHERE  od.ProductID <= 715
)

SELECT SalesOrderID, [707], [708], [709], [710], [711], [712], [713], [714], [715]
FROM subset

-- PIVOT clause does the work of cross tablulation

PIVOT (

SUM(LineTotal)
FOR ProductID IN (
    [707], [708], [709], [710], [711], [712], [713], [714], [715])
) AS pvt

ORDER BY pvt.SalesOrderID

GO
RETURN
