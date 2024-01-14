USE [Credit];
GO

-- Include Actual Execution Plan
SET STATISTICS IO ON;

SELECT  [charge_no], [member_no], [provider_no], [category_no],
		[charge_dt], [charge_amt], [statement_no], [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_dt] >= '1999-09-09 10:43:38.333'
ORDER BY [category_no];  -- Do you really need this sorted?


-- If not...
SELECT  [charge_no], [member_no], [provider_no], [category_no],
		[charge_dt], [charge_amt], [statement_no], [charge_code]
FROM    [dbo].[charge]
WHERE   [charge_dt] >= '1999-09-09 10:43:38.333';

SET STATISTICS IO OFF;

-- Takeaway:
-- Ask if ORDER BY is truly being used (you will be surprised
-- how often it isn't)