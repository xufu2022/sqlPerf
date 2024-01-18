/*******************************************************************************
********************** Structure of the clustered index    ***********************
********************************************************************************/

CREATE DATABASE STARWARS
go

-- Let's create a table : 
USE STARWARS
go
IF EXISTS (SELECT * FROM sys.objects WHERE object_id =
OBJECT_ID(N'[dbo].[Darkvador]') AND type in (N'U'))
DROP TABLE [dbo].[Darkvador]
GO
CREATE table Darkvador ([Name] nchar(60),Adress varchar(60))
GO
-- Create a index clustered on the column name:

create CLUSTERED INDEX xDarkvador_Name on Darkvador ([Name])
GO

-- Insert some datas : 

declare @i int
set nocount on
set @i = 1
while @i < 10000
begin
insert into Darkvador values
('Alfred'+ltrim(str(@i)),'Paris'),
('Tim'+ltrim(str(@i)),'Dieppe'),
('Obiwan'+ltrim(str(@i)),'Rouen'),
('R2D2'+ltrim(str(@i)),'Le Havre'),
('John'+ltrim(str(@i)),'Caen')
set @i = @i + 1
end
GO

-- Let's open the cover and look at the SQL pages

DBCC ind (STARWARS,[dbo.Darkvador],1) -- 1: For all clustered index pages

-- Index Level has the value of 1 so it is the root node 
-- Let's take a closer look at this page 

DBCC TRACEON (3604)
DBCC PAGE ('STARWARS',1,233,3)

-- We can see that the Name column is replicated on each data page, which allows 
-- to arrange the table in a specific order.
-- We can clearly see the notions of shunting the keys between Alfred105 and Alfred11
-- is located on page 495 and that its next page is 247 which can be verified by :

dbcc page ('STARWARS',1,495,3)

--It is clear that :
-- Metadata: ObjectId = 581577110      m_prevPage = (1:264)                m_nextPage = (1:287)
-- We can see that the lines are well arranged in the order of the clustered index.
-- The same applies to the pages between them: a logical (and not physical) chaining ensures that the pages can be
-- read in the order of the keys
-- Let's summarize on this clustered index:
-- The sheets of the index are in fact the data ==> clustered index = table
-- The data pages are arranged in the logical order of the keys.
