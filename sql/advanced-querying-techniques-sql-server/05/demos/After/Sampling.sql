USE AdventureWorks2022;
GO

SELECT TOP (10) s.OrderQty, s.ProductID, s.LineTotal
FROM Sales.SalesOrderDetail s
    -- TABLESAMPLE (1000 ROWS)
ORDER BY LineTotal DESC;

GO
RETURN
