USE [Credit];
GO

SET NOCOUNT ON;
GO

-- Let's create a sample table with 
-- a simple parent/child hierarchy
CREATE TABLE [dbo].[ProductHierarchy]
(
    [ProductHierarchyID] INT NOT NULL IDENTITY (1, 1) ,
    [ProductID] INT NOT NULL ,
    [ParentProductID] INT NULL
);
GO

INSERT [dbo].[ProductHierarchy]
        ( [ProductID], [ParentProductID] )
VALUES  ( 1, NULL ),
        ( 2, 1 );
GO

INSERT [dbo].[ProductHierarchy]
SELECT	TOP (1) [ProductID] + 1,
		[ParentProductID] + 1
FROM [dbo].[ProductHierarchy]
WHERE [ParentProductID] IS NOT NULL
ORDER BY [ProductID] DESC;
GO 5000

-- Explore the data we just loaded
SELECT [ProductID], [ParentProductID]
FROM [dbo].[ProductHierarchy];
GO

-- Now let's use a recursive CTE in order to traverse the hierarchy
-- Include actual execution plan and look at estimated vs. actual
SET STATISTICS TIME ON;
WITH [CTE_Products] (
	[ProductID], [ParentProductID], [ProductLevel] )
AS (
	SELECT	[ProductID] ,
            [ParentProductID] ,
            0 AS [ProductLevel]
    FROM [dbo].[ProductHierarchy]
    WHERE [ParentProductID] IS NULL
    UNION ALL
    SELECT	[pn].[ProductID] ,
            [pn].[ParentProductID] ,
            [p1].[ProductLevel] + 1
    FROM [dbo].[ProductHierarchy] AS [pn]
    INNER JOIN [CTE_Products] AS [p1]
		ON [p1].[ProductID] = [pn].[ParentProductID]
)
SELECT  [ProductID] ,
        [ParentProductID] ,
        [ProductLevel]
FROM [CTE_Products]
ORDER BY [ParentProductID]
OPTION (MAXRECURSION 5001); 
GO
SET STATISTICS TIME OFF;

-- Using a recursive CTE, we might not correct the
-- skew, but we could help with performance by creating
-- supporting indexes
CREATE UNIQUE CLUSTERED INDEX [IX_ProductHierarchy_ProductID]
ON [dbo].[ProductHierarchy] ([ProductID]);
GO

CREATE UNIQUE NONCLUSTERED INDEX
	[IX_ProductHierarchy_ParentProductID]
ON [dbo].[ProductHierarchy] ([ParentProductID]);
GO

-- This time?
SET STATISTICS TIME ON;
WITH [CTE_Products] (
	[ProductID], [ParentProductID], [ProductLevel] )
AS (
	SELECT	[ProductID] ,
            [ParentProductID] ,
            0 AS [ProductLevel]
    FROM [dbo].[ProductHierarchy]
    WHERE [ParentProductID] IS NULL
    UNION ALL
    SELECT	[pn].[ProductID] ,
            [pn].[ParentProductID] ,
            [p1].[ProductLevel] + 1
    FROM [dbo].[ProductHierarchy] AS [pn]
    INNER JOIN [CTE_Products] AS [p1]
		ON [p1].[ProductID] = [pn].[ParentProductID]
)
SELECT  [ProductID] ,
        [ParentProductID] ,
        [ProductLevel]
FROM [CTE_Products]
ORDER BY [ParentProductID]
OPTION (MAXRECURSION 5001, RECOMPILE); 
GO
SET STATISTICS TIME OFF;

-- Other methods (such as WHILE loops)?
-- See: "Optimize Recursive CTE Query"
-- http://bit.ly/CTEOptimize

-- Cleanup
DROP TABLE [dbo].[ProductHierarchy];
GO

