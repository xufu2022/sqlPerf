-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 2
-- Module: Special Considerations
--   Demo: Recompile is Required
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- First, you'll need to restore / setup the credit database
--   Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
--	 Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup  
-- Open Script: CreditDemoDatabaseSetup.sql
-- Execute your modified version of this script

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- Accessing a filtered index from within a stored procedure
-- might seem straightforward but it's not quite that
-- simple!
-- We'll look at parameters, literals, and variables. 

USE [Credit];
GO

ALTER TABLE [dbo].[Charge]
ADD [Status] tinyint NULL;
GO

UPDATE [dbo].[Charge]
SET [Status] = 0;
GO

ALTER TABLE [dbo].[Charge]
ALTER COLUMN [Status] tinyint NOT NULL;
GO

UPDATE [dbo].[Charge]
SET [Status] = 1
WHERE [Charge_no] > 1900000 AND [Charge_no] % 37 = 0; 
GO
-- 2703 rows out of 1.6 million
-- SELECT 2703/1600000.00 (less than 1%)
-- SELECT 1600000.00/2703 (1 in ~592)

UPDATE [dbo].[Charge]
SET [Status] = 2
WHERE [Charge_no] % 17 = 0; 
GO
-- 94118 rows out of 1.6 million
-- SELECT 94118/1600000.00 (less than 6%)
-- SELECT 1600000.00/94118 (1 in ~17)


-- What if we often want to select ONLY "active"
-- rows. And, what if we're interested in
-- a relatively wide combination of columns...
-- Covering is expensive when we have to cover
-- the entire table. What if we have to cover 
-- less than 1% of the table?

SET STATISTICS IO ON;
-- Also, turn on Showplan (Query / Include Actual Execution Plan)
GO

SELECT [c].[charge_no]
    , [c].[charge_dt]
    , [c].[charge_amt]
FROM [dbo].[charge] AS [c]
WHERE [c].[status] = 1 -- clustered index scan
ORDER BY [c].[charge_dt];
GO

-- Create a filtered index
CREATE NONCLUSTERED INDEX [ChargeActiveFI] 
ON [dbo].[Charge] ([charge_dt])  
INCLUDE ([charge_no], [charge_amt])
WHERE [status] = 1;
GO

-- Check the query plan for adhoc queries

SELECT [c].[charge_no]
    , [c].[charge_dt]
    , [c].[charge_amt]
FROM [dbo].[charge] AS [c]
WHERE [c].[status] = 1 -- index scan (covered)
ORDER BY [c].[charge_dt];
GO

SELECT [c].[charge_no]
    , [c].[charge_dt]
    , [c].[charge_amt]
FROM [dbo].[charge] AS [c]
WHERE [c].[status] = 1 -- index seek (and covered)
    AND [c].[charge_dt] > '19991013'
ORDER BY [c].[charge_dt];
GO

--------------------------------------------
-- What about a stored procedure:
--------------------------------------------
IF OBJECT_ID('[dbo].[GetActiveRows]') IS NOT NULL
    DROP PROCEDURE [dbo].[GetActiveRows];
GO

CREATE PROCEDURE [dbo].[GetActiveRows] 
    (  @status    tinyint
     , @mindate   datetime = '19000101') 
AS
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c]
    WHERE [c].[status] = @status
        AND [c].[charge_dt] > @mindate
    ORDER BY [c].[charge_dt];
END;
GO

EXECUTE [dbo].[GetActiveRows] 1;
EXECUTE [dbo].[GetActiveRows] 1, '19991013';
EXECUTE [dbo].[GetActiveRows] 2, '19991013';
GO

-- NONE of them use the filtered index!

--------------------------------------------
-- What about EXECUTE with RECOMPILE??
--------------------------------------------
EXECUTE [dbo].[GetActiveRows] 1 WITH RECOMPILE;
EXECUTE [dbo].[GetActiveRows] 1, '19991013' WITH RECOMPILE;
EXECUTE [dbo].[GetActiveRows] 2, '19991013' WITH RECOMPILE;
GO

-- Nope, NONE of them use the filtered index!


--------------------------------------------
-- What about CREATE with RECOMPILE??
--------------------------------------------
ALTER PROCEDURE [dbo].[GetActiveRows] 
    (  @status    tinyint
     , @mindate   datetime = '19000101') 
WITH RECOMPILE
AS
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] 
    WHERE [c].[status] = @status 
        AND [c].[charge_dt] > @mindate
    ORDER BY [c].[charge_dt];
END;
GO

EXECUTE [dbo].[GetActiveRows] 1;
EXECUTE [dbo].[GetActiveRows] 1, '19991013';
EXECUTE [dbo].[GetActiveRows] 2, '19991013';
GO

-- NONE of them use the filtered index!


--------------------------------------------
-- What about forcing the index:
--------------------------------------------
ALTER PROCEDURE [dbo].[GetActiveRows] 
    (  @status    tinyint
     , @mindate   datetime = '19000101') 
