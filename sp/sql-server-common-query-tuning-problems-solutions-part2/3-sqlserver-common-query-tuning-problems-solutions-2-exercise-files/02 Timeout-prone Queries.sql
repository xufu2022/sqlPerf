USE [Credit];
GO

-- Chances are your OLTP-centric applications have low timeout
-- settings

-- For query tuning explorations, look for timeout-prone code

-- Change execution-timeout to 10 seconds

CREATE PROCEDURE [dbo].[TimeOutProne]
AS
    WAITFOR DELAY '00:00:09';
GO
 
CREATE PROCEDURE [dbo].[TimeOutProneV2]
AS
    WAITFOR DELAY '00:00:10';
GO

EXEC [dbo].[TimeOutProne];
GO
  
EXEC [dbo].[TimeOutProneV2];
GO

-- Which plans will we see?
-- Also available in sys.dm_exec_query_stats
SELECT  [database_id] ,
        OBJECT_NAME([object_id]) AS [object_name] ,
        [max_elapsed_time] ,
        [plan_handle] ,
        [sql_handle]
FROM    [sys].[dm_exec_procedure_stats]
-- microseconds, "but only accurate to milliseconds"
WHERE   [max_elapsed_time] > 8000000;  

-- Don't forget to change your execution-timeout back
-- to the original value!

USE [Credit];
GO

DROP PROCEDURE [dbo].[TimeOutProne];
DROP PROCEDURE [dbo].[TimeOutProneV2];
GO