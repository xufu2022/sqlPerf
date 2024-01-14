USE [Credit];
GO

-- Of course, no discussion of query tuning can ignore the 
-- critical role of indexing (seeks, scans).

-- Much of this discussion will be covered collectively
-- by the SQLskills team, but some general patterns should
-- be covered in this context...

-- Include actual plan
-- Index Scan + predicate (but NOT a seek predicate)
SELECT  [provider_no]
FROM    [dbo].[provider]
WHERE   [provider_name] = 'Prov. Imperial';

-- Now let's create a supporting index
CREATE NONCLUSTERED INDEX [IX_provider_provider_name]
ON  [dbo].[provider]([provider_name]);
GO

-- Index Seek + Seek Predicate
SELECT  [provider_no]
FROM    [dbo].[provider]
WHERE   [provider_name] = 'Prov. Imperial';

-- What is the seek predicate?
-- Where is the filter applied?
SELECT  [region_no] ,
        COUNT(*)
FROM    [dbo].[provider]
WHERE   [region_no] IN ( 2, 3, 7 )
GROUP BY [region_no]
HAVING  COUNT(*) > 40;
GO

DROP INDEX [IX_provider_provider_name] 
ON [dbo].[provider];
GO
