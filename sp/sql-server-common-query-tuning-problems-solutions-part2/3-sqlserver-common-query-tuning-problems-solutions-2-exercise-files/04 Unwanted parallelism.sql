USE [Credit];
GO

-- Parallelism can be helpful, but for OLTP workloads, they suggest
-- higher cost and potentially concurrency & throughput concerns

-- (We'll discuss deep-tree concerns in the next demo)

-- Include actual execution plan
SELECT TOP 1000
        [category].[category_no] ,
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
ON      [dbo].[charge].[provider_no] =
	[dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
			[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
			[dbo].[region].[region_no]
INNER JOIN [dbo].[statement]
ON      [dbo].[member].[member_no] =
			[dbo].[statement].[member_no]
ORDER BY [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [payment].[member_no] ,
        [provider].[expr_dt];

-- Questions:
--		Appropriate "cost theshold for parallelism"?
--		Appropriate "max degree of parallelism"?
--		All parts of the query needed ("right" TOP number, 
--		joins, sorting requirements)?

-- Current value?
SELECT [value_in_use]
FROM [sys].[configurations] AS [c]
WHERE [name] = 'cost threshold for parallelism';

-- Given mostly OLTP-centric activity, let's bump it up
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE

-- The right value?
-- Know thy workloads and remember that cost is
-- a "unitless" value...
EXEC sp_configure 'cost threshold for parallelism', 200;
RECONFIGURE

EXEC sp_configure 'show advanced options', 0;
RECONFIGURE

-- The plan?  And execution time?
SELECT TOP 1000
        [category].[category_no] ,
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
ON      [dbo].[charge].[provider_no] =
	[dbo].[provider].[provider_no]
INNER JOIN [dbo].[region]
ON      [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
			[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
			[dbo].[region].[region_no]
INNER JOIN [dbo].[statement]
ON      [dbo].[member].[member_no] =
			[dbo].[statement].[member_no]
ORDER BY [category].[category_no] ,
        [charge].[member_no] ,
        [member].[street] ,
        [corporation].[corp_no] ,
        [payment].[member_no] ,
        [provider].[expr_dt]
OPTION (RECOMPILE);

-- Cleanup
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE

EXEC sp_configure 'cost threshold for parallelism', 5;
RECONFIGURE

EXEC sp_configure 'show advanced options', 0;
RECONFIGURE
