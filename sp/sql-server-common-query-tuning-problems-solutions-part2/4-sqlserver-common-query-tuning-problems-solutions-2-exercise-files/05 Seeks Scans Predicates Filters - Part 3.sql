USE [Credit];
GO

-- Covering index
CREATE NONCLUSTERED INDEX [payment_member_link] 
ON [dbo].[payment] 
(
	[member_no] ASC
)
INCLUDE ( [payment_dt]) 
WITH (DROP_EXISTING = ON) ON [PRIMARY];
GO

/* Enable ACTUAL show plan */

-- Singleton or Range Scan Index Seek?
SELECT [payment_dt]
FROM [dbo].[payment]
WHERE [member_no] = 2017;

SELECT  [singleton_lookup_count] ,
        [range_scan_count]
FROM    [sys].[dm_db_index_operational_stats]
(DB_ID(), OBJECT_ID('payment'), 3,
                                          NULL);
-- Singleton or Range Scan Index Seek?
SELECT  [payment_no]
FROM    [dbo].[payment]
WHERE   [payment_no] = 6472;

SELECT	[singleton_lookup_count], 
		[range_scan_count]
FROM [sys].[dm_db_index_operational_stats]
(DB_ID(), OBJECT_ID('payment'), 2, NULL);

-- Singleton or Range Scan Index Seek?
SELECT  [payment_dt]
FROM    [dbo].[payment]
WHERE   [member_no] BETWEEN 1000 AND 2000;

SELECT [singleton_lookup_count], [range_scan_count]
FROM [sys].[dm_db_index_operational_stats]
(DB_ID(), OBJECT_ID('payment'), 3, NULL);

-- Cleanup
CREATE NONCLUSTERED INDEX [payment_member_link] 
ON [dbo].[payment] 
(
	[member_no] ASC
)
--INCLUDE ( [payment_dt]) 
WITH (DROP_EXISTING = ON) ON [PRIMARY]
GO