USE [Credit];
GO

-- How much overlap between these two sets?
SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member]
INTERSECT
SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member2];

-- Considering no overlap, what if we use UNION instead of
-- UNION ALL?
SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member]
UNION
SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member2];

SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member]
UNION ALL
SELECT  [member_no] ,
        [lastname] ,
        [firstname] ,
        [middleinitial] ,
        [street] ,
        [city] ,
        [state_prov] ,
        [country] ,
        [mail_code] ,
        [phone_no] ,
        [issue_dt] ,
        [expr_dt] ,
        [region_no] ,
        [corp_no] ,
        [prev_balance] ,
        [curr_balance] ,
        [member_code]
FROM    [dbo].[member2];

-- Takeaway:
-- If you don't need de-duplication, UNION ALL
-- With the additional memory grants, consider concurrency

