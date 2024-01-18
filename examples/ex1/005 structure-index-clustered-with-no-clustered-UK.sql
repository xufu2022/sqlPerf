/*******************************************************************************
**********  Structure of the clustered index with a clustered index *************
********************************************************************************/

-- We will now deal with the very common case where, on a table, 
-- we have both non-clustered and clustered indexes.
--clustered indexes and a clustered index.

USE Structuredindex
GO
CREATE TABLE Tablewithclustered (Id int identity PRIMARY KEY, [Name] varchar(50), Firstname varchar(50), Dateofbirth date, Comments varchar(MAX) DEFAULT 'No comments')
 
INSERT INTO Tablewithclustered ([Name], Firstname, Dateofbirth)
VALUES ('JORDAN','Mickael','19871029'),
       ('WILLIS','Bruce','20010412'),
       ('SMITH','Will','19990305')
 
CREATE NONCLUSTERED INDEX IX_Namefirstname ON Tablewithclustered([Name],Firstname)

-- OK we have a table with a clustered index, and a non-clustered index  

DBCC ind (Structuredindex,[Tablewithclustered],2)  -- --All non-clustered index pages

-- Page 22112 contains the page with the index (type 2)

dbcc page ('Structuredindex',1,22112,3)

-- The contents of the leaf page of this non-clustered index can be summarised as follows:
-- We see for each row that we have the key of the non-clustered index and also the key 
-- of the clustered index
-- (in our case the Id column, which is Primary Key and by default clustered index).
-- We also see that the ROWID has disappeared 
-- This is called index stacking: the clustered index key is repeated as many times
-- as there are non-clustered keys.

--To allow rows to be moved around the data pages without touching up the non-clustered indexes.
--clustered . Indeed, this makes sense; if you have 9 non-clustered indexes on a table, when the
--red only the cluster index is modified.
--Conclusion :
-- Your clustered index must be small, stable deterministic.

 
-- THEREFORE it is not necessary when creating a NON CLUSTERED index, to add 
-- the column that is part of the clustered index because it is already duplicated :)

-- Good practice : Use identity keys : they are small, (int often) stable
--(we don't modify their value) and deterministic (the primary key
-- being the most selective). 

