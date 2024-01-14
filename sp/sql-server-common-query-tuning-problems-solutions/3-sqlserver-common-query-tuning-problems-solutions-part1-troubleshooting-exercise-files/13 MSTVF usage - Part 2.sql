-- Now let's see the behavior with the new CE
USE [master];
GO
ALTER DATABASE [Credit] SET COMPATIBILITY_LEVEL = 120;
GO

-- Estimate in SQL Server 2014, model 120?
USE [Credit];
GO

-- New estimate?
SELECT  TOP 10 [m].[firstname], [m].[lastname], [c].[charge_no], 
		[c].[charge_dt], MAX([c].[charge_amt]) max_amount
FROM    [dbo].[member] AS [m]
        CROSS APPLY [dbo].[udf_ms_charge_amt]([m].[member_no]) AS [c]
WHERE   [c].[charge_amt] > 1000.00
        AND [m].[region_no] = 2
GROUP BY [m].[firstname], [m].[lastname], [c].[charge_no], [c].[charge_dt];