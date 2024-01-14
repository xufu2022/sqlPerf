USE [Credit];
GO

CREATE PROCEDURE [dbo].[SwissArmyKnifeProcedure]
	@category_no INT = NULL,
	@member_no INT = NULL,
	@street VARCHAR(15) = NULL,
	@corp_no INT = NULL,
	@expr_dt DATETIME = NULL,
	@charge_no INT = NULL
AS
SELECT  [charge].[charge_no],
		[category].[category_no] ,
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
				[dbo].[region].[region_no]
WHERE [category].[category_no] =
			ISNULL(@category_no, [category].[category_no])
		AND [charge].[member_no] =
			ISNULL (@member_no, [charge].[member_no])
		AND [member].[street] =
			ISNULL (@street, [member].[street])
		AND [corporation].[corp_no] =
			ISNULL (@corp_no, [corporation].[corp_no])
		AND [provider].[expr_dt] =
			ISNULL (@expr_dt, [provider].[expr_dt])
		AND [charge].[charge_no] =
			ISNULL (@charge_no, [charge].[charge_no]);
GO

-- Now let's designate three of the input parameters
-- Include actual execution plan
SET STATISTICS IO ON;

EXECUTE [SwissArmyKnifeProcedure]
	@category_no  =  3,
	@member_no  = 4562,
	@corp_no  = 299;

SET STATISTICS IO OFF;

-- What plan was used?
-- What was the I/O?

-- And this?
SET STATISTICS IO ON;

EXECUTE [SwissArmyKnifeProcedure]
	@charge_no  =  901665;

SET STATISTICS IO OFF;
GO

-- But what if parameters must be "flexible"? Options?
-- 1) Consider branching to sub-stored procedures based on
--    common patterns
-- 2) Consider procedure / dynamic SQL hybrids, i.e. via
--    sp_executesql
-- 3) Strategic and careful placement of the RECOMPILE hint

ALTER PROCEDURE [dbo].[SwissArmyKnifeProcedure]
	@category_no INT = NULL,
	@member_no INT = NULL,
	@street VARCHAR(15) = NULL,
	@corp_no INT = NULL,
	@expr_dt DATETIME = NULL,
	@charge_no INT = NULL
AS
SELECT  [charge].[charge_no],
		[category].[category_no] ,
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
				[dbo].[region].[region_no]
WHERE [category].[category_no] =
			ISNULL(@category_no, [category].[category_no])
		AND [charge].[member_no] =
			ISNULL (@member_no, [charge].[member_no])
		AND [member].[street] =
			ISNULL (@street, [member].[street])
		AND [corporation].[corp_no] =
			ISNULL (@corp_no, [corporation].[corp_no])
		AND [provider].[expr_dt] =
			ISNULL (@expr_dt, [provider].[expr_dt])
		AND [charge].[charge_no] =
			ISNULL (@charge_no, [charge].[charge_no])
OPTION (RECOMPILE);
GO

-- Now let's look at the plans and I/O stats again
-- And we'll add CPU time as well
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

EXECUTE [SwissArmyKnifeProcedure]
	@category_no  =  3,
	@member_no  = 4562,
	@corp_no  = 299;

EXECUTE [SwissArmyKnifeProcedure]
	@charge_no  =  901665;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO


-- Cleanup
DROP PROCEDURE [dbo].[SwissArmyKnifeProcedure];
GO
