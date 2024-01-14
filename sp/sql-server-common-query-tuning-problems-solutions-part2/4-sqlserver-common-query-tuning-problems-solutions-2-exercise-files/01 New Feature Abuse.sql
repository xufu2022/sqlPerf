USE [Credit];
GO

-- CHOOSE function used in SELECT clause
SELECT  TOP 100
		[member].[member_no] ,
        [member].[street] ,
        [member].[city] ,
        [charge].[charge_no] ,
        [charge].[provider_no] ,
		[charge].[category_no],
        CHOOSE([charge].[category_no], 
				'Travel',
				'Meals',
				'Lodging',
				'Groceries',
				'Entertainment',
				'Clothing',
				'Electronics',
				'Home Supplies',
				'Communication',
				'Misc') AS [category_desc],
        [charge].[charge_dt] ,
        [charge].[charge_amt] ,
        [charge].[charge_code]
FROM    [dbo].[charge]
        INNER JOIN [dbo].[member] 
		ON [member].[member_no] = [charge].[member_no]
ORDER BY [charge].[charge_no];
GO

-- Run both together
DECLARE @Column INT = 2 ,
    @Value INT = 10;
 
SELECT  [member].[member_no] ,
        [member].[street] ,
        [member].[city] ,
        [charge].[charge_no] ,
        [charge].[provider_no] ,
        [charge].[category_no] ,
        [charge].[charge_dt] ,
        [charge].[charge_amt] ,
        [charge].[charge_code]
FROM    [dbo].[charge]
        INNER JOIN [dbo].[member] 
		ON [member].[member_no] = [charge].[member_no]
WHERE   CHOOSE(@Column, [charge].[provider_no], 
				[charge].[category_no]) = @Value;
GO

DECLARE @Column INT = 1 ,
    @Value INT = 10;
 
SELECT  [member].[member_no] ,
        [member].[street] ,
        [member].[city] ,
        [charge].[charge_no] ,
        [charge].[provider_no] ,
        [charge].[category_no] ,
        [charge].[charge_dt] ,
        [charge].[charge_amt] ,
        [charge].[charge_code]
FROM    [dbo].[charge]
        INNER JOIN [dbo].[member] 
		ON [member].[member_no] = [charge].[member_no]
WHERE   CHOOSE(@Column, [charge].[provider_no], 
				[charge].[category_no]) = @Value;
GO

-- Contrast this to RECOMPILE and the two possible "shapes"
-- Run both together
DECLARE @Column INT = 2 ,
    @Value INT = 10;
 
SELECT  [member].[member_no] ,
        [member].[street] ,
        [member].[city] ,
        [charge].[charge_no] ,
        [charge].[provider_no] ,
        [charge].[category_no] ,
        [charge].[charge_dt] ,
        [charge].[charge_amt] ,
        [charge].[charge_code]
FROM    [dbo].[charge]
        INNER JOIN [dbo].[member] 
		ON [member].[member_no] = [charge].[member_no]
WHERE   CHOOSE(@Column, [charge].[provider_no], 
		[charge].[category_no]) = @Value
OPTION  ( RECOMPILE );
GO

DECLARE @Column INT = 1 ,
    @Value INT = 10;
 
SELECT  [member].[member_no] ,
        [member].[street] ,
        [member].[city] ,
        [charge].[charge_no] ,
        [charge].[provider_no] ,
        [charge].[category_no] ,
        [charge].[charge_dt] ,
        [charge].[charge_amt] ,
        [charge].[charge_code]
FROM    [dbo].[charge]
        INNER JOIN [dbo].[member] 
		ON [member].[member_no] = [charge].[member_no]
WHERE   CHOOSE(@Column, [charge].[provider_no], 
		[charge].[category_no]) = @Value
OPTION  ( RECOMPILE );
GO

-- General takeaway - be careful of extending 
-- new functionality in unexpected ways as the optimizer
-- may not produce an ideal plan and strategy...