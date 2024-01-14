USE [Credit];
GO

CREATE FUNCTION [dbo].[TotalChargeByMember] 
( @member_no INT )
RETURNS MONEY
AS
    BEGIN
        DECLARE @TotalChargeAmt MONEY;

        SELECT  @TotalChargeAmt = SUM([charge_amt])
        FROM    [dbo].[charge]
        WHERE   [charge].[member_no] = @member_no;

        RETURN @TotalChargeAmt;
    END
GO

-- Show Estimated and then Actual Execution plan
SET STATISTICS TIME ON;

SELECT TOP 500
        [c].[charge_no] ,
        [c].[member_no] ,
        [dbo].[TotalChargeByMember]([c].[member_no]) 
			AS [TotalChargeByMember]
FROM    [dbo].[charge] AS [c]
ORDER BY [c].[member_no] ,
        [c].[charge_no];

-- Show Estimated and then Actual Execution plan
SELECT TOP 500
        [c].[charge_no] ,
        [c].[member_no] ,
        SUM([c].[charge_amt]) 
		OVER ( PARTITION BY [c].[member_no] ) 
			AS [TotalChargeByMember]
FROM    [dbo].[charge] AS [c]
ORDER BY [c].[member_no] ,
        [c].[charge_no];

SET STATISTICS TIME OFF;

-- Cleanup
DROP FUNCTION [dbo].[TotalChargeByMember];
GO
