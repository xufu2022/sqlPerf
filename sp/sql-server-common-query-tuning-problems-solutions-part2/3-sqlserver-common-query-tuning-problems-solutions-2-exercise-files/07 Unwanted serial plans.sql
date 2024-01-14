USE [AdventureWorksDW2012];
GO

-- For DSS workloads, parallelism is often helpful
-- for queries that access large result-sets

-- Let's create a new scalar user-defined function
CREATE FUNCTION [dbo].[udfBuildDate]
    (
      @year INT ,
      @month INT ,
      @day INT
    )
RETURNS DATETIME
AS
    BEGIN
        RETURN CAST(CONVERT(VARCHAR, @year) + '-' +
			CONVERT(VARCHAR, @month) 
	    + '-' + CONVERT(VARCHAR, @day) 
	    AS DATETIME);
    END

GO

-- What happens if you get a serial plan when parallel is
-- expected?
-- Include actual execution plan and let it run for a few seconds
-- (and then look at the estimated execution plan)
SELECT TOP 5
        [dbo].[udfBuildDate]([d].[FiscalYear],
			[d].[MonthNumberOfYear],
			[d].[DayNumberOfMonth]) AS [ISO_Date] ,
        AVG([f].[SalesAmount]) AS [AvgSalesAmount] ,
        SUM([f].[SalesAmount]) AS [TotalSalesAmount]
FROM    [dbo].[FactInternetSales] AS [f]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [f].[ProductKey] = [p].[ProductKey]
INNER JOIN [dbo].[DimDate] AS [d]
ON      [f].[ShipDateKey] = [d].[DateKey]
WHERE   [p].[Size] IS NOT NULL
        AND [f].[UnitPriceDiscountPct] = 0
GROUP BY [dbo].[udfBuildDate]([d].[FiscalYear],
	[d].[MonthNumberOfYear], [d].[DayNumberOfMonth])
ORDER BY [dbo].[udfBuildDate]([d].[FiscalYear],
	[d].[MonthNumberOfYear], [d].[DayNumberOfMonth]);
GO

-- Questions to ask:
-- What is the max degree of parallelism?
-- What is the cost threshold for parallelism?
-- Any MAXDOP hints?
-- Resource governor usage?

-- Without the function?
-- Include actual execution plan
SELECT TOP 5
        CAST(CONVERT(VARCHAR, [d].[FiscalYear]) + '-'
        + CONVERT(VARCHAR, [d].[MonthNumberOfYear]) + '-'
        + CONVERT(VARCHAR, [d].[DayNumberOfMonth])
			AS DATETIME) AS [ISO_Date] ,
        AVG([f].[SalesAmount]) AS [AvgSalesAmount] ,
        SUM([f].[SalesAmount]) AS [TotalSalesAmount]
FROM    [dbo].[FactInternetSales] AS [f]
INNER JOIN [dbo].[DimProduct] AS [p]
ON      [f].[ProductKey] = [p].[ProductKey]
INNER JOIN [dbo].[DimDate] AS [d]
ON      [f].[ShipDateKey] = [d].[DateKey]
WHERE   [p].[Size] IS NOT NULL
        AND [f].[UnitPriceDiscountPct] = 0
GROUP BY CAST(CONVERT(VARCHAR, [d].[FiscalYear]) + '-'
        + CONVERT(VARCHAR, [d].[MonthNumberOfYear]) + '-'
        + CONVERT(VARCHAR, [d].[DayNumberOfMonth]) AS DATETIME)
ORDER BY CAST(CONVERT(VARCHAR, [d].[FiscalYear]) + '-'
        + CONVERT(VARCHAR, [d].[MonthNumberOfYear]) + '-'
        + CONVERT(VARCHAR, [d].[DayNumberOfMonth]) AS DATETIME);
GO

-- A few common areas to watch for:
--  (For the full list, see Craig Freedman's SQL Server Blog:
--  http://bit.ly/1kJgi8Z) 
--	T-SQL user-defined functions
--  Multi-statement table-valued functions
--  CLR user-defined functions with data access
--  Dynamic cursors

-- Cleanup
DROP FUNCTION [dbo].[udfBuildDate];
GO

