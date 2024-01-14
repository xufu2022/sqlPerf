USE [Credit];
GO

-- Let's step through each plan individually and then 
-- re-execute and look at sys.dm_exec_query_stats

-- Test system only, please
DBCC FREEPROCCACHE;
GO

-- Query 1: No Cardinality Estimate Issue
SELECT	[r].[region_name], [m].[lastname], [m].[firstname],
		[m].[member_no]
FROM	[dbo].[member] AS [m]
		INNER JOIN [dbo].[region] AS [r]
		ON [r].[region_no] = [m].[region_no]
WHERE   [r].[region_no] = 9;
GO

-- Query 2: Cardinality Estimate Issue, Leaf-Level + Final Operator
DECLARE @Column INT = 2 ,
    @Value INT = 10;
 
SELECT  [m].[member_no], [m].[street], [m].[city], [c].[charge_no],
        [c].[provider_no], [c].[category_no], [c].[charge_dt],
        [c].[charge_amt], [c].[charge_code]
FROM    [dbo].[charge] AS [c]
        INNER JOIN [dbo].[member] AS [m]
		ON [m].[member_no] = [c].[member_no]
WHERE   CHOOSE(@Column, [c].[provider_no], [c].[category_no])
			= @Value;
GO

-- Query 3: Cardinality Estimate Leaf-Level Skew and No Skew
-- for Root Operator
SELECT TOP ( 1000 )
        [m].[member_no], [m].[lastname], [m].[firstname],
		[r].[region_no], [r].[region_name], [p].[provider_name],
		[c].[category_desc], [ch].[charge_no], [ch].[provider_no],
		[ch].[category_no], [ch].[charge_dt], [ch].[charge_amt],
		[ch].[charge_code]
FROM    [dbo].[provider] AS [p]
        INNER JOIN [dbo].[charge] AS [ch]
		ON [p].[provider_no] = [ch].[provider_no]
        INNER JOIN [dbo].[member] AS [m]
		ON [m].[member_no] = [ch].[member_no]
        INNER JOIN [dbo].[region] AS [r]
		ON [r].[region_no] = [m].[region_no]
        INNER JOIN [dbo].[category] AS [c]
		ON [c].[category_no] = [ch].[category_no];
GO

-- Detecting issues
SELECT  [t].text, [p].[query_plan], [s].[last_execution_time],
        [p].[query_plan].value(
			'(//@EstimateRows)[1]', 'varchar(128)')
			AS [estimated_rows],
        [s].[last_rows]
FROM    sys.[dm_exec_query_stats] AS [s]
        CROSS APPLY sys.[dm_exec_sql_text](sql_handle) AS [t]
        CROSS APPLY sys.[dm_exec_query_plan](plan_handle) AS [p]
WHERE   DATEDIFF(mi, [s].[last_execution_time], GETDATE()) < 1
GO
