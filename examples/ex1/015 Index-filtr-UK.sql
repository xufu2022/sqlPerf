/*******************************************************************************
********************** Filtered index ****************************************
********************************************************************************/
-- It is noted that, on certain tables, columns can have monotonous or even undefined values
-- defined (Null values); therefore, why index all these data when only the relevant data
-- (non null for example) are of interest to us?
-- relevant data (non-null values for example)?
-- This is the role of filtering indexes: to index only the interesting values

-- It only applies to a non-clustered INDEX

USE StructuredIndex
go

-- We'll test this feature, and see the difference with a covering index.
 
 -- Creation of the table and insertion of data : 

 IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]')
AND type in (N'U'))
DROP TABLE [dbo].[Person]
GO
create table Person (PersonId int identity(1,1),Name varchar(60), gender char(1),
StartDate date)
GO

alter table Person add constraint PK_Person primary key clustered (PersonID)
go
declare @i int
set nocount on
set @i = 1
while @i < 1000
begin
insert into Person (Name,Gender,Startdate) values
('Alfred'+ltrim(STR(@i)),'M',null),
('Alice'+ltrim(STR(@i)),'F',null),
('Laurent'+ltrim(STR(@i)),'M',dateadd(day,@i,'20070101')),
('Pascale'+ltrim(STR(@i)),'F',null),
('William'+ltrim(STR(@i)),'M',null)
set @i = @i + 2
end
go

-- Enable Statistics and the execution plan
SET STATISTICS IO ON;
GO

-- First, create a classic index on the datepart column:

create index xPerson on person (Startdate) 

-- And let's examine the size of this index:

DBCC ind (StructuredIndex,[dbo.Person],2) -- non-clustered index

-- 7 pages

-- What does one of them contain?

dbcc page ('StructuredIndex',1,288,3)

-- Lots of NULL.... values, which will also waste a lot of space

-- Create a filter index on this same column by removing the not nulls

create index xPerson on person (Startdate)
where Startdate is not null
with DROP_EXISTING


-- And let's look at the size of this index:

DBCC ind (StructuredIndex,[dbo.Person],2) -- non clustered index


-- We go from 7 pages to 2 pages... 

-- and NULLs?

dbcc page ('StructuredIndex',1,352,3)

-- We can see that all NULL values have disappeared from the Datepartkey column

-- obvious gain, use cases could be for example: death date, shipping date etc...
