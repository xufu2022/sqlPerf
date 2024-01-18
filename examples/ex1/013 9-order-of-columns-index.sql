/*******************************************************************************
********************** Indexing and column order      *************************
********************************************************************************/

-- Is there a performance impact between indexing and column order? 
-- We'll look at that:

-- Creation of the table : 



USE tempdb
GO
IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[OrderTable]') AND type in (N'U'))
	DROP TABLE [dbo].[OrderTable]
GO
CREATE TABLE OrderTable (ID INT, 
						 ID1 VARCHAR(4),
						 ID2 VARCHAR(4),
						 FirstName VARCHAR(100), 
						 LastName VARCHAR(100), 
						 City VARCHAR(100))
GO
-- Insert datas : 
INSERT INTO OrderTable (ID, ID1, ID2, FirstName,LastName,City)
SELECT TOP 100000 ROW_NUMBER() OVER (ORDER BY a.name) RowID,
			LEFT(NEWID(),4), LEFT(NEWID(),3),
					'Bob', 
					CASE WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%2 = 1 THEN 'Smith' 
					ELSE 'Brown' END,
					CASE WHEN ROW_NUMBER() OVER (ORDER BY a.name)%10 = 1 THEN 'New York' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 5 THEN 'San Marino' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 3 THEN 'Los Angeles' 
						WHEN ROW_NUMBER() OVER (ORDER BY a.name)%427 = 1 THEN 'Salt Lake City'
					ELSE 'Houston' END
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
GO
INSERT INTO OrderTable (ID, ID1, ID2, FirstName,LastName,City)
SELECT 100001,'A2C4','E67','FirstNameTest','SecondNameTest','CityNameTest'
GO

-- Let's activate the execution plan and run the SELECT:
SELECT ID, ID1, ID2
FROM OrderTable
WHERE ID = 100001 
GO

-- We start in SCAN table, logically there is no index: 

-- Creation of a clustered index on ID :

CREATE CLUSTERED INDEX [IX_OrderTable_ID] ON [dbo].[OrderTable]
(
	[ID] ASC
) ON [PRIMARY]
GO

--  SELECT : 

SELECT ID, ID1, ID2
FROM OrderTable
WHERE ID = 100001 
GO

-- SEEK index on the ID 

-- And if we play the two SELECTs with the order of the ID1 and ID2 columns
SELECT ID, ID1, ID2
FROM OrderTable
WHERE ID1 = 'A2C4' AND ID2 = 'E67'
GO
SELECT ID, ID1, ID2
FROM OrderTable
WHERE ID2 = 'E67' AND ID1 = 'A2C4'
GO


-- Creation of a non-clustered index on ID2 :

CREATE NONCLUSTERED INDEX [IX_OrderTable_ID2] ON [dbo].[OrderTable]
(
	[ID2] ASC
) ON [PRIMARY]
GO
-- by playing the two SELECTs with different column order: 

 
SELECT ID, ID2,ID1 
FROM OrderTable
WHERE ID1 = 'A2C4' AND ID2 = 'E67'
GO
SELECT ID, ID2,ID1 
FROM OrderTable 
WHERE ID2 = 'E67' AND ID1 = 'A2C4'
GO

-- Key lookup on both queries 

-- Creation of an index on ID1 :

CREATE NONCLUSTERED INDEX [IX_OrderTable_ID1] ON [dbo].[OrderTable]
(
	[ID1] ASC
) ON [PRIMARY]
GO
-- SELECT execution with different column order: 

SELECT ID, ID2, ID1 
FROM OrderTable
WHERE ID1 = 'A2C4' AND ID2 = 'E67'
GO
SELECT ID, ID2, ID1 
FROM OrderTable 
WHERE ID2 = 'E67' AND ID1 = 'A2C4'
GO

-- Always a key lookup 

-- That's cool, but is there a predefined order when creating an index 

-- delete the indexes and start with this request: 

DROP INDEX [IX_OrderTable_ID1] ON [dbo].[OrderTable]
GO
DROP INDEX [IX_OrderTable_ID2] ON [dbo].[OrderTable]
GO
SET STATISTICS IO on

SELECT ID1, LastName, City, FirstName, ID2
FROM OrderTable
WHERE City  = 'Salt Lake City'
GO

-- Logical reads 624

-- What index should be created to lower the number of reads?

-- Let's start with an INCLUDE :  

CREATE NONCLUSTERED INDEX IDX_TEST
ON [dbo].[OrderTable] ([City])
INCLUDE (ID1,LastName, FirstName, ID2)
GO

-- SELECT

SELECT ID1, LastName, City, FirstName, ID2
FROM OrderTable
WHERE City  = 'Salt Lake City'
GO

-- We go to index SEEK and the logical reads go to 9 
-- what if I just change one column in the index order? 

DROP INDEX [IDX_TEST] ON [dbo].[OrderTable]
GO

CREATE NONCLUSTERED INDEX IDX_TEST
ON [dbo].[OrderTable] ([City])
INCLUDE (ID2,LastName, FirstName, ID1) -- I change ID1 and ID2 
GO

--  SELECT ?
SELECT ID1, LastName, City, FirstName, ID2
FROM OrderTable
WHERE City  = 'Salt Lake City'
GO

-- So SQL server is smart enough in both cases to make its index SEEK :)
