-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 2
-- Module: Special Considerations
--   Demo: Resource Governor and recompilation
-----------------------------------------------------------------------

USE [Credit];
GO

SELECT SUSER_NAME(); -- Should return PaulTest
GO

SET STATISTICS IO ON;
-- Also, turn on Showplan (Query / Include Actual Execution Plan)
GO

EXEC GetMemberInfo 'Randal'
GO