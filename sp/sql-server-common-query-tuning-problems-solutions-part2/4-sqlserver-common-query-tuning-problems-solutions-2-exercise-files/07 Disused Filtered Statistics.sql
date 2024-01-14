USE [Credit];
GO

CREATE STATISTICS [fstat_charge_provider_no]
ON [dbo].[charge] ([member_no], [category_no])
WHERE [provider_no] = 484;
GO

SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = 484
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2
OPTION  ( QUERYTRACEON 3604, QUERYTRACEON 9204 ); -- Undocumented
GO

DECLARE @provider_no INT = 484;
 
SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = @provider_no
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2
OPTION  ( QUERYTRACEON 3604, QUERYTRACEON 9204 );
GO

-- With @provider_no, we can't be certain

-- Will this work?
DECLARE @provider_no INT = 484;
 
SELECT DISTINCT
        [c].[member_no] ,
        [c].[category_no] ,
        [c].[provider_no]
FROM    [dbo].[charge] AS [c]
WHERE   [c].[provider_no] = @provider_no
        AND [c].[member_no] = 9527
        AND [c].[category_no] = 2
OPTION  ( QUERYTRACEON 3604, QUERYTRACEON 9204, 
		  RECOMPILE );
GO

-- But - remember, RECOMPILE has overhead as well...

-- Cleanup
DROP STATISTICS [dbo].[charge].[fstat_charge_provider_no];
GO
