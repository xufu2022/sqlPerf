USE [Credit];
GO

-- SQL Server can handle a significant amount of complexity
-- But for OLTP - complexity increases the risk of not meeting
-- expected workload characteristics (small transactions, high
-- throughput)

-- Include actual execution plan and look at leaf-level 
-- estimate for "charge"
SELECT  [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [payment].[member_no] ,
        [provider].[expr_dt]
FROM    [dbo].[category]
INNER JOIN [dbo].[charge]
ON      [dbo].[category].[category_no] =
	[dbo].[charge].[category_no]
INNER JOIN [dbo].[member]
ON      [dbo].[charge].[member_no] = [dbo].[member].[member_no]
INNER JOIN [dbo].[corporation]
ON      [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
INNER JOIN [dbo].[payment]
ON      [dbo].[member].[member_no] = [dbo].[payment].[member_no]
INNER JOIN [dbo].[provider]
ON      [dbo].[charge].[provider_no] = [dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
			[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
			[dbo].[region].[region_no]
INNER JOIN [dbo].[statement]
ON      [dbo].[member].[member_no] = [dbo].[statement].[member_no]
WHERE   [charge].[member_no]  = 7077;

-- Let's introduce a leaf-level issue
-- Include actual execution plan and look at leaf-level 
-- estimate for "charge"
SELECT  [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [payment].[member_no] ,
        [provider].[expr_dt]
FROM    [dbo].[category]
INNER JOIN [dbo].[charge]
ON      [dbo].[category].[category_no] =
	[dbo].[charge].[category_no]
INNER JOIN [dbo].[member]
ON      [dbo].[charge].[member_no] = [dbo].[member].[member_no]
INNER JOIN [dbo].[corporation]
ON      [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
INNER JOIN [dbo].[payment]
ON      [dbo].[member].[member_no] = [dbo].[payment].[member_no]
INNER JOIN [dbo].[provider]
ON      [dbo].[charge].[provider_no] = [dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
			[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
			[dbo].[region].[region_no]
INNER JOIN [dbo].[statement]
ON      [dbo].[member].[member_no] = [dbo].[statement].[member_no]
WHERE   ' ' + CAST([charge].[member_no] AS NVARCHAR(10)) = ' ' + '7077'
OPTION (RECOMPILE);

-- Can OLTP have complexity? Yes
-- Does this increase the risk "surface area"?  Yes
-- Skews at the leaf-level get pulled up a deep query tree

