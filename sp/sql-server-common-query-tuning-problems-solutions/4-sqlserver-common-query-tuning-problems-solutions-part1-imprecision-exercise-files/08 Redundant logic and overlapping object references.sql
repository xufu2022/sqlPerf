USE [Credit];
GO

-- Include actual execution plan
-- What is the I/O?
SET STATISTICS IO ON;
GO

SELECT  [member_no], [lastname], [firstname], [middleinitial],
		[street], [city], [state_prov], [mail_code], [phone_no],
		[region_no], [expr_dt], [member_code]
FROM    [dbo].[basic_member] 
WHERE   [member_no] NOT IN ( SELECT  [member_no]
                             FROM    [dbo].[corp_member] );

SET STATISTICS IO OFF;

-- What is the definition of the basic_member view?
EXEC sp_helptext 'basic_member';
GO

-- Compare this to the simplified version
SET STATISTICS IO ON;
GO

SELECT  [member_no], [lastname], [firstname], [middleinitial],
		[street], [city], [state_prov], [mail_code], [phone_no],
		[region_no], [expr_dt], [member_code]
FROM    [dbo].[basic_member];


SELECT  [member_no], [lastname], [firstname], [middleinitial],
		[street], [city], [state_prov], [mail_code], [phone_no],
		[region_no], [expr_dt], [member_code]
FROM    [dbo].[basic_member]
WHERE   [member_no] NOT IN ( SELECT  [member_no]
                             FROM    [dbo].[corp_member] );

SET STATISTICS IO OFF;

-- Takeaway:
--  Understand exactly what you're querying and 
--  if using objects like views, minimize overlap and
--  redundancy as the optimizer can't always
--  do it for you, and this can result in increased
--  overhead
