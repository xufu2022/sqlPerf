-- What products have Ids less than or equal to 715?

USE AdventureWorks2022
GO

SELECT DISTINCT [ProductID]
FROM  Sales.SalesOrderDetail
WHERE ProductID <= 715 
ORDER BY ProductID

GO
RETURN

-- Use Cross Tabulation to generate a report 

;WITH subset AS (
    SELECT  od.SalesOrderID, od.ProductID, od.LineTotal
    FROM    Sales.SalesOrderDetail AS od
    WHERE   ProductID <= 715
)

-- Cross tabulation of SUM of 
SELECT SalesOrderID,
    SUM(IIF(ProductID = 707, LineTotal, 0)) AS [707],
    SUM(IIF(ProductID = 708, LineTotal, 0)) AS [708],
    SUM(IIF(ProductID = 709, LineTotal, 0)) AS [709],
    SUM(IIF(ProductID = 710, LineTotal, 0)) AS [710],
    SUM(IIF(ProductID = 711, LineTotal, 0)) AS [711],
    SUM(IIF(ProductID = 712, LineTotal, 0)) AS [712],
    SUM(IIF(ProductID = 713, LineTotal, 0)) AS [713],
    SUM(IIF(ProductID = 714, LineTotal, 0)) AS [714],
    SUM(IIF(ProductID = 715, LineTotal, 0)) AS [715]

FROM subset
GROUP BY SalesOrderID
ORDER BY SalesOrderID

GO
RETURN
