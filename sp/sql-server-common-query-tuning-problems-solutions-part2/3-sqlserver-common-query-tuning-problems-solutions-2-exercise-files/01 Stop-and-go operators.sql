USE [Credit];
GO

-- Include actual execution plan
-- What is the memory grant size?
SELECT
    [m].[member_no] ,
    [m].[lastname] ,
    [p].[payment_no] ,
    [p].[payment_dt] ,
    [p].[payment_amt]
FROM [dbo].[member] AS [m]
INNER JOIN [dbo].[payment] AS [p]
ON  [m].[member_no] = [p].[member_no];

-- After adding FAST hint?
SELECT
    [m].[member_no] ,
    [m].[lastname] ,
    [p].[payment_no] ,
    [p].[payment_dt] ,
    [p].[payment_amt]
FROM [dbo].[member] AS [m]
INNER JOIN [dbo].[payment] AS [p]
ON  [m].[member_no] = [p].[member_no]
OPTION ( FAST 1 );

-- Stop-and-go operation examples:
	-- Sorts
	-- Hash operations
	-- Eager spools

-- Non-hint resolution?
CREATE NONCLUSTERED INDEX [IX_payment]
ON [dbo].[payment]
([member_no])
INCLUDE
( [payment_no] , [payment_dt] ,
[payment_amt] );
GO

-- And now?
-- Include actual execution plan
-- What is the memory grant size?
SELECT
    [m].[member_no] ,
    [m].[lastname] ,
    [p].[payment_no] ,
    [p].[payment_dt] ,
    [p].[payment_amt]
FROM [dbo].[member] AS [m]
INNER JOIN [dbo].[payment] AS [p]
ON  [m].[member_no] = [p].[member_no];

-- Cleanup
DROP INDEX  [dbo].[payment].[IX_payment];
GO
