USE AdventureWorks2022
GO

SELECT TOP(10)
    COUNT(*) AS #Rows, 
    st.CountryRegionCode AS Region, 
    st.name AS Territory, 
    p.Name, 
    CAST(SUM(od.LineTotal) AS DECIMAL(8,2)) Sum_LineTotal,
    CAST(STDEV(od.LineTotal) AS DECIMAL(8,2)) StdDev_LineTotal

FROM Sales.SalesOrderHeader oh
TABLESAMPLE (10 PERCENT) -- REPEATABLE (42) 
JOIN Sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
JOIN Sales.SalesTerritory st    ON oh.TerritoryID = st.TerritoryID
JOIN Production.Product p       ON od.ProductID = p.ProductID 
WHERE p.Name LIKE 'Mountain%'
GROUP BY st.CountryRegionCode, st.Name, p.Name
ORDER BY Sum_LineTotal DESC

GO
RETURN

SELECT TOP(10)
    COUNT(*) AS #Rows, 
    st.CountryRegionCode AS Region, 
    st.name AS Territory, 
    p.Name, 
    CAST(SUM(od.LineTotal) AS DECIMAL(8,2)) Sum_LineTotal,
    CAST(STDEV(od.LineTotal) AS DECIMAL(8,2)) StdDev_LineTotal

FROM Sales.SalesOrderHeader oh
TABLESAMPLE (10 PERCENT) -- REPEATABLE (42) 
JOIN Sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
JOIN Sales.SalesTerritory st    ON oh.TerritoryID = st.TerritoryID
JOIN Production.Product p       ON od.ProductID = p.ProductID 
WHERE p.Name LIKE 'Road%'
GROUP BY st.CountryRegionCode, st.Name, p.Name
ORDER BY Sum_LineTotal DESC

GO
RETURN
