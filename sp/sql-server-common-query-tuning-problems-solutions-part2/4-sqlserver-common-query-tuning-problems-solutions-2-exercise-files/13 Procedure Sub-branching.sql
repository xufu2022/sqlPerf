USE [Credit];
GO

-- Let's create sub-stored procedures based on
-- common and/or anticipated non-NULL parameter inputs
CREATE PROCEDURE [dbo].[SwissArmyKnifeProcedure]
@category_no INT = NULL ,
@member_no INT = NULL ,
@street VARCHAR(15) = NULL ,
@corp_no INT = NULL ,
@expr_dt DATETIME = NULL ,
@charge_no INT = NULL
AS
IF ( @category_no IS NOT NULL
    AND @member_no IS NOT NULL
    AND @corp_no IS NOT NULL
    AND @street IS NULL
    AND @expr_dt IS NULL
    AND @charge_no IS NULL
)
BEGIN
    EXECUTE [SwissArmyKnifeProcedure_Sub_1] @category_no = 3,
        @member_no = 4562, @corp_no = 299;
END
ELSE
IF ( @category_no IS NULL
        AND @member_no IS NULL
        AND @corp_no IS NULL
        AND @street IS NULL
        AND @expr_dt IS NULL
        AND @charge_no IS NOT NULL
    )
    BEGIN
    EXECUTE [SwissArmyKnifeProcedure_Sub_2] @charge_no = 901665;
    END
ELSE
    BEGIN
    SELECT  [charge].[charge_no] ,
            [category].[category_no] ,
            [charge].[member_no] ,
            [member].[street] ,
            [corporation].[corp_no] ,
            [provider].[expr_dt]
    FROM    [dbo].[category]
            INNER JOIN [dbo].[charge]
            ON [dbo].[category].[category_no] =
					[dbo].[charge].[category_no]
            INNER JOIN [dbo].[member]
            ON [dbo].[charge].[member_no] =
					[dbo].[member].[member_no]
            INNER JOIN [dbo].[corporation]
            ON [dbo].[member].[corp_no] =
					[dbo].[corporation].[corp_no]
            INNER JOIN [dbo].[provider]
            ON [dbo].[charge].[provider_no] =
					[dbo].[provider].[provider_no]
            INNER JOIN [dbo].[region]
            ON [dbo].[member].[region_no] =
					[dbo].[region].[region_no]
                AND [dbo].[corporation].[region_no] =
						[dbo].[region].[region_no]
                AND [dbo].[provider].[region_no] =
						[dbo].[region].[region_no]
    WHERE   [category].[category_no] =
				ISNULL(@category_no, [category].[category_no])
            AND [charge].[member_no] =
				ISNULL(@member_no, [charge].[member_no])
            AND [member].[street] =
				ISNULL(@street, [member].[street])
            AND [corporation].[corp_no] =
				ISNULL(@corp_no, [corporation].[corp_no])
            AND [provider].[expr_dt] =
				ISNULL(@expr_dt, [provider].[expr_dt])
            AND [charge].[charge_no] =
				ISNULL(@charge_no, [charge].[charge_no]);
    END
GO

CREATE PROCEDURE [dbo].[SwissArmyKnifeProcedure_Sub_1]
@category_no INT ,
@member_no INT ,
@corp_no INT
AS
SELECT  [charge].[charge_no] ,
    [category].[category_no] ,
    [charge].[member_no] ,
    [member].[street] ,
    [corporation].[corp_no] ,
    [provider].[expr_dt]
FROM    [dbo].[category]
    INNER JOIN [dbo].[charge]
    ON [dbo].[category].[category_no] =
			[dbo].[charge].[category_no]
    INNER JOIN [dbo].[member]
    ON [dbo].[charge].[member_no] = [dbo].[member].[member_no]
    INNER JOIN [dbo].[corporation]
    ON [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
    INNER JOIN [dbo].[provider]
    ON [dbo].[charge].[provider_no] =
			[dbo].[provider].[provider_no]
    INNER JOIN [dbo].[region]
    ON [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
				[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
				[dbo].[region].[region_no]
WHERE   [category].[category_no] = @category_no
    AND [charge].[member_no] = @member_no
    AND [corporation].[corp_no] = @corp_no;
GO

CREATE PROCEDURE
	[dbo].[SwissArmyKnifeProcedure_Sub_2] @charge_no INT
AS
SELECT  [charge].[charge_no] ,
    [category].[category_no] ,
    [charge].[member_no] ,
    [member].[street] ,
    [corporation].[corp_no] ,
    [provider].[expr_dt]
FROM    [dbo].[category]
    INNER JOIN [dbo].[charge]
    ON [dbo].[category].[category_no] =
			[dbo].[charge].[category_no]
    INNER JOIN [dbo].[member]
    ON [dbo].[charge].[member_no] = [dbo].[member].[member_no]
    INNER JOIN [dbo].[corporation]
    ON [dbo].[member].[corp_no] = [dbo].[corporation].[corp_no]
    INNER JOIN [dbo].[provider]
    ON [dbo].[charge].[provider_no] =
			[dbo].[provider].[provider_no]
    INNER JOIN [dbo].[region]
    ON [dbo].[member].[region_no] = [dbo].[region].[region_no]
        AND [dbo].[corporation].[region_no] =
				[dbo].[region].[region_no]
        AND [dbo].[provider].[region_no] =
				[dbo].[region].[region_no]
WHERE   [charge].[charge_no] = @charge_no;
GO

-- Now let's designate three of the input parameters
-- Include actual execution plan
SET STATISTICS IO ON;

EXECUTE [SwissArmyKnifeProcedure] @category_no = 3,
	@member_no = 4562, @corp_no = 299;

EXECUTE [SwissArmyKnifeProcedure] @charge_no = 901665;

SET STATISTICS IO OFF;
GO

-- Cleanup
DROP PROCEDURE [dbo].[SwissArmyKnifeProcedure];
DROP PROCEDURE [dbo].[SwissArmyKnifeProcedure_Sub_1];
DROP PROCEDURE [dbo].[SwissArmyKnifeProcedure_Sub_2];
GO
