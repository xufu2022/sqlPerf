-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Script 1000 Unsafe ad hoc statements
--		* These statements can be forced
--      * These statements could be safe 
--        if the right index existed...
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

SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ajenstat'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brewer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'De Oliveira'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Elson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jordan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mehlert'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tatman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yuan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'ANDERSON'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Erickson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lisboa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vrins'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Conroy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gilbert'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lundahl'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moberly'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Remmington'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Haemon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rusko'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Allen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Glenn'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hoeing'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'BARR'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Steel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Trenary'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Becker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kurjan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Warthen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Watkins'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Danseglio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Michaels'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vrettos'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Delmarco'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kumar'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Malmendier'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Singh'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vanderhyde'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Petculescu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Roy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bueno'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Buskirk'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Malhotra'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tejani'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yuhasz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gottfried'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'James'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Poorbaugh'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reynolds'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vandenouer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Worland'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Heaney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nusbaum'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gash'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'He'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'CHEN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Randall'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Verdad'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wollesen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Woodard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yasi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bentley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moreland'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Abercrombie'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berndt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dickson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gimmi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ingle'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sreenivas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Johnsen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stotka'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bourne'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Byrnes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Caldwell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Khanna'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kozlowski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lutes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'DORR'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Truempy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barber'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lenehan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Perko'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Villa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wycoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zimprich'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Deniut'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Thompson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Castellucio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jaffe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Krapauskas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Osorio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sanz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Son'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vong'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ansman-Wolfe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kim'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Logan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Madan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Watters'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hendricks'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Perera';
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Campen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'EFLIN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hassall'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kramer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Oveson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Track'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Walker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bruner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ngoh'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Peters'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rivas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Amland'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Benson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Looney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mares'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Short'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nason'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Peterson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ptaszynski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rapier'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rounthwaite'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stiller'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Caro'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'FLORINI'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Farrell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Norman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pritchett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Skelly'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Straatsma'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cavendish'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dixon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Goktepe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hines'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Patterson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'GOHAN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sabella'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dulong'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ferrier'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mays'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mehta'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gates'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Homer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Myer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ross'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Silverman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stern'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ting'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Garden'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gubbels'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Levy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Naik'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ready'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cannon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'D''Hers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hill'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Samarawickrama'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sawyer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Xu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ackerman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bendixen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pulipalyam'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Recker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stadick'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dempsey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Frum'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Heidepriem'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lertpiriyasuwat'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Avalos'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hee'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Richmeier'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Taft-Rider'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zukowski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McCarthy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pak'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rodriguez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vaca'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Anand'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gomez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Netz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Railson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bates'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bowman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ecoffey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Griffin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Huckaby'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Medina'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Parkinson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Saddow'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Schultz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Virden'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bennett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chapman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Higginbotham'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lawrence'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McCormick'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nilson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Troyer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Verhoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'HAHN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kastner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Markwood'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vernon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Estes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gage'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Graff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jackson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pike'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shakespear'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chow'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'INFANTE'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Martinez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stewart'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Achong'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zeng'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Matthews'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rusek'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Male'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alderson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ray'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dudenhoefer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Duff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fuentes Espinosa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lique'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rizzi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Smith-Bates'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alvaro'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berglund'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gaffney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rothenberg'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Grande'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hite'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kotc'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Butler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cantoni'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Decker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Duerr'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sandoval'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'JONES'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Blanton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Duffy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moschell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Worden'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'D''sa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lockert'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pompa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Srini'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bebbington'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Howard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vessa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chapla'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dickmann'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jones'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ma'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ogisu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Valdez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Givens'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hunter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'KAHRMANN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Teal'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Harding'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reding'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zubaty'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bradley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cracium'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lewin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'LING'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Spoon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zhu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bernacchi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Coleman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Steiner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zeman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lee'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ayers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chambers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hillmann'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'MAKAI'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'NELSON'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'OLPHANT'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Baker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Belli'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Burkhardt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Edwards'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lazecky'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sanchez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sánchez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hendergart'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moseley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Singer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bockenkamp'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Luthra'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shepard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hohman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mirchandani'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Prasad'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sands'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wojcik'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Allison'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ciccu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ersan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gee'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Heymsfield'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hurt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Spicer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'White'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Murray'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rosemont'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vigil'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yee';
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Beaver'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McLin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Albright'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Danner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Koduri'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pellow'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Poland'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Raman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sneath'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Getzinger'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Higa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Holman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Keyser'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Posner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berry'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Groth'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Okada'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Trent'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Watson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Williams'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kesterson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reed'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sullivan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Drury'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hartwig'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Johnston'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kapoor'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lew'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Northup'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Swan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Altamirano'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gonzalez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Purcell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tedford'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'PAYNTER'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Belson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cole'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vanderlinden'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Young'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barbariol'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cavallari'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Salanki'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yvkoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ziegler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jacobsen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tamburello'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Henshaw'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jacobson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'So'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Youtsey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ortega'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Patten'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tench'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hesse'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Maxham'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Aguilar'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Beanston'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bidelman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Veronesi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vlass'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zheng'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Banks'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dodd'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Frintu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hirota'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lengel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lobao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mitchell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Saraiva'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sotelo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Caron'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Macagno'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moore'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alberts'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barnes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Espinoza'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Guo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rizaldy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Slaven'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'QUINT'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Weber'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Burton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Castro'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Eaton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hagens'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Iyer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nartker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yanagishima'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cheng'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Costa Da Silva'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Liu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rubio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'RYAN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tiedt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wolf'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Champion'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gibson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lewis'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shock'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yong'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dockter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hedlund'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kleinerman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ruth'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Schare'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Valentine'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Deng'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Orona'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ortiz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'She'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'STEIN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berger'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bischoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Blanco'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Goldstein'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Higgs'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Holt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Keil'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kelley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Richards'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tallman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berg'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hass'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Turner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wood'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bennetts'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Choin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Monitor'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Simmons'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Townsend'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Westbury'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Haines'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pettengill'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Poe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Selikoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dyck'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Elliott'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Marcovecchio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vanderkamp'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wheeler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Daniels'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Delaney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Travers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Umeda'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carlisle'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Palit'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'TOLSKY'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chestnut'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Consentino'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cook'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lopez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Suffin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brown'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brumfield'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Desalvo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Manchepalli'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'O''Hara'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reiter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Valle'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hummer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wadia'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Walters'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'West'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hirsch'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Richardson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Su'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wold'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bashary'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Browning'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'UNAKLET'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mohamed'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stammler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stevens'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vance'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Voss'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Word'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zabokritski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carmody'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cabello'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Scott'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Foster'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mitosinka'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sam'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Abbas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Friske'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Henderson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Weldon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Adina'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Calafato'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hapke'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Katyal'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'VANN'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tiano'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fakhouri'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'WOLFMULE'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Krane'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rhodes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sousa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vicknair'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fox'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gray'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hagege'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Farino'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fine'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Schleger'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Schmidt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Suurs'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Goel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gutierrez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hoepf'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hurkett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Johns'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bonifaz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gode'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'XAVIER'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'DeGrasse'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kovar'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kovár'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ward'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wilkie'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Atkinson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hay'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Konersmann';
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Peoples'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tibbott'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vande Velde'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Waters'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Esteves'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Laursen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nay'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kaffer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Raji'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rousey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tuell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wellington'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Holmes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Navarro'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Simpson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Whiting'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Blythe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lum'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McPhearson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Patel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Raje'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Arakawa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Billstrom'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Conner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Goldberg'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hoffman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Khan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moeller'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rovira Diez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tramel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hurtado'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Maynard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shea'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Watada'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carothers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Glynn'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Holm'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Porter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cleary'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Munson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sanders'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Taylor'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Appelbaum'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Clark'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Doyle'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Keiser'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rockne'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barnhill'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Christie'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dusza'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Magenheimer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Culbertson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fulton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mendoza'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bartness'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Coriell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mew'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Perry'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Van Houten'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Browne'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chandra'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hankin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jarvis'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Long'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shabalin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Teper'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tuffield'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dumitrascu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jamison'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pollock'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Serventi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vazquez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Winter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cunningham'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Margheim'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alvarez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Phillips'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'YEONG'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cannata'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Choi'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Greer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Heloo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nash'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rothkugel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Salavaria'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Srinivasan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Whitworth'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Anderson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Justice'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kennedy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Solanki'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wistrom'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ashe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moreno'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Trolen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Westover'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'LaMee'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Meyerhoff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wright'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Creasey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'De Matos Miranda Filho'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moyer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yukish'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Beebe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Calone'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carmichael'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'O''Donnell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Szymanski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Underwood'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wall'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Welcker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Garcia'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Roessler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sara'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Traube'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Camargo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Camacho'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jacobs'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Leavitt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Martin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'ZUCKER'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pal'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Desai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ralls'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sutton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bishop'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Burnett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Miller'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bales'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Boseman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mohan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Newman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Thorpe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wilson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bryant'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Huff'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McAskill-White'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Morcos'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Several'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Suess'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Thomsen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kobylinski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rogers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sacksteder'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Serrano'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berch'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Coffman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Entin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zhou'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gibbens'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gustafson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Norred'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Russell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Thoreson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Torre'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brummer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Van'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bowen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Price'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tian'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Xie'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Maccietto'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Niswonger'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Svoboda'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wories'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cobb'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ison'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McSharry Jensen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Miksovsky'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pearson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Richins'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sandberg'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Browqett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Riegle'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barlow'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hayes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Leste'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Waxman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Yasinski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Arun'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Focht'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Suarez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ashton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Clayton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cooper'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ito'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lloyd'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Playstead'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Saravan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zwilling'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Flood'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hodges'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nelson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nixon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Waggoner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hector'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Laszlo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lucerne'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Frazier'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Meyyappan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pederson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Swaminathan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alcorn'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bhat'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Caprio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carnes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mello'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rivera'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Louverdis'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Trau'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Westguard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Altman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Beasley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Black'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Flores'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hamilton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ruiz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Thames'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chandler'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dominguez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kearney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Garza'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Highfill'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Preston'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Richter'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shimshoni'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tanara'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Christensen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cox'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hodgson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Uppal'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vonholt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wilcox'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Acevedo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bacon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Huang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Low'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reams'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Seely'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tullao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Burnell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nath'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zimmerman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Abolrous'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alexander'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brundage'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carroll'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pogulsky'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Walton'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Catalano'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Natsuhara'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sherman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Toone'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brunner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Burke'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Corets'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Houston'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kirilov'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zhao'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Antrim'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Breer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Funk'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Penor'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Crow'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jenkins'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Smith'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Trujillo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Albury'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brink'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chander'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Macrae'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Manzanares'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'O''Dell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ware'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bohling'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gehring'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Harris'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Quintana'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ruggiero'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alvarado'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barker'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Berge'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Casts'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Culp'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Meyer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Penuchot'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Perez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bauer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Herman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sultan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Uittenbogaard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Johnson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kurniawan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nicholls'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Torres'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bailey'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brian'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chesnut'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Emory'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'French'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'MacDonald'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reisner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Gonzales'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ledyard'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Leonetti'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Liang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McDonald'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McGuigan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Meisner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Moya'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pais'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Severino'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Verboort'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Agcaoili'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alameda'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bustamante'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Eldridge'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ganio'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kung'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pinkston'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Spencer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Carreras'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rodman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stefani'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Morgan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Scardelis'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zhang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Cetinok'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hagemann'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hink'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Philips'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Baltazar'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Donovan'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kharatishvili'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'O''Connell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wruck'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Brooks'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Curry'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kurtz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Arifin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dobney'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jimenez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jiménez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vargas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Blackwell'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kitt'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McArthur'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Meadows'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ben-Sachar'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hall'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Li'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Nelsen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Syamala'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bolender'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kahn'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mcanich'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Rowe'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wagner'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Galos'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Mendiola'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Raheem'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Robinson'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Tran'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wickham'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Con'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hu'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alpuerto'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Davis'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Handley'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barreto de Mattos'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Haugh'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Inghram'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Koch'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Park'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Strange'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Uddin'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Whipple'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Zugelder'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Beck'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hughes'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Shoop'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Core'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Emanuel'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reinhart'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Skjønaa'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Roberts'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Colon'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fatima'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vansant'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Xylaras'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Barzdukas'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fernandez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Ford'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Kawai'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lynn'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Munoz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Muñoz'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sato'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stone'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Chor'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Jiang'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Koenigsbauer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pournasseh'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Albrecht'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Armstrong'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bankert'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Holloway'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Reátegui Alayo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Sherwood'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Feng'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Fredericksen'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Eminhizer'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Alonso'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Evans'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Vasquez'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Venugopal'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Marshall'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Murphy'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Posti'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Byham'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'McCarty'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Robinett'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Song'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Spanaway'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Akers'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Hensien'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Suri'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Whitehead'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Krupka'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Steelman'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bacalzo'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Dellamore'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Harteveld'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Herrick'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Lepro'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Stahl'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Koski'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Okelberry'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Piaseczny'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pinto'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Wedge'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Bent'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Metters'; 
GO
SELECT 'Query 02', [m].[lastname], [m].[firstname], [m].[phone_no], [m].[region_no] 
FROM [dbo].[member] AS [m] 
WHERE [m].[lastname] = 'Pather'; 
GO