AS
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] WITH (INDEX ([ChargeActiveFI]))
    WHERE [c].[status] = @status 
        AND [c].[charge_dt] > @mindate
    ORDER BY [c].[charge_dt];
END;
GO

EXECUTE [dbo].[GetActiveRows] 1;
EXECUTE [dbo].[GetActiveRows] 1, '19991013';
EXECUTE [dbo].[GetActiveRows] 2, '19991013';
GO


--------------------------------------------
-- What about OPTION RECOMPILE??
--------------------------------------------
-- NOTE: There are some RTM versions of SQL
-- Server where this doesn't work. Be sure
-- that you're running the latest SP. 

ALTER PROCEDURE [dbo].[GetActiveRows] 
    (  @status    tinyint
     , @mindate   datetime = '19000101') 
AS
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] 
    WHERE [c].[status] = @status 
        AND [c].[charge_dt] > @mindate
    ORDER BY [c].[charge_dt]   
    OPTION (RECOMPILE);
END;
GO

EXECUTE [dbo].[GetActiveRows] 1;
EXECUTE [dbo].[GetActiveRows] 1, '19991013';
EXECUTE [dbo].[GetActiveRows] 2, '19991013';
GO


--------------------------------------------
-- What if the filtered index would be 
-- accessed by a literal (and not a parameter)
--
-- Here SQL Server CAN use the FI
--------------------------------------------
ALTER PROCEDURE [dbo].[GetActiveRows] 
    ( @mindate   datetime = '19000101') 
AS
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] 
    WHERE [c].[status] = 1 -- LITERAL
        AND [c].[charge_dt] > @mindate
    ORDER BY [c].[charge_dt];   
END;
GO

EXECUTE [dbo].[GetActiveRows] ; -- Default parameter value
EXECUTE [dbo].[GetActiveRows] '19991013';
GO

-- If the index were date-based and you
-- had a minimum (with a filter) but often
-- wanted values greater than that value
-- but with an input value you could
-- get the FI to work with a literal:

-- Create a filtered index
CREATE NONCLUSTERED INDEX [ChargeLastDayFI] 
ON [dbo].[Charge] ([charge_dt])  
INCLUDE ([charge_no], [charge_amt])
WHERE [charge_dt] > '19991013';  -- 14144 rows
GO
-- 14144 rows out of 1.6 million
-- SELECT 14144/1600000.00 (less than 1%)
-- SELECT 1600000.00/14144 (1 in ~113)


CREATE PROCEDURE [dbo].[GetLastDay] 
    (@mindate datetime)
AS
SET NOCOUNT ON
BEGIN
IF @mindate > '19991013'
    BEGIN
	    SELECT [c].[charge_no]
            , [c].[charge_dt]
            , [c].[charge_amt]
        FROM [dbo].[charge] AS [c] 
        WHERE [c].[charge_dt] > @mindate
            AND [c].[charge_dt] > '19991013'
        ORDER BY [c].[charge_dt]; 
    END;
ELSE
	BEGIN
	    SELECT [c].[charge_no]
            , [c].[charge_dt]
            , [c].[charge_amt]
        FROM [dbo].[charge] AS [c] 
        WHERE [c].[charge_dt] > @mindate
        ORDER BY [c].[charge_dt];
    END;
END;
GO

EXECUTE [dbo].[GetLastDay] '19991013 10:00:00';
EXECUTE [dbo].[GetLastDay] '19991013 10:50:00';
EXECUTE [dbo].[GetLastDay] '19980101';
GO


--------------------------------------------
-- What if the date or status were to be 
-- accessed by a variable (and not a parameter)
--
-- Then, the value would be UNKNOWN... 
-- Again, in an SP SQL Server CANNOT use 
-- the filtered index!

-- Unless OPTION (RECOMPILE) is used
--------------------------------------------
ALTER PROCEDURE [dbo].[GetLastDay]
    (@mindate datetime)
AS
DECLARE @FIdate   datetime = '19991013';
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] 
    WHERE [c].[charge_dt] > @mindate
        AND [c].[charge_dt] > @FIdate
    ORDER BY [c].[charge_dt];   
END;
GO

EXECUTE [dbo].[GetLastDay] '19991013 10:00:00';
EXECUTE [dbo].[GetLastDay] '19991013 10:50:00';
GO

ALTER PROCEDURE [dbo].[GetLastDay]
    (@mindate datetime)
AS
DECLARE @FIdate   datetime = '19991013'
BEGIN
    SELECT [c].[charge_no]
        , [c].[charge_dt]
        , [c].[charge_amt]
    FROM [dbo].[charge] AS [c] 
    WHERE [c].[charge_dt] > @mindate
        AND [c].[charge_dt] > @FIdate
    ORDER BY [c].[charge_dt]   
    OPTION (RECOMPILE);
    -- But, now we have to recompile every time
    -- for this case, it's better to hardcode 
    -- (of course) But, NOT always possible!
END;
GO

EXECUTE [dbo].[GetLastDay] '19991013 10:00:00';
EXECUTE [dbo].[GetLastDay] '19991013 10:50:00';
GO