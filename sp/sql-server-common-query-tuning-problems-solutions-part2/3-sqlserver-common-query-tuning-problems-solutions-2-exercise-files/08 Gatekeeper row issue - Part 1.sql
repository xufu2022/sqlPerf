USE [AdventureWorksDW2012];
GO

-- Let's create a new DimProduct row with 
-- no Fact table mapping
INSERT  [dbo].[DimProduct]
        ( [ProductAlternateKey] ,
          [ProductSubcategoryKey] ,
          [WeightUnitMeasureCode] ,
          [SizeUnitMeasureCode] ,
          [EnglishProductName] ,
          [SpanishProductName] ,
          [FrenchProductName] ,
          [StandardCost] ,
          [FinishedGoodsFlag] ,
          [Color] ,
          [SafetyStockLevel] ,
          [ReorderPoint] ,
          [ListPrice] ,
          [Size] ,
          [SizeRange] ,
          [Weight] ,
          [DaysToManufacture] ,
          [ProductLine] ,
          [DealerPrice] ,
          [Class] ,
          [Style] ,
          [ModelName] ,
          [LargePhoto] ,
          [EnglishDescription] ,
          [FrenchDescription] ,
          [ChineseDescription] ,
          [ArabicDescription] ,
          [HebrewDescription] ,
          [ThaiDescription] ,
          [GermanDescription] ,
          [JapaneseDescription] ,
          [TurkishDescription] ,
          [StartDate] ,
          [EndDate] ,
          [Status]
        )
        SELECT TOP 1
                'BA-8999' ,
                [ProductSubcategoryKey] ,
                [WeightUnitMeasureCode] ,
                [SizeUnitMeasureCode] ,
                [EnglishProductName] ,
                [SpanishProductName] ,
                [FrenchProductName] ,
                [StandardCost] ,
                [FinishedGoodsFlag] ,
                [Color] ,
                [SafetyStockLevel] ,
                [ReorderPoint] ,
                622.22 , -- List price not in DimProduct
                [Size] ,
                [SizeRange] ,
                [Weight] ,
                [DaysToManufacture] ,
                [ProductLine] ,
                [DealerPrice] ,
                [Class] ,
                [Style] ,
                [ModelName] ,
                [LargePhoto] ,
                [EnglishDescription] ,
                [FrenchDescription] ,
                [ChineseDescription] ,
                [ArabicDescription] ,
                [HebrewDescription] ,
                [ThaiDescription] ,
                [GermanDescription] ,
                [JapaneseDescription] ,
                [TurkishDescription] ,
                [StartDate] ,
                [EndDate] ,
                [Status]
        FROM    [dbo].[DimProduct]
        ORDER BY ListPrice;

-- Not for production use
DBCC DROPCLEANBUFFERS;
GO
 
SELECT  COUNT(*) AS [BufferCount]
FROM    sys.[dm_os_buffer_descriptors] AS [dobd];

-- Include actual execution plan
SET STATISTICS IO ON;

SELECT  [p].[ProductLine] ,
        AVG([fis].[SalesAmount]) AS [AvgSalesAMT]
FROM    [dbo].[FactInternetSales] AS [fis]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [fis].[ProductKey] = [p].[ProductKey]
WHERE   [p].[ListPrice] = 622.22
GROUP BY [p].[ProductLine]
ORDER BY [p].[ProductLine]
OPTION (RECOMPILE);
GO

SET STATISTICS IO OFF;

SELECT  COUNT(*) AS [BufferCount]
FROM    sys.[dm_os_buffer_descriptors] AS [dobd];