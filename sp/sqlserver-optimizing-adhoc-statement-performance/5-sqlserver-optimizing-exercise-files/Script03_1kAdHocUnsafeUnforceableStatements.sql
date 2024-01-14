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

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hee%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Koch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kotc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lugo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sacks%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Welli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Johns%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Randa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tatma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Achon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Trena%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Trole%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McLin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Micha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Simon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sousa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brune%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gupta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Osada%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Baldw%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Belso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Donov%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Natsu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Recke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bonif%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Salah%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Salav%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ward%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Galla%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rusek%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ansma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ersan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Humme%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tanar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ting%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barlo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hanso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Higa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shrid%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hageg%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Liang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mensa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'O''Del%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rhode%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Monte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bell%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Burkh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hanif%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Keyse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stamm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Harnp%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Irwin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nicho%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Valde%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Varke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zhao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Booth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jimen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Steen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Trave%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Becke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Heloo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McGue%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pogul%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rizal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Contr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kogan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lique%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moell%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tian%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ayers%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kung%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Madan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Petcu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Steve%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vazqu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Weime%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Berry%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Solan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Arbel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Burne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Calon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Craci%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Russe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hines%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jarvi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Higgi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Malme%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rails%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Singe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ingle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rothe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Trame%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Verho%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fried%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pinks%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barbe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Goldb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Graha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Koski%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lesko%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Marco%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McGur%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wrigh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Atkin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caven%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chand%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Colon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gomez%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hayes%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hurt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nelso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Park%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yanag%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bacal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chapm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Salmr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Berge%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Norre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thame%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Clark%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jacks%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Parki%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ecoff%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gilli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kuppa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Leavi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Oveso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Buski%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McCor%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mehle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mirch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Price%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ready%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rowe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hardi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Iallo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Riegl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shaba%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hasty%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hedlu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Khara%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krow%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Li%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Redin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sato%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Style%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tallm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Adina%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Skell%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tiano%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yasin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mosch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Song%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vonho%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bergi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chris%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Koeni%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pinto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rount%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'LaMee%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chesn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tejan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Varga%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brand%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dunca%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ellio%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Poe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shake%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vessa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wood%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Xie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mcani%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Piase%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sloan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sneat%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Teper%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thaku%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Washi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Demic%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hughe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McDon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Meyya%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Slave%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Theis%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carls%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caro%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Entin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lee%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Marti%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cox%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ngoh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Prest%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Schmi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jiang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zimme%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Homer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Flood%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nason%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Richi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hodgs%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fort%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Belli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brian%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Colem%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reinh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Storj%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wedge%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ashto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dulon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dusza%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Eaton%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bauer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Germa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lertp%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'MacDo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mart­%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Meisn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Seely%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vickn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Castr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Casts%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Elson%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Geist%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hunts%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Steel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Weism%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ismer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mello%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Palit%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shepe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Clayt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hoepf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mosel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stein%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fatim%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Holt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Saddo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sarai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Della%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hapke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Manch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Watki%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Allis%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lopez%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Patel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reisn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ciccu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fulto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Griff%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Penuc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Short%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Under%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Edwar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mendi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mette%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nilso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Posne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Winte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chow%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hay%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rana%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Romer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vince%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wilco%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stene%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wistr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Aberc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Con%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dicks%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ogisu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sever%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stotl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Benso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gage%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krapa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Myer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sulta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ben-S%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bensh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Browq%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yee%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Justi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Perez%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Subra%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Isla%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Loh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Marpl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pais%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pathe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Blant%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Burke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ferna%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kozlo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kumar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Newma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Silva%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Walke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Antri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Basha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bisch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jacob%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Keste%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Logan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lucer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mendo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mikso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nelse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Roess%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sands%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Canno%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ford%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kov r%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mugha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carmo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Costa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Desai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ortiz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Potts%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Still%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yalov%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brund%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Calaf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Choin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Galvi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hirot%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ferri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shims%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sims%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Arche%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Capri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hollo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Howar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Spana%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alexa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bartn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hendr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kobyl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Uddin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carey%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sandi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Suffi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bernd%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jim‚n%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mesto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Campe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Coope%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gill%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Komos%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sandb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Glimp%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lawre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Snowd%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Avalo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'O''Bri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bidel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frint%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Loone%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Morga%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Suess%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Watad%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bread%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Camac%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mitch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Weado%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Akers%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cereg%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Conne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dockt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moore%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bentl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chave%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Giako%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'James%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Morri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vrins%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Beebe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Monit%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Smith%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stanl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caste%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hagen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Holme%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'O''Har%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rodma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Truem%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Emory%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Butle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carot%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dieve%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Houst%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krupk%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Leit?%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Meado%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Okelb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ross%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Srini%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stern%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stone%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Beasl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bills%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Debor%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fuent%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Recto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Villa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Farre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Garza%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wruck%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thiru%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gusta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ray%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Syama%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Blue%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Estev%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Harui%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McKay%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nixon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wadia%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bosem%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Young%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dixon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Luthr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Morel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Willi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Xu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Delan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Harte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hows%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Marsh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'O''Don%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Penor%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Core%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reed%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bendi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Buens%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gonza%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Higgs%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Netz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Richt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shea%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vande%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Macra%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ramos%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Acker%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Arun%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Banke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Burto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frede%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Holma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Phill%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Salan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alber%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Conro%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Holli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kurja%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Xylar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nusba%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Steub%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Watts%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Waggo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Demot%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stane%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ito%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pello%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cole%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cook%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Magen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rusko%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Agbon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kelle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kiril%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pak%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stahl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vong%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Albre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Busta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gash%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Aceve%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Glynn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kastn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Perry%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'S nch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Taft-%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wheel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hall%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Inghr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Khann%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mitos%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Munso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tsofl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Berna%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dodd%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Perer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Porte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Verno%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hill%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Leste%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pugh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Richa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ruiz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Valle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Baile%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brunn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Doyle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Eminh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Suare%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zugel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Norma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lew%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barnh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Camer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Choi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Spice%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yasi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Anand%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Corne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ihrig%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Samar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yuhas%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'White%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caldw%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ruggi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thoma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zhou%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zimpr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kovar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Son%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Beave%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Griss%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Navar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'She%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sreen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rober%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Van%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Araka%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kwok%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Malho%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'River%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Seide%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Singh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Altma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Suurs%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thore%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Water%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wold%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Abbas%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Diaz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ptasz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rouse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Albur%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alons%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Breme%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bucha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gates%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Male%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McGui%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Peder%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reyno%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Carne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'DeGra%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Murph%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rothk%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ryan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Spoon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bhat%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Byrne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Munoz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Patte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ramir%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Schle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stotk%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sutto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caval%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Coffm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Domin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Maxha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Maxwe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Posti%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vansa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sharm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Armst%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dillo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Raje%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sarav%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Turne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wolf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gottf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ison%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Levy%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bisho%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lyon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mohan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Remmi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sara%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stewa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wille%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Danne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gibbe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lloyd%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mares%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Veron%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brown%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Laszl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Scott%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sotel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barzd%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Clear%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frank%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kessl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Canut%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Culbe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Polan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Breer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brink%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rosem%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zeng%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Albri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hite%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hodge%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hurke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Towns%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hesse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Koner%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Plays%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tedfo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Low%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McSha%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tench%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Faebe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gubbe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Keil%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wickh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Leneh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lyeba%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Virde%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ault%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hirsc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hoffm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krebs%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moren%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thoms%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Arthu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bruno%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Caves%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cenci%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Estes%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lauer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lewis%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Visse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Benne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gaffn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nath%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Purce%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Simps%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Walto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jaffe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lum%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moyer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tomic%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Westg%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Curry%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Denni%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Guzik%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Orman%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Poorb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sun%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Swami%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Deniu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hogan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nara%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'North%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pourn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Prasa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shock%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'West%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Truji%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Highf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jorda%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mungi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pritc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Scard%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Keise%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pompa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Baker%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Burla%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Guo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McCoy%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rockn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Weber%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Westb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Beans%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hink%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Locke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Uppal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Abel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Corie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Handl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sande%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zhu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dean%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Eldri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Foste%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lunda%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ziegl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kitt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Leone%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Walte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Camar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Duffy%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kane%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Macag%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Berch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kim%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moham%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Silve%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bowma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Funk%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hass%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mille%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Phili%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Saman%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Su%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gimmi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Haemo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Heane%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Iyer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kawai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kurtz%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Olive%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bacon%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Catal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hohma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Worde%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Worie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alame%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ralls%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bebbi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reams%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hurta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Khan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Liu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Re te%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Swear%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bergl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Eller%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frenc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Laurs%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pike%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brewe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Deng%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gutie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Heyms%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kurni%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wisne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mehta%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Raman%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bradl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Duff%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Haine%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ledya%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Manek%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Murra%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Quint%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stadi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Toone%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brumf%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Haugh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Herri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Javie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Medin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Orteg%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sawye%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Seama%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Moya%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rapie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vlass%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Abolr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Grand%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mitzn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Olivo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Track%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Umeda%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Amlan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Crow%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hillm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Parke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wall%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Worla%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Macci%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ruth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Demps%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Feng%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krane%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shepa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tran%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zubat%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alvar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Straa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Galos%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gronc%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Torre%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Charn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frum%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Glenn%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'So%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Word%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zhang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Agcao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Finle%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rivas%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Trent%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kaliy%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reite%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Stefa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Troye%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bohli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Krame%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rizzi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Skj?n%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sunka%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Whitw%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zukow%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Frazi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Given%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hance%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lobao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Niswo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Slatt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wooda%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Canto%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rao%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ware%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barke%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Evans%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thorp%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ashe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Barba%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bueno%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dumit%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hassa%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Aguil%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ajens%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Black%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Roy%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sanch%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ganio%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wagne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yukis%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brigh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jenki%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Warth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Winst%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Zare%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Duerr%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nay%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Van H%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vrett%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Welck%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brook%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dyck%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Golds%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jones%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pears%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Valen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hagem%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lazec%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Margh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mober%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Simmo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Emanu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Raji%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Getzi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Herna%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cheng%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Desal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Morco%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Altam%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Duden%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yong%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Chapl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Cunni%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sam%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hammo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Robin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Teal%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Thomp%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tuell%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Los%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sai%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Voss%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bolen%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Groth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McPhe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pulip%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vance%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ye%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Ahler%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Colli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kaffe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kenne%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Osbor%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Retti%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Schar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Brumm%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Dewer%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Herma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kapoo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Berg%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Danse%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Focht%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kelly%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tuffi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Verbo%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bates%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'De Ma%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Flore%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Heide%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Osori%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Reeve%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Coret%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hamil%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Sabel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Shoop%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Jamis%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lunt%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rodri%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Fox%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gigli%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gokte%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McCar%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Peter%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tippe%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Vaca%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Venug%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Wilso%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Mayna%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'King%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Kodur%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'McCla%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hende%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lewin%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Lysak%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Goel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Long%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Pette%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Rovir%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Champ%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Colvi%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Danie%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Drury%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Klein%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Velez%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Alan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Gee%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Katya%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Nash%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Oviat%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Serra%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Tambu%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Yang%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Blyth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Campb%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Garci%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Bryan%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Hensh%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Matth%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Peopl%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Powel%';
GO

SELECT 'Query 03', [m].[lastname], [m].[firstname], [m].[phone_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] LIKE 'Adams%';
GO