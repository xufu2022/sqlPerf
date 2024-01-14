USE AdventureWorks2022
GO

DECLARE @RandomInt int = FLOOR(RAND()*3+1)

-- Sample analysis for mountain bikes
SELECT TOP(10)
    COUNT(*) AS #Rows, 
    st.CountryRegionCode AS Region, 
    st.name AS Territory, 
    p.Name,
    CAST(SUM(od.LineTotal) AS DECIMAL(8,2)) Sum_LineTotal,
    CAST(STDEVP(od.LineTotal) AS DECIMAL(8,2)) StdDevP_LineTotal

FROM Sales.SalesOrderHeader oh
JOIN Sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
JOIN Sales.SalesTerritory st    ON oh.TerritoryID = st.TerritoryID
JOIN Production.Product p       ON od.ProductID = p.ProductID 
WHERE p.Name LIKE CHOOSE(@RandomInt, 'Mountain', 'Road', 'Touring') + '%'
GROUP BY st.CountryRegionCode, st.Name, p.Name
ORDER BY Sum_LineTotal DESC
