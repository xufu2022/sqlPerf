/*******************************************************************************
********************** GUID Performance    *************************************
********************************************************************************/

-- At the performance level ? 

USE StructuredIndex
GO

SET NOCOUNT ON;
GO

-- Creation of tables with an index clustered on the column in NEWID

CREATE TABLE Table_GUID (
	c1 UNIQUEIDENTIFIER DEFAULT NEWID (), ---- NEWID
    c2 DATETIME DEFAULT GETDATE (),
	c3 CHAR (400) DEFAULT 'a',
	c4 VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX IDX_Table_GUID_Cluster ON
	Table_GUID (c1);

GO

-- Creation of tables with an index clustered on the column in NEWSEQUENTIALID

CREATE TABLE Table_NEWSEQUENTIALID (
	c1 UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID () , ---- NEWSEQUENTIALID
	c3 CHAR (400) DEFAULT 'a',
	c4 VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX IDX_Table_NEWSEQUENTIALID_Cluster ON
	Table_NEWSEQUENTIALID (c1);

GO
-- Creation of the table with an index clustered on the column in INT

CREATE TABLE Table_INT(
	c1 INT identity(1,1), ----IDENTITY
    c2 DATETIME DEFAULT GETDATE (),
	c3 CHAR (400) DEFAULT 'a',
	c4 VARCHAR(MAX) DEFAULT 'b');
CREATE CLUSTERED INDEX IDX_Table_INT_Cluster ON
	Table_INT (c1);
GO

-- Let's create fragmentation

DECLARE @a INT;
SELECT @a = 1;
WHILE (@a < 25000)
BEGIN
	INSERT INTO Table_GUID DEFAULT VALUES;
	INSERT INTO Table_NEWSEQUENTIALID DEFAULT VALUES;
	INSERT INTO Table_INT DEFAULT VALUES;
	SELECT @a = @a + 1;
END;
GO

-- Let's look at fragmentation

SELECT
	OBJECT_NAME (ips.[object_id]) AS 'Object Name',
	si.name AS 'Index Name',
	ROUND (ips.avg_fragmentation_in_percent, 2) AS 'Fragmentation',
	ips.page_count AS 'Pages',
	ROUND (ips.avg_page_space_used_in_percent, 2) AS 'Page Density'
FROM sys.dm_db_index_physical_stats (
	DB_ID ('StructureIndex'),
	NULL,
	NULL,
	NULL,
	'DETAILED') ips
CROSS APPLY sys.indexes si
WHERE
	si.object_id = ips.object_id
	AND si.index_id = ips.index_id
	AND ips.index_level = 0
	and si.name is not null
	and OBJECT_NAME (ips.[object_id]) in ('Table_NEWSEQUENTIALID','Table_GUID','Table_INT')
	order by 3 desc
GO

set statistics io on

select  * from Table_NEWSEQUENTIALID
select  * from Table_GUID

drop table Table_INT