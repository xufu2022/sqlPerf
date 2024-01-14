-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 2
-- Module: Session Settings
--   Demo: SET Options and Performance-related Features
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
-- The objects created will be for leveraging indexed
-- views. Indexed views can be fantastic for improving
-- performance (especially around aggregates). However, 
-- this is not a detailed discussion on indexed views.
-- For more information, see the Indexed Views whitepaper
-- here: http://bit.ly/1Oq1Oe1

USE [Credit];
GO

CREATE VIEW [dbo].[SumOfAllChargesByMember]
	WITH SCHEMABINDING  -- required if you plan to index this view!
AS
SELECT [c].[member_no] AS [MemberNo], 
	COUNT_BIG(*) AS [NumberOfCharges], -- required when GROUP BY is in an indexed view!
	SUM([c].[charge_amt]) AS [TotalSales]
FROM [dbo].[charge] AS [c]
GROUP BY [c].[member_no];
GO

CREATE PROCEDURE [dbo].[GetSumOfAllChargesByMemberNo]
    (@member_no int)
AS
SELECT [sc].* 
FROM [dbo].[SumOfAllChargesByMember] AS [sc]
WHERE [sc].[MemberNo] = @member_no;
GO

SET STATISTICS IO ON;
-- Also, turn on Showplan (Query / Include Actual Execution Plan)
GO

-- Current plan: clustered index scan of CHARGE
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

