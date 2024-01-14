-----------------------------------------------------------------
-- Course: SQL Server: Optimizing Ad Hoc Statement Performance
--  Setup: Demo Database Setup for Credit Sample Database
-----------------------------------------------------------------
 
----------------------------------
-- SERVER: Required Configuration
----------------------------------

-- We will discuss this option later in the course.
-- However, if it is set now, it will affect your 
-- results. 
-- NOTE: This is a server-wide setting; do NOT "play" 
-- with this script on a production server!

SELECT [sc].* -- review "value in use"
FROM [sys].[configurations] AS [sc]
WHERE [sc].[name] = N'optimize for ad hoc workloads';
GO

EXEC [sp_configure] N'optim', 0;
-- Actual option: 'optimize for ad hoc workloads'
-- NOTE: sp_configure only needs enough of the option
-- to make it unique.
GO

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

USE [Credit];
GO