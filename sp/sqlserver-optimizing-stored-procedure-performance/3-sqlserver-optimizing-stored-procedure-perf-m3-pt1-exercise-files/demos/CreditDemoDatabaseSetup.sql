-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 1
-- Module: Creation, Compilation, and Invalidation
--   Demo: Credit Sample Database Setup  
-----------------------------------------------------------------------
 
----------------------------------
-- SERVER: Required Configuration
----------------------------------

-- We will discuss this option later in the course.
-- However, if it is set now, it will affect your 
-- results. 
-- NOTE: This is a server-wide setting; do NOT "play" 
-- with this script on a production server!

--SELECT [sc].* -- review "value in use"
--FROM [sys].[configurations] AS [sc]
--WHERE [sc].[name] = N'optimize for ad hoc workloads';
--GO

EXEC [sp_configure] N'optim', 0;
GO
-- Actual option: 'optimize for ad hoc workloads'
-- NOTE: sp_configure only needs enough of the option
-- to make it unique.

-- NOTE: If this fails and gives you the error:
-- Msg 15123, Level 16, State 1, Procedure sp_configure, Line 62
-- The configuration option 'optimize for ad hoc workloads' does not exist, or it may be an advanced option.

-- Then do this first:
--EXEC [sp_configure] 'show advanced', 1;
--GO

--RECONFIGURE;
--GO

RECONFIGURE;
GO

----------------------------------
-- Sample Database Setup
----------------------------------

-- Download the 2008 Credit sample database from
-- http://bit.ly/1bUdEcF and unzip into D:\Pluralsight.

-- Restore as follows:
USE [master];
GO

IF DATABASEPROPERTYEX (N'Credit', N'Version') > 0
BEGIN
	ALTER DATABASE [Credit] 
		SET SINGLE_USER
		WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [Credit];
END;
GO

RESTORE DATABASE [Credit]
FROM DISK = N'D:\Pluralsight\CreditBackup100.bak'
WITH
    MOVE N'CreditData'
		TO N'D:\Pluralsight\CreditData.mdf',
	MOVE N'CreditLog' 
		TO N'D:\Pluralsight\CreditLog.ldf';
GO

----------------------------------
-- DATABASE: Required Configuration
----------------------------------

ALTER DATABASE [Credit]
	SET PARAMETERIZATION SIMPLE;
GO

-----------------------------------------------------
-- Ensure compatibility mode at highest level
-----------------------------------------------------

--  90   SQL Server 2005
-- 100   SQL Server 2008 / 2008 R2
-- 110   SQL Server 2012
-- 120   SQL Server 2014

-- To see the current compatibility mode:
-- EXEC [sp_dbcmptlevel] N'Credit'; 
---GO  -- shows current level db as restored = 100

-- Set this to the highest version possible 
-- depending on your version of SQL Server
EXEC [sp_dbcmptlevel] N'Credit', 120;
GO