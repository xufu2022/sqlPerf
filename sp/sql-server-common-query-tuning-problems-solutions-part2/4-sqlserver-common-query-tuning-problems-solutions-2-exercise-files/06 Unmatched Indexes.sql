USE [AdventureWorksDW2012];
GO

CREATE INDEX [fi_PromotionKey_by_CurrencyKey]
ON [dbo].[FactInternetSales] ([PromotionKey])
WHERE [CurrencyKey] = 6;
GO

-- Include the actual execution plan
-- Any warning in the plan?
DECLARE @CurrencyKey INT = 6;

SELECT DISTINCT
        [FactInternetSales].[PromotionKey]
FROM    [dbo].[FactInternetSales]
WHERE   [FactInternetSales].[CurrencyKey] = @CurrencyKey;
GO

-- Stored procedure match?
CREATE PROCEDURE [dbo].[FIS_by_CurrencyKey] @CurrencyKey INT
AS
    SELECT DISTINCT
            [FactInternetSales].[PromotionKey]
    FROM    [dbo].[FactInternetSales]
    WHERE   [FactInternetSales].[CurrencyKey] = @CurrencyKey;
GO

EXEC [dbo].[FIS_by_CurrencyKey] 6;
GO

-- What about this?
CREATE PROCEDURE [dbo].[FIS_by_CurrencyKey_v2] @CurrencyKey INT
AS
    SELECT DISTINCT
            [FactInternetSales].[PromotionKey]
    FROM    [dbo].[FactInternetSales]
    WHERE   [FactInternetSales].[CurrencyKey] = @CurrencyKey
	OPTION (RECOMPILE);
GO

EXEC [dbo].[FIS_by_CurrencyKey_v2] 6;
GO


-- Cleanup
DROP INDEX [fi_PromotionKey_by_CurrencyKey]
ON [dbo].[FactInternetSales];
GO

DROP PROCEDURE [dbo].[FIS_by_CurrencyKey];
GO

DROP PROCEDURE [dbo].[FIS_by_CurrencyKey_v2];
GO
