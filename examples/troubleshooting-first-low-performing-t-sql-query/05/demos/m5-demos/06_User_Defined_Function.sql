USE [WiredBrainCoffee];
GO



CREATE OR ALTER FUNCTION [Sales].[udf_Get_Commission] (@Amount DECIMAL(36,2))
RETURNS DECIMAL(36, 2)
AS
BEGIN	
		DECLARE @Output DECIMAL(36, 2);
		SET @Output = (@Amount*.025);
		RETURN @Output;
END
GO


-- Let's check what compatibility level our database is at.
SELECT [name] AS [DatabaseName],
	[compatibility_level]
FROM [sys].[databases]
WHERE [name] = 'WiredBrainCoffee';


-- This command changes the compatibility to 2017.
ALTER DATABASE [WiredBrainCoffee]
SET COMPATIBILITY_LEVEL = 140;
GO




SET STATISTICS IO,
	TIME ON;

SELECT so.[SalesDate],
	so.[SalesAmount],
	CAST(so.[SalesAmount] * .025 AS DECIMAL(36,2)) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[SalesDate] >= '1/1/2022'
	AND so.[SalesDate] <= '12/31/2022'
ORDER BY so.[SalesAmount] DESC;

SELECT so.[SalesDate],
	so.[SalesAmount],
	[Sales].[udf_Get_Commission](so.SalesAmount) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[SalesDate] >= '1/1/2022'
	AND so.[SalesDate] <= '12/31/2022'
ORDER BY so.[SalesAmount] DESC;

SET STATISTICS IO,
	TIME OFF;
GO



-- Let's check how many times the function was executed.
SELECT OBJECT_NAME(fs.[object_id]) AS [FunctionName],
	fs.[Execution_Count],
	fs.[total_elapsed_time]
FROM [sys].[dm_exec_function_stats] fs
WHERE OBJECT_NAME([object_id]) IS NOT NULL;




-- Is the performance still impacted with a smaller dataset?
SET STATISTICS IO,
	TIME ON;

SELECT so.[SalesDate],
	so.[SalesAmount],
	CAST(so.[SalesAmount] * .025 AS DECIMAL(36,2)) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[Id] < 10001;

SELECT so.[SalesDate],
	so.[SalesAmount],
	[Sales].[udf_Get_Commission](so.SalesAmount) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[Id] < 10001;

SET STATISTICS IO,
	TIME OFF;
GO



-- This command changes the compatibility to 2019.
ALTER DATABASE [WiredBrainCoffee]
SET COMPATIBILITY_LEVEL = 150;



SET STATISTICS IO,
	TIME ON;

SELECT so.[SalesDate],
	so.[SalesAmount],
	CAST(so.[SalesAmount] * .025 AS DECIMAL(36,2)) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[SalesDate] >= '1/1/2022'
	AND so.[SalesDate] <= '12/31/2022'
ORDER BY so.[SalesAmount] DESC;

SELECT so.[SalesDate],
	so.[SalesAmount],
	[Sales].[udf_Get_Commission](so.SalesAmount) AS [Commission]
FROM [Sales].[SalesOrder] so
WHERE so.[SalesDate] >= '1/1/2022'
	AND so.[SalesDate] <= '12/31/2022'
ORDER BY so.[SalesAmount] DESC;

SET STATISTICS IO,
	TIME OFF;
GO





-- Please check out this informative Microsoft article on scalar udf inlining.
-- https://learn.microsoft.com/en-us/archive/blogs/sqlserverstorageengine/introducing-scalar-udf-inlining