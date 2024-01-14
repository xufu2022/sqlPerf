-----------------------------------------------------------------------
-- Course: SQL Server: Optimizing Stored Procedure Performance - Part 2
-- Module: Special Considerations
--   Demo: Resource Governor and recompilation
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

-- Additionally, create the ProcedurePlanState procedure
-- Open Script: ProcedurePlanState.sql
-- Execute the ENTIRE script

-----------------------------------------------------
-- IMPORTANT DEMO INFORMATION 
-----------------------------------------------------
-- This demo is NOT about security nor is it about
-- setting up resource governor. Instead, it's about
-- the side effect of having multiple resource governor
-- groups / pools. This example simplifies security
-- using SQL Authentication (for easier repro) when
-- Windows Authentication is preferred in production.  

-- Enable SQL Server and Windows Authentication Mode
-- Restart SQL Server

USE [master];
GO

-- Examine the current run-time configuration
SELECT * 
FROM [sys].[dm_resource_governor_configuration];
GO

-- Define two resource pools, one with 30% CPU max, and the
-- other with 70%
CREATE RESOURCE POOL [MarketingPool]
WITH (MAX_CPU_PERCENT = 30);
GO

CREATE RESOURCE POOL [DevelopmentPool]
WITH (MAX_CPU_PERCENT = 70);
GO

-- Look at our run-time configuration
SELECT * 
FROM [sys].[dm_resource_governor_resource_pools];
GO

-- But they are defined, just not run-time yet
SELECT * 
FROM [sys].[resource_governor_resource_pools];
GO

-- Need to reconfigure
ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

SELECT * FROM [sys].[dm_resource_governor_resource_pools];
GO

-- Add two workload groups which make use of the two
-- defined resource pools
CREATE WORKLOAD GROUP [MarketingGroup]
USING [MarketingPool];
GO

CREATE WORKLOAD GROUP [DevelopmentGroup]
USING [DevelopmentPool];
GO

-- Look at our configuration
SELECT * 
FROM [sys].[dm_resource_governor_workload_groups];
GO

-- But they are defined, just not run-time yet
SELECT * 
FROM [sys].[resource_governor_workload_groups];
GO

-- Need to reconfigure again
ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

SELECT * 
FROM [sys].[dm_resource_governor_workload_groups];
GO

-- Create a couple of "random" logins
CREATE LOGIN [KimberlyTest] 
WITH PASSWORD=N'Kimberly123' 
, DEFAULT_DATABASE=[Credit];
GO

CREATE LOGIN [PaulTest] 
WITH PASSWORD=N'Paul456' 
, DEFAULT_DATABASE=[Credit];
GO

-- Define a simple classifier function
IF OBJECT_ID ('dbo.PoolByUser_ClassifierFN') IS NOT NULL
	DROP FUNCTION [dbo].[PoolByUser_ClassifierFN];
GO

CREATE FUNCTION [dbo].[PoolByUser_ClassifierFN] ()
RETURNS SYSNAME WITH SCHEMABINDING
AS
BEGIN
	DECLARE @GroupName SYSNAME;
	IF SUSER_NAME() = 'KimberlyTest'
		SET @GroupName = 'DevelopmentGroup';
	ELSE 
    IF  SUSER_NAME() = 'PaulTest'
		SET @GroupName = 'MarketingGroup';
	ELSE 
        SET @GroupName = 'Default';
	RETURN @GroupName;
END;
GO

-- Register the classifier function. This enables the
-- resource governor
ALTER RESOURCE GOVERNOR
	WITH (CLASSIFIER_FUNCTION = [dbo].[PoolByUser_ClassifierFN]);
GO

ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

-- Look at our configuration again
SELECT OBJECT_NAME([classifier_function_id]) AS [FunctionName]
    , * 
FROM [sys].[dm_resource_governor_configuration];
GO

-- Now that RG is setup - you can see the effects on
-- the plan cache!

---------------------------------------------------------------
-- When you've run through this entire demo, come back to this
-- cleanup script and remove all of these groups and logins.
---------------------------------------------------------------
USE master;
GO

ALTER RESOURCE GOVERNOR DISABLE;
GO

DROP WORKLOAD GROUP [MarketingGroup];
DROP WORKLOAD GROUP [DevelopmentGroup];
GO

DROP RESOURCE POOL [MarketingPool];
DROP RESOURCE POOL [DevelopmentPool];
GO

ALTER RESOURCE GOVERNOR WITH (CLASSIFIER_FUNCTION=NULL);
DROP FUNCTION [dbo].[PoolByUser_ClassifierFN];
GO

ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

----------------------------------------------
-- Might want to play around with how
-- these logins work when there's no 
-- Resource Governor setup
----------------------------------------------

DROP LOGIN [KimberlyTest];
DROP LOGIN [PaulTest];
GO

-- If you weren't allowing SQL Server Authentication then make sure
-- to reset your Security to Windows Authentication Mode (ONLY)
-- Restart SQL Server
