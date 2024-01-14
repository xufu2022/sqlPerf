-- Explore the data

SELECT *
FROM Production.ProductCategory

SELECT *
FROM Production.ProductSubcategory
WHERE ProductCategoryID = 1

SELECT *
FROM Production.Product
WHERE ProductSubcategoryID = 1

SELECT TOP(10) * FROM Production.BillOfMaterials

GO

-- Recursive query to get the compoments of a bicycle
 
DECLARE @ProductID INT = 993; -- Mountain-500 Black, 52
;WITH bom
    (ProductAssemblyID, ComponentID, ComponentDesc, PerAssemblyQty, StandardCost, ListPrice, BOMLevel, SortOrder)
AS (

    -- Anchor Member: Initial list of components for desired product

    SELECT b.ProductAssemblyID
        , b.ComponentID
        , p.Name
        , b.PerAssemblyQty
        , p.StandardCost
        , p.ListPrice
        , b.BOMLevel
        , CAST(b.ComponentID AS VARCHAR(100)) AS SortOrder
    FROM Production.BillOfMaterials b
    INNER JOIN Production.Product p
        ON b.ComponentID = p.ProductID
    WHERE b.ComponentID = @ProductID


    UNION ALL
    
    -- Recursive member: Sub components of each parent component
 
    SELECT b.ProductAssemblyID
        , b.ComponentID
        , p.Name
        , b.PerAssemblyQty
        , p.StandardCost
        , p.ListPrice
        , b.BOMLevel
        , CAST(CONCAT(bom.SortOrder, '.', b.ComponentID) AS VARCHAR(100)) AS SortOrder
    FROM bom
    INNER JOIN Production.BillOfMaterials b
        ON b.ProductAssemblyID = bom.ComponentID
    INNER JOIN Production.Product p
        ON b.ComponentID = p.ProductID

    )
 
-- Outer select from the CTE

SELECT bom.ProductAssemblyID
    , bom.ComponentID
    , REPLICATE('.', bom.BOMLevel) + bom.ComponentDesc AS ComponentName
    , SUM(bom.PerAssemblyQty) AS TotalQuantity
    , bom.ListPrice AS UnitPrice
    , SUM(bom.ListPrice) AS ExtendedPrice
    , bom.BOMLevel
FROM bom
GROUP BY bom.SortOrder
    , bom.ComponentID
    , bom.ComponentDesc
    , bom.ProductAssemblyID
    , bom.BOMLevel
    , bom.StandardCost
    , bom.ListPrice
ORDER BY bom.SortOrder
OPTION (MAXRECURSION 5)
