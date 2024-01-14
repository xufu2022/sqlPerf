-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 2
-- Module: Session Settings (Section 2)
--   Demo: Plan cache attributes and execute state
-----------------------------------------------------------------------

-----------------------------------------------------
-- SETUP
-----------------------------------------------------

-- This is a continuation from the prior demo

-- Additionally, create the ProcedurePlanState procedure
-- Open Script: ProcedurePlanState.sql
-- Execute the ENTIRE script
--
-- Test that it's setup correctly here:
USE [Credit];
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO

EXEC [sp_helptext] 'dbo.GetSumOfAllChargesByMemberNo';
GO

-----------------------------------------------------
-- Demo Overview
-----------------------------------------------------
-- What happens if sessions settings differ between
-- applications or even throughout the execution
-- lifetime of a session?

SET STATISTICS IO ON;
-- Also, turn on Showplan (Query / Include Actual Execution Plan)
GO

-- Let's recreate the original procedure (without any forced session settings):
ALTER PROCEDURE [dbo].[GetSumOfAllChargesByMemberNo]
    (@member_no int)
AS
SELECT [sc].* 
FROM [dbo].[SumOfAllChargesByMember] AS [sc]
WHERE [sc].[MemberNo] = @member_no;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO

---------------------------------------------
-- Session setting: QUOTED_IDENTIFIER
---------------------------------------------
SET QUOTED_IDENTIFIER OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- Session setting has no effect on execution 
-- (1 plan in cache, count = 2)
-- Why, only the state at CREATE time is important
-- this is what the indication bit shows. 

SET QUOTED_IDENTIFIER ON;
GO


---------------------------------------------
-- Session setting: ANSI_NULLS
---------------------------------------------
SET ANSI_NULLS OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- Session setting has no effect on execution 
-- (1 plan in cache, count = 3)
-- Again, saved with the sp (from CREATE time)

SET ANSI_NULLS ON;
GO


---------------------------------------------
-- Session setting: ARITHABORT
---------------------------------------------
SET ARITHABORT OFF;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting caused a recompilation with
-- a new plan to go into cache with different
-- SetOpts (more details in a minute)
-- But, not a new plan?
-- ARITHABORT is meaningless if ANSI_WARNINGS is ON

SET ARITHABORT ON;
GO


---------------------------------------------
-- Session setting: ANSI_NULL_DFLT_OFF
---------------------------------------------
SET ANSI_NULL_DFLT_OFF ON;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting caused a recompilation with
-- a new plan to go into cache with different SetOpts 

-- However, even though it IS recompiling, it's NOT
-- getting a new plan?!
-- Why? This SET option is not one of those required
-- for the performance-related features.

SET ANSI_NULL_DFLT_OFF OFF;
SET ANSI_NULL_DFLT_ON ON;
GO


---------------------------------------------
-- Session setting: ANSI_PADDING
---------------------------------------------
SET ANSI_PADDING OFF;
GO

-- Current plan: clustered index SCAN of CHARGE
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting caused a recompilation with
-- a new plan to go into cache with different SetOpts 

-- And, this time we also got a different plan!
-- SQL Server can't leverage the indexed view because
-- ANSI_PADDING is a requirement for this 
-- performance-related feature.

SET ANSI_PADDING ON;
GO


---------------------------------------------
-- Session setting: ANSI_WARNINGS
---------------------------------------------
SET ANSI_WARNINGS OFF;
GO

-- Current plan: clustered index SCAN of CHARGE
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting also caused a recompilation with
-- a new plan to go into cache with different SetOpts 

-- SQL Server can't leverage the indexed view because
-- ANSI_WARNINGS is a requirement for this 
-- performance-related feature.

SET ANSI_WARNINGS ON;
GO


---------------------------------------------
-- Session setting: CONCAT_NULL_YIELDS_NULL
---------------------------------------------
SET CONCAT_NULL_YIELDS_NULL OFF;
GO

-- Current plan: clustered index SCAN of CHARGE
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting also caused a recompilation with
-- a new plan to go into cache with different SetOpts 

-- SQL Server can't leverage the indexed view because
-- CONCAT_NULL_YIELDS_NULL is a requirement for this 
-- performance-related feature.

SET CONCAT_NULL_YIELDS_NULL ON;
GO


---------------------------------------------
-- Session setting: DATEFIRST
---------------------------------------------
SET DATEFIRST 2;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- This session setting caused a recompilation with
-- a new plan to go into cache with different SetOpts 

-- However, even though it IS recompiling, it's back
-- to the more efficient plan...
-- Why? Even though DATEFIRST can affect many functions
-- it could not change the usage of an indexed view 
-- because the functions that would be affected by 
-- DATEFIRST could not be referenced in an indexed 
-- view because they're not deterministic. 
-- Check out that whitepaper on Indexed Views for more
-- information.

SET DATEFIRST 7;
GO


---------------------------------------------
-- Session setting: DATEFORMAT
---------------------------------------------
SET DATEFORMAT dmy;
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- same reasons as DATEFIRST

SET DATEFORMAT mdy;
GO


---------------------------------------------
-- Session setting: LANGUAGE
---------------------------------------------
SET LANGUAGE 'French';
GO

-- Current plan: clustered index SEEK of SumOfAllChargesByMember
EXEC [dbo].[GetSumOfAllChargesByMemberNo] 1234;
GO

EXEC [dbo].[ProcedurePlanState] 'dbo', 'GetSumOfAllChargesByMemberNo';
GO
-- same reasons as DATEFIRST

SET LANGUAGE 'English';
GO