USE [Credit];
GO

-- Creating a multi-statement table-valued function
CREATE FUNCTION [dbo].[udf_ms_charge_amt] ( @member_no INT )
RETURNS @charge TABLE
    (
      [charge_no] INT NOT NULL ,
      [charge_dt] DATETIME NOT NULL ,
      [charge_amt] MONEY NOT NULL
    )
AS
    BEGIN
        INSERT  @charge
                SELECT  TOP 100000
						[charge_no], [charge_dt], [charge_amt]
                FROM    [dbo].[charge]
                WHERE   [member_no] = @member_no
				ORDER BY [charge_no]
        RETURN
    END;
GO

-- Which query is "more costly"?
SELECT  [m].[firstname], [m].[lastname], [c].[charge_no], [c].[charge_dt],
        MAX([c].[charge_amt]) max_amount
FROM    [dbo].[member] AS [m]
        INNER JOIN [dbo].[charge] AS [c] ON [m].[member_no] = [c].[member_no]
WHERE   [c].[charge_amt] > 1000.00
        AND [m].[region_no] = 2
GROUP BY [m].[firstname], [m].[lastname], [c].[charge_no], [c].[charge_dt];
GO

SELECT  TOP 10 [m].[firstname], [m].[lastname], [c].[charge_no], 
		[c].[charge_dt], MAX([c].[charge_amt]) max_amount
FROM    [dbo].[member] AS [m]
        CROSS APPLY [dbo].[udf_ms_charge_amt]([m].[member_no]) AS [c]
WHERE   [c].[charge_amt] > 1000.00
        AND [m].[region_no] = 2
GROUP BY [m].[firstname], [m].[lastname], [c].[charge_no], [c].[charge_dt];