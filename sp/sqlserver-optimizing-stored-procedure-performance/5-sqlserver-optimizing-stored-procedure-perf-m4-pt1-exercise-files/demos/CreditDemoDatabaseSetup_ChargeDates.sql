-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Credit Sample Database Setup Dates for Charges
-----------------------------------------------------------------------

USE [Credit];
GO

-- Remove the indexes not needed for this demo
DROP INDEX [dbo].[charge].[charge_category_link];
DROP INDEX [dbo].[charge].[charge_provider_link];
DROP INDEX [dbo].[charge].[charge_statement_link];
GO

-- Alter the schema to create the right scenario for the 
-- date-range example
ALTER TABLE [dbo].[charge]
	DROP CONSTRAINT [ChargePK];
GO

-- Create a new column for charge numbers that will tie
-- directly to the dates.
ALTER TABLE [dbo].[charge]
	ADD [ChargeNo] INT NULL;
GO

-- There are some strange gaps in the original charge_no
-- values. This will make them ever-increasing (without
-- gaps) and a bit more realistic with the date changes.

-- Also, this will create a bunch of sales all within
-- the beginning of 2014 
WITH [UpdateCharge]
AS
(SELECT [c].[charge_no]
	, ROW_NUMBER () OVER 
        ( ORDER BY [c].[charge_no] ) AS [NewChargeNo]
FROM [dbo].[charge] AS [c])

UPDATE [dbo].[charge]
	SET [ChargeNo] = [uc].[NewChargeNo]
		, [charge_dt] =	DATEADD (ms
                        , DATEPART(ms, GETDATE())
                        , CONVERT(DATETIME
                            , DATEADD(mi
                                , [uc].[NewChargeNo]
                                , '20140101')) ) 
FROM [UpdateCharge] AS [uc]
	JOIN [dbo].[Charge] AS [c]
		ON [uc].[charge_no] = [c].[charge_no];
GO

-- Now, we can remove the old charge number column.
ALTER TABLE [dbo].[charge]
	DROP COLUMN [Charge_no];
GO

-- Next, we'll make it NOT allow NULLs so that we can
-- make it the primary key. 
ALTER TABLE [dbo].[charge]
ALTER COLUMN [ChargeNo] INT	NOT NULL;
GO

-- Make the new ChargeNo the Primary Key
ALTER TABLE [dbo].[charge]
ADD CONSTRAINT [ChargePK]
	PRIMARY KEY CLUSTERED (ChargeNo);
GO

-- Add an index for date-related queries
CREATE INDEX ChargeDate 
    ON [dbo].[charge](Charge_dt);
GO

-- NOTE: this might not be the BEST index for a lot of 
-- date-related queries because they are range-based. Be
-- sure to check out the later demo for a better 
-- understanding of some alternate choices for date-related
-- queries and tables.
--
-- Ideally, watch all of the demos / content - in ORDER. But,
-- if you just want to go to the demo related to indexing for
-- date-related queries, see:
--
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Optimization and Recompilation
--   Demo: Stabilizing plans with indexes (Covering)