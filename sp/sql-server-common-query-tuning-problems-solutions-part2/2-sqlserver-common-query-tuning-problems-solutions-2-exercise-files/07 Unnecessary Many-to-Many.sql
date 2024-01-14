USE [Credit];
GO

-- Create two new tables
SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
INTO    [dbo].[charge_x]
FROM    [dbo].[charge] AS [c];

SELECT  [charge_no] ,
        [member_no] ,
        [provider_no] ,
        [category_no] ,
        [charge_dt] ,
        [charge_amt] ,
        [statement_no] ,
        [charge_code]
INTO    [dbo].[charge_y]
FROM    [dbo].[charge] AS [c];

-- Create supporting indexes
CREATE CLUSTERED INDEX [charge_x_charge_no] ON 
[charge_x]([charge_no]);
GO

CREATE CLUSTERED INDEX [charge_y_charge_no] ON 
[charge_y]([charge_no]);
GO

-- Include Actual Execution Plan
SET STATISTICS IO ON;

SELECT TOP 100000
        [x].[category_no] ,
        [y].[category_no] ,
        [x].[member_no] ,
        [y].[provider_no]
FROM    [dbo].[charge_x] AS [x]
INNER JOIN [dbo].[charge_y] AS [y]
ON      [x].[charge_no] = [y].[charge_no];

SET STATISTICS IO OFF;

-- If you know it is UNIQUE, why not make it UNIQUE?
CREATE UNIQUE CLUSTERED INDEX [charge_x_charge_no] ON 
[charge_x]([charge_no])
WITH (DROP_EXISTING = ON);
GO

CREATE UNIQUE CLUSTERED INDEX [charge_y_charge_no] ON 
[charge_y]([charge_no])
WITH (DROP_EXISTING = ON);
GO

-- Include Actual Execution Plan
SET STATISTICS IO ON;

SELECT TOP 100000
        [x].[category_no] ,
        [y].[category_no] ,
        [x].[member_no] ,
        [y].[provider_no]
FROM    [dbo].[charge_x] AS [x]
INNER JOIN [dbo].[charge_y] AS [y]
ON      [x].[charge_no] = [y].[charge_no];

SET STATISTICS IO OFF;

-- Any worktables?
-- Memory grant sizes?

-- Cleanup
IF OBJECT_ID(N'charge_x') > 0
    BEGIN
        DROP TABLE [dbo].[charge_x];
    END

IF OBJECT_ID(N'charge_y') > 0
    BEGIN
        DROP TABLE [dbo].[charge_y];
    END

