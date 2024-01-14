USE [tempdb];
GO

-- Create a simple parent/child hierarchy table
CREATE TABLE [dbo].[ProductHierarchy_Company_A]
(
    [ProductHierarchyID] INT NOT NULL
                            PRIMARY KEY CLUSTERED
                            IDENTITY (1, 1) ,
    [ProductID] INT NOT NULL ,
    [ParentProductID] INT NULL
);
GO

-- Insert values 
SET NOCOUNT ON;

INSERT [dbo].[ProductHierarchy_Company_A]
        ( [ProductID], [ParentProductID] )
VALUES  ( 1, NULL ),
        ( 2, 1 );
GO

INSERT [dbo].[ProductHierarchy_Company_A]
        ( [ProductID], [ParentProductID] )
SELECT	TOP (1) [ProductID] + 1,
		[ParentProductID] + 1
FROM [dbo].[ProductHierarchy_Company_A]
WHERE [ParentProductID] IS NOT NULL
ORDER BY [ProductID] DESC;
GO 5000

-- Query to see product id child count
SELECT	[ProductID], 
		[ParentProductID],
		(
			SELECT COUNT ([ParentProductID])
			FROM [dbo].[ProductHierarchy_Company_A] AS [ph2]
			WHERE [ph1].[ProductID] = [ph2].[ParentProductID]
		) AS [ProductID_ChildrenCount]
FROM [dbo].[ProductHierarchy_Company_A] AS [ph1];

-- What if we only want products with 0 children?

-- Turn STATISTICS IO ON 
SET STATISTICS IO ON;
GO

SELECT	[ProductID], 
		[ParentProductID],
		(
			SELECT COUNT ([ParentProductID])
			FROM [dbo].[ProductHierarchy_Company_A] AS [ph2]
			WHERE [ph1].[ProductID] = [ph2].[ParentProductID]
		) AS [ProductID_ChildrenCount]
FROM [dbo].[ProductHierarchy_Company_A] AS [ph1]
-- Notice the repeated code
WHERE (
	SELECT COUNT ([ParentProductID])
	FROM [dbo].[ProductHierarchy_Company_A] AS [ph2]
	WHERE [ph1].[ProductID] = [ph2].[ParentProductID]
) = 0;

-- And the CTE method
WITH [CTE_ProductHierarchy_Company_A] (
	[ProductID], [ParentProductID], [ProductID_ChildrenCount] )
AS (
	SELECT	[ProductID] ,
            [ParentProductID] ,
            (
				SELECT    COUNT([ParentProductID])
                FROM [dbo].[ProductHierarchy_Company_A] AS [ph2]
                WHERE [ph1].[ProductID] = [ph2].[ParentProductID]
            ) AS [ProductID_ChildrenCount]
    FROM [dbo].[ProductHierarchy_Company_A] AS [ph1]
)
SELECT  [ProductID] ,
        [ParentProductID] ,
        [ProductID_ChildrenCount]
FROM [CTE_ProductHierarchy_Company_A]
WHERE [ProductID_ChildrenCount] = 0;
GO

-- Cleanup
SET STATISTICS IO OFF;
GO

DROP TABLE [dbo].[ProductHierarchy_Company_A];
GO