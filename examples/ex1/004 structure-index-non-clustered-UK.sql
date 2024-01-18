/*******************************************************************************
********************** Structure of the non clustered index    *****************
********************************************************************************/
--So far we have only dealt with the case of the clustered index, whose sheets we have said are
-- the data in the table.
--Let's now talk about the non-clustered indexes: their particularity is that their 
-- sheets point either to either
--clustered keys (if any) or on the data itself if there is no clustered data.

-- Non clustered on a heap (heap)

use STARWARS 
go

-- Let's create a table : 
CREATE TABLE MARVEL
(Id int identity, [name] varchar(50), firstname varchar(50), dateofbirth date,
Comments varchar(MAX) DEFAULT 'Pas de commentaires')
 
INSERT INTO MARVEL ([name], firstname, dateofbirth)
VALUES ('Superman','John','19871029'),
        ('HULK','Brian','20010412'),
        ('Batman','Paul','19990305')
 
 -- Let's create a non clustered index : 
CREATE NONCLUSTERED INDEX IX_name_firstname ON MARVEL([name],firstname) --NON CLUSTERED

-- DBCC IND : 

DBCC ind (STARWARS ,[MARVEL],2)  -- All pages of the non-clustered index

--We can see that in relation to a table with a clustered index we have the index level at 1. 

DBCC ind (STARWARS,[dbo.darkvador],1) -- 1: For all clustered index pages

-- Index Level has the value of 1 so it is the root node 
-- Let's take a closer look at this page 
-- Page 532712 contains the one containing the index (the type 2 one)

dbcc page ('STARWARS',1,1776,3)

-- We can therefore see for each line the presence of the two columns of the key ([name] and firstname) 
-- as well as the row ID (Row ID = RID) of the data segment.
-- The two columns are clearly visible because both have been indexed. 

-- On the other hand, if you index just one column 

drop index IX_name_firstname ON MARVEL

CREATE NONCLUSTERED INDEX IX_firstname ON MARVEL([name]) --NON CLUSTERED

dbcc page ('STARWARS',1,1776,3)

-- We can see that only the [name] column is indexed.
