USE [Credit];
GO

-- Pushed, non-sargable predicates
SELECT  [charge_no] ,
        [charge_amt]
FROM    [dbo].[charge]
WHERE   [charge_amt] > 3500.00
ORDER BY [charge_no] ASC
OPTION  ( RECOMPILE, MAXDOP 1 );

-- Subtree cost 8.65365

-- And with the filter?
SELECT  [charge_no] ,
        [charge_amt]
FROM    [dbo].[charge]
WHERE   [charge_amt] > 3500.00
ORDER BY [charge_no] ASC
OPTION  ( RECOMPILE, MAXDOP 1,
 QUERYTRACEON 9130); -- Undocumented TF

-- Subtree cost 9.42165 (vs. 8.65365)