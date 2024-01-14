USE AdventureWorks2022
GO

-- Get top 10 best selling bikes

SELECT TOP(10) od.ProductID, p.Name AS ProductName, SUM(od.LineTotal) Sum_LineTotal
FROM sales.SalesOrderHeader oh
JOIN sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
JOIN Production.Product p       ON od.ProductID = p.ProductID 
GROUP BY od.ProductID, p.Name
ORDER BY Sum_LineTotal DESC

GO
RETURN

-- Pivot using Product IDs from previous query

;WITH Top_Sales(Region, Territory, ProductId, Sales) AS (

    SELECT st.CountryRegionCode, st.name, p.ProductID, CAST(SUM(od.LineTotal) AS DECIMAL(8,2)) Sum_LineTotal
    FROM sales.SalesOrderHeader oh
    JOIN sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
    JOIN sales.SalesTerritory st    ON oh.TerritoryID = st.TerritoryID
    JOIN Production.Product p       ON od.ProductID = p.ProductID 
    GROUP BY st.CountryRegionCode, st.Name, p.ProductID
)

SELECT Region, Territory, [782],[783],[779],[780],[781],[784],[793],[794],[795],[753]
FROM Top_Sales

PIVOT (
    SUM(Sales)
    FOR ProductID IN (
        [782],[783],[779],[780],[781],[784],[793],[794],[795],[753]
)) AS pvt1

ORDER BY Region, Territory

GO
RETURN

-- Make it dynamic

-- Get column names in a formatted string

DECLARE @Cols NVARCHAR(100) = 

(
    SELECT TOP(10) ', ' + QUOTENAME(od.ProductID)
    FROM sales.SalesOrderHeader oh
    JOIN sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
    JOIN Production.Product p       ON od.ProductID = p.ProductID 
    GROUP BY od.ProductID, p.Name
    ORDER BY SUM(od.LineTotal) DESC
    FOR XML PATH('')
)

SET @Cols = SUBSTRING(@cols, 3, 100)
PRINT @Cols

-- Alternate method for SQL Server version 2017 and up

SELECT STRING_AGG(QUOTENAME(s.ProductID ), ', ')
FROM (SELECT TOP 10 od.ProductID
FROM sales.SalesOrderHeader oh
JOIN sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
JOIN Production.Product p       ON od.ProductID = p.ProductID 
GROUP BY od.ProductID, p.Name
ORDER BY SUM(od.LineTotal) DESC) s

-- Main query template

DECLARE @stmt NVARCHAR(MAX) = N'

    ;WITH Top_Sales(Region, Territory, ProductId, Sales) AS (

        SELECT st.CountryRegionCode, st.name, p.ProductID, CAST(SUM(od.LineTotal) AS DECIMAL(8,2)) Sum_LineTotal
        FROM sales.SalesOrderHeader oh
        JOIN sales.SalesOrderDetail od  ON oh.SalesOrderID = od.SalesOrderID
        JOIN sales.SalesTerritory st    ON oh.TerritoryID = st.TerritoryID
        JOIN Production.Product p       ON od.ProductID = p.ProductID 
        GROUP BY st.CountryRegionCode, st.Name, p.ProductID
    )

    SELECT Region, Territory, {@Cols}   -- Dynamic columns substituted here
    FROM Top_Sales

    PIVOT (
        SUM(Sales)
        FOR ProductID IN ({@Cols})      -- Dynamic columns substituted here
    ) AS pvt1

    ORDER BY Region, Territory
'

-- Put the column names in the template

SET @stmt = REPLACE(@stmt, '{@Cols}', @Cols)
PRINT @stmt

-- Run the dynamic query

EXEC sp_executesql @stmt = @stmt

GO
RETURN
