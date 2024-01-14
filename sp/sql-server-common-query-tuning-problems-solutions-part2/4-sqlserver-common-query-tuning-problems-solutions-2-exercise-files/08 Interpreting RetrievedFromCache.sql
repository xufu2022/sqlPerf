USE [Credit];
GO

-- Test environment only, please
DBCC FREEPROCCACHE;
GO

-- Include actual execution plan
-- Retrieved from cache?
SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = 484
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2;
GO

-- Retrieved from cache?
EXEC sp_recompile 'charge';

SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = 484
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2;
GO

-- Retrieved from Cache?
SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = 484
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2
OPTION  ( RECOMPILE );
GO

-- Retrieved from cache?
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
 
EXEC sp_configure 'optimize for ad hoc workloads', 1;
RECONFIGURE;

-- Test environment only, please
DBCC FREEPROCCACHE;
GO

-- First time? Second time?
SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = 484
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2;
GO

-- Cleanup
EXEC sp_configure 'optimize for ad hoc workloads', 0; 
RECONFIGURE;
 
EXEC sp_configure 'show advanced options', 0; 
RECONFIGURE;