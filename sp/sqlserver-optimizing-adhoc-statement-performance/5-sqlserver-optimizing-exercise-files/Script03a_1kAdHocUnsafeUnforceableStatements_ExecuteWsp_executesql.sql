-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Script 1000 Unsafe
--		* These statements cannot be forced by
--        the database option FORCED
--      * Even with the right indexes, SQL
--        won't see these statements as safe...
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

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'KAHRM%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'FLORI%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'EFLIN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'MAKAI%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'VANN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'QUINT%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'XAVIE%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'PAYNT%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'TOLSK%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'JONES%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'ZUCKE%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'OLPHA%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'NELSO%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'UNAKL%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'STEIN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'LING%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'BARR%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'HAHN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'RYAN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'WOLFM%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'ANDER%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'GOHAN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'DORR%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'INFAN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'CHEN%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'YEONG%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bales%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Charn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dodd%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Glenn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hasty%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Moren%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Maxha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Park%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Whiti%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Agcao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Byrne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jacob%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Salah%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Schmi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Teper%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Beave%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gomez%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lique%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mehle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Naray%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shoop%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Walda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frede%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gates%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Burke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Canna%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Guzik%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'He%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Leone%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ramir%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zimpr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bucha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carmo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Contr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ecoff%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mohan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Truem%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tulla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nason%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Spenc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Whipp%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Banke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carey%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Grand%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Serve%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Verbo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zhao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Browq%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Harri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Luthr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mugha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vince%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carot%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Raman%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vrett%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Watso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Achon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hass%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Iyer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Voss%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Weber%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Blyth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Clear%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Creas%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Leste%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Los%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sacks%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Westg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cenci%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Keil%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Recto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Worla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Duffy%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Entin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Huff%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Medin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stanl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chow%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lopez%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lyon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Macra%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Salan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Newma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Albri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frisk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gupta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hodge%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Silva%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Slave%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bent%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lewis%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Schul%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hensi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Monte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Norma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rhode%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Svobo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Elson%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sun%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trole%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kaffe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McLin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sims%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Meyya%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Benso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Monro%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'So%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fakho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Patte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pinto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Espin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Slatt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Steel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Waxma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dockt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Finle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hoepf%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Style%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brian%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hill%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jarvi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Moham%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tench%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Van H%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yvkof%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Isla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'O''Del%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hagen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hohma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Spice%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tedfo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lazec%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Peder%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Weime%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Emory%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hall%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hollo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Keyse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'West%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Corie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Culbe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kurtz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gokte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Harui%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mcani%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yasi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alexa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gage%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Griff%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mille%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Costa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ellio%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Irwin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Murph%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Romer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Demps%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kotc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Laurs%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Loone%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Malme%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Valen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Basha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frank%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Liang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Watki%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Male%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ware%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Weado%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zheng%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barre%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chave%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Colli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Given%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vrins%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alame%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alpue%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'O''Har%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Patel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vance%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Banac%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Breer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hecto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hirot%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lepro%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Munso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Guo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pathe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Venug%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bhat%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kozlo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alvar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Samar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tippe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Demot%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ganio%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shea%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stahl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Suurs%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Calaf%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Curry%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Graff%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nath%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Culp%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Foste%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Simps%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vlass%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Duden%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bensh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Demic%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'MacDo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Naybe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Perko%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Scard%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tambu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chamb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chest%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Eminh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fort%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Palit%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pulip%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rowe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Song%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ziegl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bolen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sanch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sato%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Velez%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Conro%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dusza%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McCla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nilso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Riegl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Arthu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Munoz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tsofl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Youts%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barba%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Galvi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mares%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Margh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sreen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Berna%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Desai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frint%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kelle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Marco%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hay%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stadi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tangi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jorda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Watad%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zeman%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'James%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reams%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rizzi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Whitn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ashto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fatim%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hillm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hite%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mosch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Plays%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sanz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Baile%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Choin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cox%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hendr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kastn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Quint%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rosem%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ting%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yuhas%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Belso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brand%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Parki%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Valle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wille%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Delma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Erick%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Johns%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nartk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Seama%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Straa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bowma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Glimp%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kawai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McCor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Taft-%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Washi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pak%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Solan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zukow%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Beck%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gutie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McGur%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sande%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vong%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wheel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Xu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kelly%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Keste%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Krow%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reeve%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ray%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Spana%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Khann%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lewin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trame%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Verda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bourn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Greer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shock%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zugel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Piase%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Richm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yong%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cook%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hammo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Khan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mehta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tomic%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Doyle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Madan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Prasa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Faebe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Niswo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Okelb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Perry%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rovir%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kahn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ralls%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Blanc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gaffn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kurja%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McGui%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Traub%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yee%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rana%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rodma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Swan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Verno%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zhu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Javie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Whitw%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wilki%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lucer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Naik%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pourn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reinh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Suffi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Theis%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vickn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Altma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Berg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brigh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Balta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bowen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Getzi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Oviat%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cereg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Colvi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nicho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Posne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stewa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Glynn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Liu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Murra%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Taylo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zare%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bradl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brink%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carls%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fitzg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Flore%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fox%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lisbo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Morel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Veron%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bruno%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Caven%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Delan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Garde%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Selik%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Welck%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tiano%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Diaz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Olivo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Oveso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yonek%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cetin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Della%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Germa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hodgs%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shepe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Benne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hurta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tatma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zwill%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Heide%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stotk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Su%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bergl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Xylar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Black%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kobyl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ledya%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mendi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sandb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alber%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gash%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Morga%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ramos%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Word%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Beebe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hageg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Locke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yasin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Towns%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zhou%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chris%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Evans%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hende%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sharm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Heyms%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mober%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sulta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wilso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wood%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Campb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Danie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dixon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McSha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nara%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ready%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bacon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Holm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Iallo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pollo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Potts%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Westo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Willi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Camac%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pais%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sarai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tibbo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Warth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yukis%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Arifi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'DeGra%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gill%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rubio%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sands%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Avalo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bohli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lawre%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Retti%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Torre%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Burla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cheng%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gibso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Komos%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Marsh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Adina%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hagem%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hanki%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sarav%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Saund%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stane%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Suare%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Track%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vaca%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Walto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Conse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Khara%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Leavi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sam%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sawye%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Thoma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Acker%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bisho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ersan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Garza%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gubbe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wolf%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ye%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Debor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dunca%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Weism%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yuan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alder%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chapl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Haugh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Muñoz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Powel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Thaku%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Focht%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Katya%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Randa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tiedt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barzd%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jenki%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Prest%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Roger%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wold%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Arche%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cunni%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'D''sa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fried%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fulto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Meisn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nusba%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Colem%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kung%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shims%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Walke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hesse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Justi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Olgui%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Osada%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Penor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Calon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hardi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ihrig%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ruggi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sánch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bauer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Danse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Riens%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Villa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cobb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kwok%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Loh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stotl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Watte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Albur%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ferri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Golds%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lenge%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McArt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'North%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ortiz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reáte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Butle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Desal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Morri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Varga%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Yalov%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Flood%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kapoo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Poe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shaba%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Syama%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zubat%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bidel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Craci%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ingle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jiang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Richt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Canut%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Marti%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ngoh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Peopl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Perez%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Redin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Antri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Houst%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jones%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ruiz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hayes%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Agbon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Baldw%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chish%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Feng%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mart¡%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Okada%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Winte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Worde%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'De Ma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hensh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Holt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kenne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Maste%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sousa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Banks%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Buens%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Camer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gonza%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hoein%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hoffm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Matth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Maxwe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Thore%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mette%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Posti%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tran%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trave%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Welli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wrigh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zabok%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Flueg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Macag%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sabel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Aguil%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Henni%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Manek%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mitzn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sara%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Amlan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Clayt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mikso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zhang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brewe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Holma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Orona%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wisne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ansma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tuffi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Van%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vigil%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Abbas%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Berge%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brunn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bueno%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Haemo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hee%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nash%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pinks%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Altam%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Schle%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Arbel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bell%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brumm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Clark%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Corne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Haine%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Olive%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tejan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gronc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kovár%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Logan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rothe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Swear%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ajens%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Caro%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ward%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Appel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Leneh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lertp%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Valer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Weldo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Xie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Huang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Long%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Moore%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tian%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rahee%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rusko%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Danne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lesko%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lloyd%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Navar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pogul%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trau%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Walte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Nelso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Orteg%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pears%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Van E%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alcor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McAsk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Remmi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sloan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Waggo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brown%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Catal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Moell%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sandi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Burkh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lunda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rothk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ruth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Young%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Core%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Estes%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Meado%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stone%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cole%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Osbor%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Valde%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vazqu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ben-S%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Blant%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sotel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Anand%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Chesn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Coffm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Higgi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rails%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Westb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gilli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Highf%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ito%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stein%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Burto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'King%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Suri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bartn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Busta%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Campe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Choi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gray%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Howar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lugo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Purce%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rober%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ford%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Harte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mew%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Caves%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'D''Her%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Galla%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Herma%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Remic%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Baker%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bates%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Breme%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Klein%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Magen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Osori%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stene%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Berch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frazi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Salmr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dieve%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Edwar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hartw%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Laszl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Morco%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reyno%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wedge%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Li%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rodri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Schar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stran%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Albre%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Cabel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Caldw%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Deniu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dewer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Heane%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kiril%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mensa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Storj%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Camar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Decke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hows%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kane%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McKay%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Aberc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brook%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brumf%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Truji%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vonho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Graha%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jimén%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McPhe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sunka%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Phill%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Reed%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shake%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trent%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gibbe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pello%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vande%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wistr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Booth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Byham%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rockn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Short%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wickh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jaffe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lobao%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Peter%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Teal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bocke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Herri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kurni%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Netz%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Roy%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stamm%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Coret%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ayers%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Earls%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hughe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ross%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Toone%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barlo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Beasl%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Domin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frenc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Srini%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Suess%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ison%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Krapa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mayna%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lunt%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McCar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Raji%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rapie%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Silve%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bisch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Duff%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kearn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ault%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Leitã%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pompa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Steen%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Stern%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Colon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hucka%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Inghr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shepa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Verho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kovar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bills%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Krupk%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pette%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Troye%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Caval%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Manch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mosel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'O''Don%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Saddo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Swami%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bacal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Crow%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Groth%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kaliy%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lew%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mitch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'O''Bri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hunte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Porte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Simmo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Capri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gilbe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bosem%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Drury%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gehri%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Recke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Salav%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Trena%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Uitte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Water%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gode%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Macci%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Son%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brund%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gimmi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lynn%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Monit%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Natsu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ryan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Smith%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Phili%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Gigli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Higa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Holme%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kim%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McCoy%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mesto%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sazan%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Vessa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Visse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Goldb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jacks%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carre%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Krane%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Parke%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Richi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Spoon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carte%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sando%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Alons%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ander%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dean%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Ferna%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Kumar%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lyeba%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'McDon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Tang%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Zimme%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Abel%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Frum%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lauer%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rizal%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Barbe%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Brune%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dobne%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rouse%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wycof%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Akers%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Allis%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Araka%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hines%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Koeni%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Koski%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Malho%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Penuc%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Raje%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sherw%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Shrid%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Bebbi%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Moon%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Wooda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dillo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jai%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Koch%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Krame%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'River%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Umeda%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Heloo%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Steve%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hanso%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Jamis%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Lum%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'O''Con%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Pugh%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Sulli%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Carro%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Denni%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hassa%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Duerr%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Fuent%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Mitos%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Poorb%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Robin%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Dumit%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Hink%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Low%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Petcu%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Thoms%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Deng%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Rivas%';
GO

DECLARE @ExecString	NVARCHAR (4000);
SELECT @ExecString = N'SELECT ''Query 03a'', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE @lastname';
EXEC sp_executesql @ExecString
	, N'@lastname VARCHAR (15)'
	, 'Burne%';
GO
