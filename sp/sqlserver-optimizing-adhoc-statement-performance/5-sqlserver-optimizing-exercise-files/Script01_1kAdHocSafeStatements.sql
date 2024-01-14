-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Script 1000 Safe ad hoc statements
-----------------------------------------------------------------

--------------------------------------
-- IMPORTANT NOTES 
--------------------------------------
-- This should only be run as part of
-- the CMD files. If you run this in
-- SSMS you'll run out of memory from
-- too many results grids.

-- If you want to test/play with this
-- in SSMS, be sure to switch to text
-- mode instead of grid mode.
-- 
-- For "Results to Text" mode
-- MENU: Query, Results To,
--       Results to Text (Ctrl + T)
----------------------------------

SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE [Credit];
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 200;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2140;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 708;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 636;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6099;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8201;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 136;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3609;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3456;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4409;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 117;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 974;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6119;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6297;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4668;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1069;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7426;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3082;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1774;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7049;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5277;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 734;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1348;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8725;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9632;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 320;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8658;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1796;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4789;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9276;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9600;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7508;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7364;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1224;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 86374;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 478;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7492;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2656;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9100;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7808;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6053;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5786;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7302;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 76973;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4477;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9070;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2075;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9445;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8916;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8216;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1524;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4802;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5524;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2281;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5523;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4207;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9251;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8881;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5733;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7127;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7732;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4589;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7292;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1879;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5699;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8368;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5085;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8264;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5090;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7699;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2126;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 364;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7874;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7117;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 90821;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 430;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1991;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8972;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2333;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9382;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3026;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5785;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3345;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7103;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1824;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7474;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6031;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2709;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 162;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5848;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4419;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9080;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4201;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8427;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3979;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1536;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3147;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7812;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5927;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6614;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2338;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7381;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2526;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8747;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8971;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4639;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3347;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9851;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1448;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1011;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1038;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5826;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9036;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8626;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4184;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7550;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1888;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8102;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4271;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1972;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9784;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1406;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2560;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8901;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 602;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4561;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3333;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3739;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9278;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8705;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7853;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7499;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 123;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2462;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 80002;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6661;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3665;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4153;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4250;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3257;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3918;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7626;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6002;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5469;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4602;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 447;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9596;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3317;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9986;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9734;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5198;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4204;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2465;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7540;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9867;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4791;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1061;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5156;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7513;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5704;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3142;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7291;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2676;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8351;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2918;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5808;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6808;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9525;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8056;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5737;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 766;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9120;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7719;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7756;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8466;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 399517;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6154;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7956;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4792;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2321;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6007;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4256;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3492;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4970;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2426;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6081;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5671;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5179;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 897;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7628;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6287;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4710;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7516;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1264;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3289;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9064;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7158;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6830;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7198;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4690;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3409;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7274;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7729;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4337;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2932;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1897;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2825;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1480;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7126;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3672;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1755;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4521;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5452;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9364;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3900;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5711;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9119;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1947;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8142;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1078;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4103;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8630;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3503;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9826;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2211;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1727;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8452;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 972;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8532;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7552;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8587;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 97;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5138;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2025;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 75;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8949;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3927;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4537;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7357;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7583;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5394;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7185;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6902;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6340;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3729;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6858;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5089;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4691;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1109;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9316;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3230;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2184;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4411;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1840;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1726;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1021;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5799;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2273;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2895;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3460;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5941;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3797;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6937;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4286;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4504;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1771;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2310;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3380;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 410;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1534;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9447;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8603;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1993;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1212;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5741;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7649;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 683;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 45;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6553;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7241;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6773;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2192;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 437;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8389;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3832;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4954;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 610;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3915;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5767;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6236;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9716;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3540;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4322;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8861;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9816;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9675;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2777;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3025;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 832;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1449;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5482;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6102;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2040;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4998;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5475;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7858;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2860;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1082;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2864;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8601;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3515;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9075;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3337;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9804;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5291;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2589;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2400;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2295;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 86;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1685;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6375;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8999;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 270;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7725;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8140;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7217;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3394;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9160;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4366;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9162;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 663;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5613;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5553;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9814;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4142;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8409;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1198;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7633;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 422;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3135;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 467;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5877;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 645;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7980;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3406;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3200;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3859;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5301;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3808;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9674;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4617;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3659;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2664;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5691;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8440;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9438;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5086;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6178;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7923;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 785;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1893;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3810;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9228;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9981;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6339;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1257;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4254;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2337;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3556;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7166;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2445;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7766;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4058;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2575;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1666;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4293;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7692;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4838;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2215;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3648;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5214;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5182;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6149;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2091;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7355;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8874;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8988;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1923;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2583;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3062;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7854;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2936;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2838;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2054;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3708;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4072;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2197;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1969;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7966;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8222;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7746;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9580;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9260;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 705;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4090;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6389;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9968;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5275;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1782;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9515;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8158;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9293;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4575;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6060;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6597;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9573;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6260;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7632;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4696;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2237;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1005;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1860;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5977;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2324;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9636;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5844;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7898;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6324;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6976;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8878;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1033;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2002;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8174;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3146;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1246;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 665;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 929;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5860;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7329;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9841;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8021;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9917;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7596;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5578;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1535;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2131;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9964;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 686;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3136;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2893;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2905;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1743;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9510;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7053;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5780;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2020;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4513;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2937;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8578;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8386;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2717;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7123;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9932;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7296;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1455;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 528;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8679;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5791;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7343;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9430;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3341;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4916;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2277;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5592;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8347;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8171;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5478;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5703;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1310;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9950;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 519;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8870;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2623;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5527;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4997;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 413;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2355;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 163;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1540;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6590;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9879;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4325;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3169;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2756;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5377;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5678;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4540;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9102;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6449;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2178;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3561;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1259;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8429;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1674;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5931;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6665;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7903;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4176;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8001;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3634;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4759;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1314;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7609;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2255;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9427;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4972;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5087;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3489;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8671;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8841;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5141;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5484;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5083;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8576;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 717;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2823;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6442;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2504;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1617;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3592;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7523;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6961;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2875;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 634;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6896;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3621;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 52;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5500;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6307;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4351;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5751;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8942;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8665;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4012;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1735;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9292;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1633;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7380;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1614;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2440;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6905;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8516;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2615;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1753;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7466;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 709;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8012;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3576;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6360;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3229;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9253;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4858;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 237;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3728;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 461;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 299;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4944;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 559;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2304;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 749;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1515;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5858;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3877;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5812;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3702;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9207;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5100;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2125;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8908;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2004;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4449;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9424;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6834;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8281;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4393;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8798;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5356;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 388;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1640;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9808;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7572;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2008;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4592;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6950;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6762;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7071;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1513;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9491;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 438;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5723;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1675;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7641;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6417;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2347;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9346;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5167;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5798;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1549;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7003;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9494;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8923;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3358;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4908;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9222;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2243;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9099;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2767;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8127;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 132;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 565;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9150;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4239;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 630;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9977;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8703;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9256;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1690;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8230;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5835;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 85;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5314;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2685;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8929;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6703;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 87;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4662;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9113;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5863;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8771;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4525;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9133;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5777;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1000;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8274;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6435;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 286;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2345;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1597;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9054;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4311;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7109;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1527;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3128;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6123;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7422;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7446;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7306;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7112;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2198;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9974;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7736;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8297;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6666;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1812;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3524;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9245;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8189;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2222;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6430;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4011;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5577;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4425;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7149;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1458;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2344;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1854;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3174;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1475;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8672;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5313;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9569;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4767;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5037;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6749;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9024;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4038;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8063;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1361;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9151;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6317;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7862;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8483;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5144;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7940;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9137;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2187;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4702;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1568;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9301;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9366;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1008;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8985;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3363;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4056;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6285;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5834;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1612;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8369;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4338;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2780;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5013;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9790;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 964;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4298;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5411;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7273;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3753;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5567;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2482;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7988;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1695;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1998;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1275;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7347;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7464;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7782;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7524;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2572;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5021;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6870;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5531;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8768;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5294;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4440;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2186;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9754;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 805;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 922;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5130;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1949;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8198;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 179;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4161;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7395;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1453;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6649;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7834;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6284;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3430;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3203;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4363;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2028;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5232;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 993;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9626;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7142;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1684;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8712;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2815;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8986;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1881;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3757;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7936;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 513;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5421;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3405;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 644;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2635;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2244;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8780;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9286;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4530;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8192;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7089;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6347;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 269;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4085;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4108;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9474;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6211;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3763;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1585;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3987;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2114;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5091;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6584;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9408;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4235;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5168;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2675;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4959;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6548;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4345;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8737;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7312;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4065;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5581;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5995;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7132;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8091;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7650;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1195;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5827;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5958;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1716;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3449;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1733;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2569;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9998;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6535;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9566;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3027;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6519;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4416;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3414;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6286;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4655;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1068;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6261;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6622;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7840;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4582;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5947;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8156;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3431;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7668;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8541;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 747;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 828;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3425;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5039;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2138;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4183;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4427;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7730;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3060;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2691;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9048;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8366;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9479;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5997;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 783;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3438;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3624;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7547;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8043;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9182;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2977;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9680;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 22;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6539;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5606;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6136;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1004;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3816;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8742;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3526;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8992;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6978;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8989;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5871;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2795;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1956;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 830;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1638;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1526;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9204;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6433;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3217;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3657;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8335;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2826;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9289;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8589;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4370;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5600;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 864;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9440;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7472;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7342;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6167;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4473;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9598;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 591;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8716;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2118;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6376;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7009;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9071;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 541;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8654;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 46;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9380;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3173;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 499;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4839;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1882;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9305;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9324;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9743;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8853;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 343;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9210;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3755;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2669;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5521;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9216;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4181;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5640;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8889;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5487;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2670;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5937;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2693;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6121;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4722;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4943;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4730;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8794;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1407;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 218;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1323;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2336;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 473;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 690;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5874;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5164;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2755;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4770;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4168;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6691;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3669;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9023;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4977;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6259;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6009;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2703;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9537;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4060;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1728;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 129;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 216;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6638;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1025;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4966;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9095;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1354;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2452;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1550;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1342;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8627;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8750;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 592;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3465;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5805;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4095;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1930;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1988;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3754;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9275;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3375;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2890;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2559;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6299;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8836;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6579;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6545;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9203;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5355;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1290;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8898;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7370;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6923;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 6100;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4659;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5255;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 2608;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9013;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8468;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 175;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3369;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 326;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 758;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 9570;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 3969;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7433;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7425;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 8730;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5672;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5630;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 228;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7897;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 5881;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1201;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1832;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 7932;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 1428;
GO

SELECT 'Query 01', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[city], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[member_no] = 4749;
GO