CREATE UNIQUE CLUSTERED INDEX [SumofAllChargesIndex]
	ON [dbo].[SumOfAllChargesByMember] ([MemberNo]);
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-- Everything's working
--  * view created successfully
--  * index created successfully
--  * stored procedure created successfully
--  * performance is good (it's using the indexed view)

-- What if we mess with a required session setting:
SET QUOTED_IDENTIFIER OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-- Wait? What? I thought...
-- Nope - QUOTED_IDENTIFIER / ANSI_NULLS are SAVED
-- with the stored procedure's definition. 
-- The only thing that matters is how these are
-- set at the time the stored procedure is created!

SET ANSI_NULLS OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-- Same thing. ANSI_NULLS was saved with the 
-- procedure at the time of CREATE!


SET ARITHABORT OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-- Wait? What? I thought...
-- Nope - Remember, in compat mode 90 and higher
-- ARITHABORT is irrelevant. How is ANSI_WARNINGS 
-- set?

SET ANSI_PADDING OFF;
GO

-- Current plan: clustered index SCAN of CHARGE
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-- What are the session settings currently set:
SELECT [s].* 
FROM [sys].[dm_exec_sessions] AS [s]
WHERE [s].[session_id] = @@SPID;
GO

-- Even better - as an admin, look across all user sessions:
SELECT [s].* 
FROM [sys].[dm_exec_sessions] AS [s]
WHERE [s].[is_user_process] = 1;
GO

CREATE PROCEDURE [dbo].[InsertNewCharge]
    (@member_no int)
AS
INSERT INTO [dbo].[charge]
           ([member_no]
           ,[provider_no]
           ,[category_no]
           ,[charge_dt]
           ,[charge_amt]
           ,[statement_no]
           ,[charge_code])
     VALUES
           (@member_no
           ,(SELECT provider_no 
                FROM provider 
                WHERE ISNULL(NULLIF((datepart(ms, (getdate()))) % 501, 0), 1) 
                    = provider_no)
           ,(SELECT category_no
                FROM category
                WHERE ISNULL(NULLIF((datepart(ms, (getdate()))) % 11, 0), 1) 
                    = category_no)
           ,SYSDATETIME()
           ,CONVERT(money, datepart(ns, SYSDATETIME()))
           , (SELECT MAX(statement_no) FROM statement WHERE member_no = @member_no)
           , '')
RETURN SCOPE_IDENTITY();
GO

DECLARE @ChargeNumber   int
EXEC @ChargeNumber = [dbo].[InsertNewCharge] 1234
SELECT @ChargeNumber;
GO -- Fails!

-- 'ANSI_NULLS, QUOTED_IDENTIFIER, ANSI_PADDING'.

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
GO

DECLARE @ChargeNumber   int
EXEC @ChargeNumber = [dbo].[InsertNewCharge] 1234
SELECT @ChargeNumber;
GO -- Session is correct but the procedure still isn't

ALTER PROCEDURE [dbo].[InsertNewCharge]
    (@member_no int)
AS
INSERT INTO [dbo].[charge]
           ([member_no]
           ,[provider_no]
           ,[category_no]
           ,[charge_dt]
           ,[charge_amt]
           ,[statement_no]
           ,[charge_code])
     VALUES
           (@member_no
           ,(SELECT provider_no 
                FROM provider 
                WHERE ISNULL(NULLIF((datepart(ms, (getdate()))) % 501, 0), 1) 
                    = provider_no)
           ,(SELECT category_no
                FROM category
                WHERE ISNULL(NULLIF((datepart(ms, (getdate()))) % 11, 0), 1) 
                    = category_no)
           ,SYSDATETIME()
           ,CONVERT(money, datepart(ns, SYSDATETIME()))
           , (SELECT MAX(statement_no) FROM statement WHERE member_no = @member_no)
           , '')
RETURN SCOPE_IDENTITY();
GO

DECLARE @ChargeNumber   int
EXEC @ChargeNumber = [dbo].[InsertNewCharge] 1234
SELECT @ChargeNumber;
GO  -- Success!

SET ANSI_WARNINGS OFF;
GO

DECLARE @ChargeNumber   int
EXEC @ChargeNumber = [dbo].[InsertNewCharge] 1234
SELECT @ChargeNumber;
GO  
-- Failed even though it was set when the proc was
-- created!

-- What about creating another index on the view?
CREATE INDEX [SumofAllChargesDesc]
	ON [dbo].[SumOfAllChargesByMember] ([TotalSales] DESC);
GO

-- 'ANSI_WARNINGS'
SET ANSI_WARNINGS ON;
GO

DECLARE @ChargeNumber   int
EXEC @ChargeNumber = [dbo].[InsertNewCharge] 1234
SELECT @ChargeNumber;
GO   -- Success!

CREATE INDEX [SumofAllChargesDesc]
	ON [dbo].[SumOfAllChargesByMember] ([TotalSales] DESC);
GO  -- Success!

-- Final verification of session settings at CREATION
SELECT OBJECTPROPERTY(OBJECT_ID('[dbo].[Charge]'), 'IsQuotedIdentOn') 
            AS [IsQuotedIdentifierOn]
    , OBJECTPROPERTY(OBJECT_ID('[dbo].[Charge]'), 'IsAnsiNullsOn') 
            AS [IsANSINullsOn]
    , OBJECTPROPERTY(OBJECT_ID('[dbo].[SumOfAllChargesByMember]'), 'IsQuotedIdentOn') 
            AS [IsQuotedIdentifierOn]
    , OBJECTPROPERTY(OBJECT_ID('[dbo].[SumOfAllChargesByMember]'), 'IsAnsiNullsOn') 
            AS [IsANSINullsOn]
    , OBJECTPROPERTY(OBJECT_ID('[dbo].[InsertNewCharge]'), 'IsQuotedIdentOn') 
            AS [IsQuotedIdentifierOn]
    , OBJECTPROPERTY(OBJECT_ID('[dbo].[InsertNewCharge]'), 'IsAnsiNullsOn') 
            AS [IsANSINullsOn];
GO

-- So, we care about BOTH creation and runtime session settings. 
-- CONSISTENCY IS THE MOST IMPORTANT!

-- One thing you COULD consider is setting the session
-- settings INSIDE the procedure BUT, ONLY for these
-- 5 options:
    -- ANSI_WARNINGS (as long as this is ON then it
    --               doesn't matter how ARITHABORT
    --               is set if your compat mode 90 or higher)
    -- ARITHABORT
    -- ANSI_PADDING
    -- CONCAT_NULL_YIELDS_NULL
    -- NUMERIC_ROUNDABORT

SET ANSI_WARNINGS OFF;
SET ANSI_PADDING OFF;
SET NUMERIC_ROUNDABORT ON;
SET CONCAT_NULL_YIELDS_NULL OFF;
GO

ALTER PROCEDURE [dbo].[GetSumOfAllChargesByMemberNo]
    (@member_no int)
AS
SET ANSI_WARNINGS ON;
SET ANSI_PADDING ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET NUMERIC_ROUNDABORT OFF;
SELECT [sc].* 
FROM [dbo].[SumOfAllChargesByMember] AS [sc]
WHERE [sc].[MemberNo] = @member_no;
GO

EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

SET ANSI_WARNINGS ON;
SET ANSI_PADDING ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET NUMERIC_ROUNDABORT OFF;
GO

EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

-----------------------------------------------------
-- Clean up (NOT YET - only if you're playing with
--           this script will you need these)
-----------------------------------------------------
--IF OBJECT_ID('[dbo].[SumOfAllChargesByMember]') IS NOT NULL
--    DROP VIEW [dbo].[SumOfAllChargesByMember];
--GO

--IF OBJECT_ID('[dbo].[GetSumOfAllChargesByMemberNo]') IS NOT NULL
--    DROP PROCEDURE [dbo].[GetSumOfAllChargesByMemberNo];
--GO

--IF OBJECT_ID('[dbo].[InsertNewCharge]') IS NOT NULL
--    DROP PROCEDURE [dbo].[InsertNewCharge];
--GO