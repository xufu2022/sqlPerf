USE [Credit];
GO

-- Estimated graphical showplan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 23.99;

-- Actual graphical showplan
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 23.99;

-- Don't forget to turn off Include Actual Execution Plan
-- SET STATISTICS XML ON
SET STATISTICS XML ON;

SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 23.99;

SET STATISTICS XML OFF;

-- SET STATISTICS PROFILE ON
SET STATISTICS PROFILE ON;

SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 23.99;

SET STATISTICS PROFILE OFF;

-- SQL Sentry Plan Explorer
SELECT [charge_no]
FROM [dbo].[charge]
WHERE [charge_amt] = 23.99;