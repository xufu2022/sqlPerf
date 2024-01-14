-- Execute the following query in a separate query window
USE [Credit];
GO

SET STATISTICS XML ON;

DECLARE @ExecuteCounter SMALLINT = 10;
WHILE @ExecuteCounter > 0
    BEGIN

        SELECT  [c].[charge_no], [c].[member_no], [c].[provider_no],
                [c].[category_no], [c].[charge_dt],
				[c].[charge_amt], [c].[statement_no],
				[c].[charge_code], [m].[city]
        FROM    [dbo].[charge] AS [c]
                INNER JOIN [dbo].[member] AS [m]
				ON [c].[member_no] = [m].[member_no]
        WHERE   [c].[statement_no] BETWEEN 1 AND 10000000
        ORDER BY [m].[city], [c].[charge_code]
        OPTION  ( MAXDOP 1 );

    END

SET STATISTICS XML OFF;

-- While the prior query is executing, execute the following query
SELECT  [session_id], [node_id], [physical_operator_name],
        [estimate_row_count], [row_count]
FROM    [sys].[dm_exec_query_profiles]
ORDER BY [node_id];