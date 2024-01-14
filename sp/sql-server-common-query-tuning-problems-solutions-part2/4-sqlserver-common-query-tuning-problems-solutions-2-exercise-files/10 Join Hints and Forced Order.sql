USE [Credit];
GO

-- Original query
-- Include actual execution plan
-- Focus on the join ordering
SELECT  [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [provider].[expr_dt]
FROM    [dbo].[category]
INNER JOIN [dbo].[charge]
ON      [dbo].[category].[category_no] =
			[dbo].[charge].[category_no]
INNER JOIN [dbo].[member]
ON      [dbo].[charge].[member_no] = [dbo].[member].[member_no]
INNER JOIN [dbo].[corporation]
ON      [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
INNER JOIN [dbo].[provider]
ON      [dbo].[charge].[provider_no] =
			[dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
				[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
				[dbo].[region].[region_no];

-- What if we force a HASH join between category and charge?
-- Notice the order of all other joins!
SELECT  [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [provider].[expr_dt]
FROM    [dbo].[category]
INNER HASH JOIN [dbo].[charge]
ON      [dbo].[category].[category_no] =
			[dbo].[charge].[category_no]
INNER JOIN [dbo].[member]
ON      [dbo].[charge].[member_no] = [dbo].[member].[member_no]
INNER JOIN [dbo].[corporation]
ON      [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
INNER JOIN [dbo].[provider]
ON      [dbo].[charge].[provider_no] =
			[dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
				[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
				[dbo].[region].[region_no];

-- What if charge was the first reference?
SELECT  [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [provider].[expr_dt]
FROM    [dbo].[charge]
INNER HASH JOIN [dbo].[category]
ON      [dbo].[category].[category_no] =
			[dbo].[charge].[category_no]
INNER JOIN [dbo].[member]
ON      [dbo].[charge].[member_no] = [dbo].[member].[member_no]
INNER JOIN [dbo].[corporation]
ON      [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
INNER JOIN [dbo].[provider]
ON      [dbo].[charge].[provider_no] =
			[dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
				[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
				[dbo].[region].[region_no];

-- Join hints should be used sparingly if at all, but sometimes
-- you might know "better" - but if you're joining
-- multiple tables and add a join hint, you're forcing
-- overall join order!