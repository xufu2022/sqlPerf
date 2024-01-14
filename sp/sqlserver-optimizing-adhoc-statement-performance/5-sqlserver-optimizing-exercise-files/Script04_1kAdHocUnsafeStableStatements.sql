-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
-- Module: Plan Cache Pollution
--   Script 1000 Unsafe but stable
--		* Even with the right indexes, SQL
--        won't see these statements as safe...
--      * Can we use sp_executsql
--      * Can we create a plan guide
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

USE [Credit]
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BOKMCKSMLMJXDN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'AIMJKWWJCPBGOH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'ETJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'JADKLXESBTKKQA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'WKSPW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'NDEHORFLVYQPHN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'TQNDGOYPAHTHUQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'OEATDCYWGEJCJP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'DFBHFEZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'YWGIGNGLNHWYCH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'OWOOOFHKUNSTSH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'RJMTWVSYDVVVIT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'TQKBQLLSMT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'UDTZHPVTT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'SYGHU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'JTZSZYXAERF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'SSKWKTCMNDMPGE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'ICVNPSDVWWOYVN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'OHODOXRTP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'PFXQWZCQQMRAOY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'WRWOYNQYUHOIRD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'QPRXJVDYCUURVR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'WRXXYDRTIL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'UPPIPXLYB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'MVGEHJNPFH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'RMQMCKJB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'UROCXXBUUFEGLT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'UBKQSU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'JBWVPYMUWMMTXI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'NDVEPJKLKT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NLSQFLVUUOODNQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'SLKPTNKS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'QMM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'VQOQDCQSWVO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'OSLR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'UCITSZICTWBYKU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'JTTODDDCQYMJPI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'KTVKZBWPEFWSHJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'UWDKSWQQHSSTBO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'PBN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'HQGBNCTAGLXBJI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'DLJEKSFOWGJUFR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NJRZTSUQTABWNL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'GINJLNPORRIQIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'WRFIFVZYUDZQXV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'LOGWAB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'XTJRGFWGKNH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'OWIQFGBPKU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'ABQBRLZM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'IKQFZPJKPHGUDV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'SMTECMBEDEBZWP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'ZJDQMTXDHDFSBO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CGCQVKWGRWOOVO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'DYQTFESGWFCRKF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'SYWVD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'HDPBEUJUVNIEND'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'TIBUIXLDHQFSKU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'YFABDFGGEFJFBQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NLUXVYUNDMSUTK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'LQJJGKEX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'YDSNG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'PVURORELWGB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'NPFHTBBM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'JHASGXWVFUPOFI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'FSAOOMBYJFDGLP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'QLRRJYCWEOAOVG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'TPUBDW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'LVRB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'SNAYMTDEQDFSIS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'GHXUEZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'NTOUIJIPQUBCEJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'GTYFDPFXQTB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'VPBRWMNQRMWKRU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'UXPPROUZIIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'FLBOAGTSBQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'XEYJOVCGEDYJYE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'PTBMLOPLKJCOKX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'RWNIGVKVIDTABU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'WSVVJLLSXVWMPU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'KXDPCQHCCPKGLZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'NVBGD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'UUCQZIREQKFQYI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'NBUKQHFAHNVEQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'SEKGDD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'BCCDEXWVAVJKWJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'SBNHQON'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'IFCEEA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'NOPPW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'VPNJODZSS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YKPBLIMGPJDUAJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'MJU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'ERJWQNFHYOMDDR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'HHFCIRXPGBLCNH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'CMJGFVQOHONRST'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'HSHWKYXVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'XWIIHGIBSWOFF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'YSMSWRFTFFNRCA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'CBJVALYHCTHUVC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'HGRZZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'DGMOEURGLIWWH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'SDULXOSTQQR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'TOVCTPXGRJBSAV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'QQRGMSULYDR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'EMFSNVLQDKGP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'YMHFSBGUIHOE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'HKDZEAMKKJIREF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'AMNTSDXDWEGFRB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OUWOVR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'FBXBNXRTQHLCNN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'SJIDMHL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'RKVQUUONJU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'IVSBTQOMRTBVMZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'UYWCRZSFCDHNXQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'GQMTYHOVMYV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'WSPEBKHOEVGVCG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'EKPDXRUJOEKMNF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'FVWJYNHJY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'MRSLKYI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'NYWTLRTHTW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'KOV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'QNFNZUDOJLVLLC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'ODBEKNPFMVUUFG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'GYKERRWV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'RTARRMIQSWJLC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'OFKUVHCGGNKCJP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'VLBDTNBCPDJRBL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'GYUCEVRNXLBRGG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'GRRBA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'HHCGFLDOKYCFK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'DVIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'WVNLWF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'SLYQFGUFTOE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'KQNBLR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'KUDEHOLF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'AIUQXZCZD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'OTXDO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'RTOTFJNG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'BBJRCQHSYUP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'NMUBCXRGNIJVEQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'GOZNQQEXVVJCPJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'COGVJQMUHIVGBZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'ZAGXKQPGUKBPTW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'SGPFYWJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'IMFIAEZDSOXXOQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'NQCFERY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'KVTIK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'XDYESCPXTYRWBN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'XYIPDKJEMPBTGR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'BBWCRE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'TMFCFQHZIONL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'SPJRVKCZNC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'VRSX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'EPSRJCJVQHHEOO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'FONVOGNCRQERQI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'JZODONHSCNSXZM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'ZSQLLIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NTEES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'LCFVUWMMOBIMWC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'YYUMAJPZLCRCOY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'UJYEXFJLSKN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'UDTBLYSJFJZN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'RTKUOPBCPKGNK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'VCRVVOBTCXWYFE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'GQLOWHMQPFWSMY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'BZOXREDLWVZUGN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'MGVBGM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'BXVGKTRBRCNOCF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'NNILTFGMUIWEHG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'RJIQNJOAGFO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'RYEOCIBMTMXTFP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'YXEDMUOYVGQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OMCOPTHBXNZMLD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'DYLWCJEKMUNDNX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'MBYJBHVJB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'LGXVRUCMMMVOPH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'LVQNGQGFOMJCJQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'RWULXIRZUIUSKC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'TNMBRTTUOVQXKN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'OOLMCNDST'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'YZKXNWQUTEIP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'RJQLZL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'URXJQWNWFCLVD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'VVRATJPTPT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'DPCEH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'USCQFVCSQT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'LCHCQIYQL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'DLSSWCKMUPX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'YLWVOLEVDOBBMC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'SKSUXGIJEDUVN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'IUEKCCKTZYGR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'BHNKHNGRBIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'GTTDV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'IIDBTJOJWXJPUY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'QCTEQRSBWMG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'EPBJUXNTQG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'TXJPKELVYCQLWP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'UMGMETVTLJSOW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'WLDY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'FMQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'WIVHLHDZQYY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'QUBOD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'UOBVNJPFJGZSRD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'UEGNKCBBGXHCHI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'SAPSMGDP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'TUJTXTXVTVCPVV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'SUOYDRC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'IDOMN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'BGRSQKWROP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'JVTYQTCOPFMSGD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'PICSBCPCRHUFBV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'RPPFGYJSPUNLLC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'UDMMKQVGBQFGV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'OSDAIGBNNSM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'EKDTPRFMRUXYPU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'VXSNVJVHVVQTJV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'USYCWIXBSUYENP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'SHHTHUHDXAFCPF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'XNYWOHT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'HGGCILGWFYUZCL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'LBLFRYYTSOPGKC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'LHLJR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'UXHWQVUCEVIYUB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'LPM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'OCJQNTEZXKYXKA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'BWOREJPMG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'SYYDS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'IWNBVRC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'JJMHYKJMWZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'WRVVC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'CRKAGQO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'HGCMVBKYTRSVQS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'FCMHITFQRRFTEW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'MPAQMYJWYXKTUW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'UBAQY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'MGGIBBUVBCDOCE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'BXKILTHOLDUEDR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'FEQNFFKWZH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'WIQMYILE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'OTTLXMTBUWRJJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'POBDHEKXIAECFQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'KOBFU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'FBROPFVVLCTXEI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'PWSUCCHUZXQG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'KESETKGREBUCYJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'SAZVWUFXOWCKVH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CISUDLSCNMCKIL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'ZEGLDGENNVQDAF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'YTUOPBGQPT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'QUSRERQUXCJHTG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'QYGPZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'KQXLJIPFEENOW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'BSDSCTIKEP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'XXEDGGIDYS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'OWTIDCSEHYOHS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'ADPBFQRADDCU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'RUGRYHUYOBZQK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'FHGYUTYWPUTEEL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'ULWBKXBROGQRKK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'DWIYTNM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'MTKIENQNFDBH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'IYKDQJFYEDNMYB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'LHNONGYRGKGTGU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'RWIDXHMK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'KIJNMKKJQUDXOX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'BZRMYXOLREETJD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'QJEQWHRINNRHEU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'UISNBWBNSDIPQS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'NWVGPBLTPWLKK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'JNGWO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'SKPHYO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'DTFMLZSGUH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'SQMYMHQDWQMHKX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'MRGZA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'WOUG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'DVQAGQIKKYRIBJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'EDCSTERLWEICMN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'KPQJEOMAVVLOXQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'JFOPEICDPXLEB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'HXIFXXOBOYCDTF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OJNOHSNUEQSWKO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'HLIQXCCSBTMURU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'WFUFWHNCPPAQOD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'CAATNF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'YLRECCSCNMMUYW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'QJEPWJUVGQCCBW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'QSUODWUHWLQUN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'DDWWMJPWGBNFU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'HVXLQIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'DNQFQFIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'VSGMHKHCGYLTTL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'YCVZHF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'KVPCDUQRYVPLGB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'MSVGHENVJU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'YQOJGNHDNMBKSJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'YKJHXBJXMSQY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'VOWGQAUDFWEKRM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'GIDQDMKBVQKEOW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'MSSI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'EYNWKMPSDFHMEU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'UZMCMGTJYVWXLS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'LBMZTFFQUILLNV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'TURMSXBPNPXBET'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'NCMSGIRQYFUGFB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'PGNMHPVPX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'DNHNV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'PNPFILHSHMSPGK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'PRJTVRKYSDZH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'MSZROIDTMUTUMG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'ZCMVWYMNYVZXIV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'ULVHOIMVUX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'IYZA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'QHRDYTDAHUERRX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'XYHJOMXDTHC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'SMMWSS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'ICXSDCIJTYVKPF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'MRMFIJRWC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'YRG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'ZJCQGIQUWZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'RIZCP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'ANVJTOOLLNX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'KMRYRXYI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'BPBWDDXLLJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'NTVQPMLJVWWICC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'QSLW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BXEUQYYRQNUBV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'MUPVH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'VYVNVTCMOJY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'EUQELDAZONRY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'BFHLRPRUWGVPKF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'URBNOJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'OXSLIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'INJIV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'WYQNBNVGFSOUOG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'BXMWHLCPHQJOLB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'OXDRWWZFFNIPVU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'ODRJKTOEJTOTJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'WICBKBKTRDDAJQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'YXJMLXLYQTPIPP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'XGDUWGIRJEYGTB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'PRVRBQFKYWQJX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'EVU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'QGDIJG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'IVQDXLMKH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'LKMONLHTCDLSXR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'NTLQPXIBZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'YWRZPEXNYYYCRJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'WOXMYLPTAFCVYJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'MISNYZIRUKVOSD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'ETJOKULBIWJQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'HEDNUKRGOAGPRY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'LJUHUXCXQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'EKVHVHETOGXCYP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'MEEYKIHNCRGESJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'RFHTJAHCCITC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'GTRHCSQRCVC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'APMHWHWJF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'KQHFRL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'ZNYCDFKR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'PVWIDMHIKVR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'VYCVOOWKDMXVSP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'KDEEGOXVBTCYYH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'EQKLWR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'YHQNPFJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'KRNUCFBRMZLAWH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'OBXWLWQYIFKHBC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'FNTSCXVOWXFRYQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'SBUEKIGQPLYHX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'TVP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'AIYNP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'NTFNR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'ZHPRUMSLKKXWGE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'EUEZZNUDBRHFHL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'OXYE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'XXXGLGHCDLRQND'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'DLYSKQCBKWWKGJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'MTDAWINSPYF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'RQRYMYCEPVHRIK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'CCUQVYBT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'LBUCGSSMPRZXI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'FXIFEIEJBGGJZT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'JFUTP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'AEVOXBVL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'FLIUY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'QOZRPVHHJJNPIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'UNRFNIVTVZMIOI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'UJHWUGQKJGKND'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'JTMQD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'TXXJYWECRBHFZJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'CFROOKY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'QDHJP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'RPKHUTGOHJHQVS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'JYRQDXV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'PGQCSM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'KZPVHLGMQLFZER'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'RSMMDE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'BUNVNWWABO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YEZJU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'XEUIBIQITKSHMT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'FUEKRNEG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'BKWE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'IUWWUWCNYTFPZI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'BBSW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'ETPGCYMUMKFFWO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'TVXPLYCPLWQX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'OBVVKU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'STTCVOIQEKXUSP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'VPITCTIBB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'VITVBTBBMXWLJC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'WGQRRJEBI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'GODWOUVFJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'PBHXEE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'UTFSYUWJYQSLXJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'RBDHNLHOBQUNXP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'MJCPEGV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'VXRZERUEIFQCEL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'XJPIDJLBPKPKEE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'LDEEPKNBNIBSRH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'MDOMHPNHNLSEO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'GOBQKECNFGGNO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'PBVSBCMDLCJDYN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'KUDTWHR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'XUJGAWJBHWZSD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'EJNIWEGBVHELIA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'ZDSEGIZIHLYLEE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'KVRFV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'NPKZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CHJRVTUORVPSQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'CELTOXTQM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'MTOGFOSD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'TJUENMTKEEKBTX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'LLKQYGEU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'DIYRTEEFFTSVHK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'YYCWWYFIYNTTDN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'FMPGQIOISFDFRD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'QJUUKXEJYLJBCH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'EFFEHPPUOHOU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'RRN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'ZNGRQHGOFBFCBH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'EHWQMFUWT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'MVSITWJORKSLDT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'OELDYRGDZNMSGQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OHMJYEUJHF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'QFQLNSGVT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'EYZVRHXJOE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'GUXRJCWZVJE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'XMNEFYLVXZXXVC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'SDQUURSSPXWN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'KYJVZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'JFEFDTJPGXRTOT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'DLTQHHYZPOYPLV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'SVJAMPIO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'EIRFFSNLQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'KTDEYNDD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'MRJYBMMJIFZCPO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'TFGRDZPBSPKLVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'CIIJSW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'WRKCZBF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'HXVGDBMK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BNBQDFR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'CVMY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'BRKIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'EPTYHYIZHBEIYC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'QKBSGBIHGOEUCV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'UHGV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'FKVOP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'SXQBFHNEEXFJZJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'MEBWQIEHYNWEBM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'PJOIMFNSXDNPPN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'VEL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'UVIETAH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'KGQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'NKOCIMRVHFJZBE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'FSE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'CQVHNLFBWTS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'OMQPNQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'QEIKIXG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'RGVBFQTFGWO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'EYSVKSGMDHOOKC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'LRRPPSSJOHQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'KIVGNOWQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'TVIDWXUPYKVVLW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'SWTYJYETOVWCSH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'QMNFYMXD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'IKTVQN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'XOZXXOVTVDYIPK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'EPCDXQDMWSP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'PAXWST'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'JOOOFESIENSH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'YBFAMPKWAPG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'OHWMDQH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'IPLFLTVUARQIWQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'MCPTKDMJLNLQVW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'YAEY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'EBBRETC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'SRTPBGTUL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'PMOE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'MFSINSXZKWAGRD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'KJRGEUBQCXCRFR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'TGOTEHZAHBVGWX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'NVJWQN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'XPHMWIHV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'HTYDFXSDNOBDHT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'CRLVRUDGZGHGYP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'ULSYZPVYVHVDOB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'FJLWMLQPAOSS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'NXU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'KUYDUBJH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'JUEEKTINVKUNFG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'HWCJHMXEFX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'FNVPBWISTPYVJG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'XRPXV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'ELLCBZLHUD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'FZQXBRXR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'BKKC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'WLQXPYMR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'XVEIEJZKHXHPMD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'GFLCUMJLVTTT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'MBXCWCSWWJSDKG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'QGMWSLTUTUKN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'NNTE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'BOPH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'ISTIHRQBR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'RBTKUNQDYWZSH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'ULLQKOBIQX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'JGVWTS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'VJOBQCBEXEWUVX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'RHRIUYYC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'VKRISPRIGJAUEK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BIYFDQMYPCSLG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'QFMPTE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'ZYIPJLDFTTZIPM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'VJLPHNPGPCNVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'MEIRUDLRKYTVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'MIEKFQFMBURSKP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'VEEOUHQDEHOLBT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'LWAVMRVYQG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'CYYUKBBLESSW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'QFZUUFUEVMZS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'DXDFACELNXTBZP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'YOVLPDOCP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'FIBLQTWPKTCHPG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'RCOIJGRQRCLWOF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'PSHM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'JCJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'JXRBXRGKIFWNMR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'AWNKJOF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'OEH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'ONRYPLUXVIRKIM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'BVOLMYWEHO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'IOYSRNJVWGNRHO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'YOUKIEPXVGU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'RHHNJKQFPNLWFQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'TGODYSXSFLCUR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'IUDOLDHFIBUCC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'NSUFGEAD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'KPMNZVVRIKNESC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'EBJVTWPTUFVGIL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'WLORKKGK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'SUT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'UBCZKFXNRMEAOW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'TUAU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CLTIRCJYKMSGF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'TBGNWW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'ZUXRFMUPOYIIOG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'FCRWNZIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'VYNLWCXIFPBXRA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'BYV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'HSPQTJTMSXAUVQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'WQXISS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'ZZQLJRCYTMECFL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'CRSSRJIVSDEUWA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'OFRFNRIBRRDBVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'DLAQLP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'GJTAXKWJMNUCSC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'BVZMHRNHLQIDWD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'YENJHZHYLSCAJZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'SSGPRUCXSKGOOG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'CHWJNSZYVRQWNF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'LABLSQWQIQMSQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'ITYLNGPTXIVEGY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'QLBR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'FGTTONUTCV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'RXVXYEVGZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'IAPY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YSAPVBKPCMLWYN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'NVOYQHXK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'IJSTVDSKBSGYFR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'FSGUBI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'NCDSYCR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'GBKQGTG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'UXPF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'QOGNWBZEYVLTQR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'NSQPM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'WYLCEKYCWJFNRR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'CYWUJQJOSQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'TRTZXYSCXUCUBM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'QZMDGVRDTKVHYV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'LFHPAOBQGIJNLR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'VDCBZINXQWQIYE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'XFDHWYCVFKDGHO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'LWFUUTNTJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'OTXESBVUJOHIEI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'LUPQKHMBDMTPPC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'ELTQSPJQMYOQGE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'VHDXSUBWRQSKOK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'LSRPSDH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'POFVXGEDG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'ERMVEEMOEWP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NFFYQPWFYBBR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'KVAILCBTQJWYQX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'RMQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'UYPFCAGKJMTQFX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'JYMXKYXQTXQGJX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'MPHJZNJNGRHHCQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'TCQHJSBIZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'YTUFUUZGDPYBKE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'TJELUQCATM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'KWVGTNQLDVFP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'TIESGYKFHUKS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'DEYKPHCBZPEBEL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'CHOJTCKWYYRKN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'TBVAGJT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'XFRC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'AUHFMWBOYRANBT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'SCGQKOJMGMMXIO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'LVCJYLSFRHENPX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'ZNYXUFGSYCNYMZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'KTCHZIVDKKIH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'CXLRI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'VJPKFJYURXISIR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'SVXXHPZUKGEODK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'VVRQUEAUEH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'YSKP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'XSZKLWSKRY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'UFLYGWOFBOJHOD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'WKWUQRPG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'UPUO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'UGRFDQLXYDYFMB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'MQNECAOIHKPDBA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'JMROLFKVBWRYN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'NPSIQUMTMGW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'VYHIDYQVJJIKY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'ZFJWPWJROZPBL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'MSLTLWDFZX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'GQNREYOYBQDX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'WYEFKMQRDXB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'GKBASNNXQORQVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'XVIAF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'GGDSNYUUMXNJLD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'REJYWCLQMUOJB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'CNCXSVPRHLIPXH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'UNVS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'YUB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'WOUARHOJLUECVJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'YPECPWTPWWVG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'VKZEJQXGGPERFL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'JJXFKGVWXGDC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'VZVTROPSZTIGTV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'WDZSOJTHCZNNIF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'KGKMRQPJQI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'IHJLABOPORGVES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'FBTDXBKHLQKTFO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'JJHFUK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'MIJPZUHGCCNABD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'WXQLVUJWJLXXLC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'HVSRLGRKXCBHXI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'WRYNOEUKBSTCIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'WDRIWWNAGCWQTC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'SFFPPOSSXTRSSA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'CUHHMTVJAFWILC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'VBZZDJKXUE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'STECF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'ZSYGMEZWMTLWDO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'YOJJYEXQUMJNNM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'KBFFFPBYB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'PLSEOYYBSCES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'OERD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'TBJCWJDBQY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'UNGUH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'AVWNVAHRLGJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'CWHHUMPBPMNUGG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'BZDZNBXNKUENKJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'SEU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'UFFNT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'PHDRARNWIOOJCT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NFVWDTPROMCFOQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'NXBIURLJTUIMFK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'FYMAPFSBLWZSBW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'ICKHFYRYDEYA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'WSMFWPDKYKYFDD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'FCHIRLXKZHO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'TRVLDTQXVRKZXG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'WCYCVBJXFHCUFK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'IMEHSLZNBSWNPA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'NQFRU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'LJRD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'WXPRNMWLNKCS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'HXU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'BRGRRQFPCOWVIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'WXTK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'EPYNMYETXEE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'BYSYYRXNGIECRE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'AJXRYLWOXQCICK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'ICMEWNLRE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'LRRO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'RNSWEYYLSK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'JWJSQNMEQHBMS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'FZVPTNRMIEXJID'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'HQZHHGHCTAK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'LPLJPCQBDI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'FVBREOPIX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'PIXEFVPQFRIJHV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'FZASEJBOW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'JIWWRLLQAXQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'LOKQVMSBNTMDGF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'CDNLDQGLCSXPVJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'SXJHNJRQYFHGAV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'UPRPHKBEFDNXRI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'OXLWSYKSIFCIBM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'TNDRYHVJHHJPSJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'JIAXFPIWNOPKWD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'CBIRQSAQAL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'OGRQYIOLVROYKX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'YDCPHIMHHVTLWO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'ZRBHLKT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'QESGTSMCA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'XFNIDUJMHP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'SKTBVGTMGXRN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'IHHQQBRCWCQPLD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'NTOMT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'FHLTBCVEMTTNVB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'UQLBFGRFN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'KWLPXXEFY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'DFGP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'NNP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'YBNHHFJCCRRWFD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'EFZKIEQHDKOIJK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'HSLJYOSOUN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'ZUYHYBKBZPPUTQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'WYYZBTRNVGZP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'MOYX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'OUNARQLHCNJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'SPWGIOHEDSEGRE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'PVCSD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'EXDRPJYDEANJES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'VWAS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'HGLGVM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'CKMIPCOUXHXFME'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'MKRZDRENHKAECI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'AXMET'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'MVE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'OMWEBGVIKM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'VVBPKCQAK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'GIIBO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'DCNQXIEMQOQOST'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'FVU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'LURQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'TNHRQC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'UZFV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'BUSBVRMVDCQSTM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'UPTFBS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'SFNNGFE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'YFSWMBMLXRUXC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'MQYKUNP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YJRDYSV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'VWTKCOVSYBBXJE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'OMHMFEBAMFWZCR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'JLDENSKNOFW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'NRBNQRS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'SXTELVVPDHPNWB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'MJSWBUAZFGI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'TYHNLDBO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'LGNNJRSDOEH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'HCGSOOGQGCOL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'YWEFNHYJUHGGSX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'DEROAC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'TOUUIBP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'QWEPT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'XPCGDDSURLNKPP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'TKKCHWFMJJCZI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'QGNHXRRXDQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'NZYSL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'UUDIWNSLDPRKW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'EQHMKTSUVCWRID'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'JOJXU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'VOUVFXHL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'KUYUTWERIVPCFC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'LQXIUCXBTYKJW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'XKYGZOJRHBEL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'WSGR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'ETTEO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'KPFHJV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'QVTJFBLA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'TBHUYF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'IGHBAEZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'UHLOODXRBRNVVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'YTWMKBYVKYCKVF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'WSYBYIWEQVBGUI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CBIAYBBXYGY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'MWGQK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'KQSUQUWOVEHRK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'DGIVNOTHOSWGY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'QUBSDNO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'YSGPHBPLBHOKSY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'BPLEBVBRDEXASL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'MUYXBBSYDWIUOU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'PYNVHSUE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'ILVBAWXDQAGR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'VKQSGYY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'OXAOX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'XBATROSSP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'XHCTVGYBUEKBSJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'GAQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'HMUZBK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'NUDGRGPXLFLV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'VJGWCMJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'QXDJOUKGE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'NYXCOQGRY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'XRTGF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'MDNQTLKZTXWYIV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'ATWCWMXNMTLYIO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'URMRS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'ODYKGJJHICVDL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'YUDUYLSKMXGHNX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'HRBRMQXDEVQCDG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'PNZLTGTMYWXAUO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'YOXC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'JCWQROLPBSVUYO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'BNIBES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'AQYREQLF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'BOIIMNRJTFJKUF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'WUSJGEPWM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'OMXUYJGUBZZFFX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'IJDHGXL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'BCXXPSYBM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'EDGRRG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'VLFT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'OMHXYUJSJWE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'XXUFFFKDCPZTJQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YPHGHSPXVDAGXW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'CJJIECNSOVFGFI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'KLNYS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'GGJJGKDXVWYDEG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'FWGJQWFUGPJUYG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'KAKTUHMBQAWV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'CADWAPWIBPCSLX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'BCCZFEIFKAZHQQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'HVFL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'WCFHFQPRYJRWQL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'CYVFCTQJXL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'IHLIONFN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'ZOAGUGNUYZGQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'PGQOMKVSSPHBMJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'BLREH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'DNBQE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'GIOFQZMWTGTBNX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'EHTFGAHYBGMMX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'FUESYKLKQYIYEZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'PMS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'UBHMRJECLB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'EXJXWEWTJXTXYT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'OUBXQT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'NQMTHOLLBCBXRH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'YVFQSAENGFIKC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'FSUMDWKRC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'UJSUSJKLTNNDJE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'JSJUZBMQVTSQEM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'ORMNFHG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'GOHAN' 
	AND [m].[firstname] = 'YOUJJGCRSVL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'OUTCOURBJBT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'RMEX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'WLRGQIAKOENRYZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'QWEDPTXGOMEOJG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'TNGCNGNTYROKZH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'JONES' 
	AND [m].[firstname] = 'KVXGTSANXINMKQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'UMHTR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'ZZFNLJDLLMCCPI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'FXYLTNNJNHZYIJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'JFPTMMISOFCXJF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'FRHJNRG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'BMHTZFWTST'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'NVILPORB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'WKDUNWTEK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'VBYISREEO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'ENMA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'GQJYEGRIEKGNGS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'DGVEUCRWB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'KCFSTTTBIPTIMX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'RSOQXVOOO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'YXCWFGGLLBFYX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'UIDSFXWCSEEE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'RZWWVYFGTJDGKR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'FQTHSLSU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'FFLYFLIFBECNTJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'XFQFY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'GQIMZLJBGTAEIX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'XIDXRNMDWHWIQF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'TEFIHJSOLR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'WUTN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'VGFLPXSDEQDRG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'TVPMJLHBKYABVQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'HPNYMCRGAQLDQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'PAYSAUOJAPECY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'MWGFGLRZMIVNHR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'ZLIBDVPZQWRXXF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'WPXQEBPEO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'TIYAJMWHKYI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'MICAMINVPGADF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'UOFPTQDAWCGYGC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'EGNYVGPRYNSZFK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'JOMDQETSVIG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'XXLDBEOMOUS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'PZXLWHLET'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'BKLVMHUVXBHTMJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'JDWQLLAWXTTPPP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'YWJGXKRB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'NAEUXZQM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'SHHRYEBBMLPFJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'OLASAKNR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OZAYLJVQDJLWJA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'URNAHDVX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'UMJMWQNXUZSYCL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'IEHPEITBTKLGLF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'UQKIORLHBRTWIO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'UXUCGJDQNVWZXG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'BBYMQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'VWZLGWRH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'NELSON' 
	AND [m].[firstname] = 'SKLCJMRMLDTNNM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'RVJWKE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'OKEVJXUKPQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OHARWPCZPEMKQC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'JEKRBYTBOLJQHD'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'SZJHXXXKF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'PLHJQQXVTS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'XGOCAWSPPGTHKH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'SLOSKUHJUHOEBI'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'WVYNFHNQVKODVW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'BYWDJIYTSONLL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'WHDUHDK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'LELUUQUTOWKPDO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'FUWIKAWV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'FJGQRTUULCKNDY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'LUIWRGRYEASLFR'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'YKFCOCQBNINOYP'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'LSSSQHEWLX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'DKRNLRW'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'GGRYEMAKCHV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'CRWNQPFWNDILEU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'LING' 
	AND [m].[firstname] = 'GUBS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'MXMYVONKFIHIKO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'OHLYUFBDLE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'CHEN' 
	AND [m].[firstname] = 'NOVIBB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'MRYLQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'PVRYQYIUDAHIOO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'DGQLGJRVBLDPLA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'FLORINI' 
	AND [m].[firstname] = 'TPMJBGDYDFHAJB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'ISNKZVYCK'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'LGJT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'QEQBTYVFSXMKCC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'AWTIRGWU'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'XFWEXRCHNPJHMA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OVWDTQMG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'OLPHANT' 
	AND [m].[firstname] = 'SNFHRAXICFQMVZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'TJJMLTELLBQMAZ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'PFSRGBQOSOQFTV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'OGSGVCOYDHXSBC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'STEIN' 
	AND [m].[firstname] = 'QDIQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'MRQKWT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'XVOLDZNE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'KAFZFFEAEYOYXA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'GMFLOHMIES'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'TOLSKY' 
	AND [m].[firstname] = 'HKPRQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'TFKHBYKPHVDBLJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'WOLFMULE' 
	AND [m].[firstname] = 'TODXGCUHVEDZJE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'PGMIUWSM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'SEPTZVYJB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'PDQYOKGDBCPV'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'OKFDHTGXLCTWJM'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'XAVIER' 
	AND [m].[firstname] = 'TEMCEMYCHQHTIC'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'PIGY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'KAHRMANN' 
	AND [m].[firstname] = 'OKOFLIGZPGWJGL'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'SYVUGWUDGFLIUQ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'YEONG' 
	AND [m].[firstname] = 'EOSIOHS'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'QUINT' 
	AND [m].[firstname] = 'IGLODTGBPCJYOY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'SDMVPSRGKDFYXH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'INFANTE' 
	AND [m].[firstname] = 'GGOETBXFYMONGY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'PYTUXLVBFASPPF'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'MAKAI' 
	AND [m].[firstname] = 'ZLKHMWZNILTVFG'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'DORR' 
	AND [m].[firstname] = 'VKWJEFCBLRN'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'UNAKLET' 
	AND [m].[firstname] = 'AYVCXGXINQGO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'VANN' 
	AND [m].[firstname] = 'TQUBJUJWXVMEO'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'BARR' 
	AND [m].[firstname] = 'RNJ'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'HTJGNXPB'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'ORWKZHY'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'HAHN' 
	AND [m].[firstname] = 'WYHSSQX'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'RYAN' 
	AND [m].[firstname] = 'OOEUGUMUXHJNLH'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ZUCKER' 
	AND [m].[firstname] = 'OTHIE'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'EFLIN' 
	AND [m].[firstname] = 'FWZQECCTVKRIJA'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'PAYNTER' 
	AND [m].[firstname] = 'NVOJLGVERXECT'
GROUP BY [m].[lastname], [m].[firstname];
GO

SELECT 'Query 04', [m].[lastname], [m].[firstname], MIN ([c].[charge_amt]) 
FROM [dbo].[member] AS [m] 
	INNER JOIN [dbo].[charge] AS [c] 
		ON [m].[member_no] = [c].[member_no] 
WHERE [m].[lastname] = 'ANDERSON' 
	AND [m].[firstname] = 'SEIUVVCIO'
GROUP BY [m].[lastname], [m].[firstname];
GO

