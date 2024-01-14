-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Estimates and Selectivity
--   Demo: Reading the histogram
-----------------------------------------------------------------

-- First, run the Sample Database Setup script for Credit
-- Script: CreditDemoDatabaseSetup.sql

USE [Credit];
GO

----------------------------------
-- Demo: Reading the histogram
----------------------------------

-- Quick/general way to see index list
EXEC [sp_helpindex] N'dbo.member';
GO

----------------------------------
-- Reviewing another histogram
----------------------------------

DBCC SHOW_STATISTICS (N'member', N'member_corporation_link')
WITH HISTOGRAM;
GO

SELECT [m].[corp_no], COUNT(*)
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] BETWEEN 71 AND 78
GROUP BY [m].[corp_no]
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] = 403;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] = 404;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] = 405;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] = 406;
GO

SELECT [m].* 
FROM [dbo].[member] AS [m]
WHERE [m].[corp_no] = 407;
GO
