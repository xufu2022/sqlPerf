USE [Credit];
GO

CREATE FUNCTION [dbo].[PrepaymentDiscount] 
( @charge_amt MONEY )
RETURNS MONEY
AS
    BEGIN
        DECLARE @late_charge MONEY = @charge_amt * 0.10;

        RETURN @late_charge;
    END
GO

-- Execute the following two SELECT queries
-- Include Actual Execution plan
-- Any differences?
SELECT  [c].[charge_no] ,
        [c].[charge_amt] ,
        [c].[statement_no] ,
        [dbo].[PrepaymentDiscount]([c].[charge_amt]) 
			AS [PrepaymentDiscount]
FROM    [dbo].[charge] AS [c]
INNER JOIN [dbo].[member] AS [m]
ON      [c].[member_no] = [m].[member_no]
INNER JOIN [dbo].[payment] AS [p]
ON      [p].[member_no] = [m].[member_no]
        AND [p].[statement_no] = [c].[statement_no]
WHERE   [p].[payment_dt] < [c].[charge_dt]
ORDER BY [c].[charge_no];

SELECT  [c].[charge_no] ,
        [c].[charge_amt] ,
        [c].[statement_no] ,
        ( [c].[charge_amt] * 0.10 ) AS [PrepaymentDiscount]
FROM    [dbo].[charge] AS [c]
INNER JOIN [dbo].[member] AS [m]
ON      [c].[member_no] = [m].[member_no]
INNER JOIN [dbo].[payment] AS [p]
ON      [p].[member_no] = [m].[member_no]
        AND [p].[statement_no] = [c].[statement_no]
WHERE   [p].[payment_dt] < [c].[charge_dt]
ORDER BY [c].[charge_no];


-- Cleanup
DROP FUNCTION [dbo].[PrepaymentDiscount];
GO
