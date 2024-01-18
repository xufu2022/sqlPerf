DECLARE @string1 VARCHAR(10)  = 'hello';
DECLARE @string2 NVARCHAR(10) = 'hello';

SELECT 
	DATALENGTH(@string1) as string1,
	DATALENGTH(@string2) as string2
GO

DBCC DROPCLEANBUFFERS;
GO

SELECT *
FROM Contact.Contact
WHERE FirstName = 'Madeleine';
GO

CREATE TABLE Contact.ContactMax (
	ContactMaxId int NOT NULL,
	Title varchar(max) NULL,
	LastName varchar(max) NOT NULL,
	FirstName varchar(max) NULL,
	Email varchar(max) NULL,
	Phone varchar(max) NULL,
	Fax varchar(max) NULL,
	Gender varchar(max) NULL,
	Mobile varchar(max) NULL,
	AddressId int NOT NULL,
	CompanyId int NULL,
	OldLastName varchar(max) NULL,
	Comment varchar(max) NOT NULL,
 CONSTRAINT pk_ContactMax PRIMARY KEY CLUSTERED 
(
	ContactMaxId ASC
)
)
GO

INSERT INTO Contact.ContactMax
SELECT * FROM Contact.Contact;
GO

UPDATE STATISTICS Contact.Contact WITH FULLSCAN;
UPDATE STATISTICS Contact.ContactMax WITH FULLSCAN;
GO

SELECT *
FROM Contact.Contact
WHERE FirstName = 'Madeleine'
OPTION (QUERYTRACEON 9130); -- Revealing Predicates in Execution Plans

SELECT *
FROM Contact.ContactMax
WHERE FirstName = 'Madeleine'
OPTION (QUERYTRACEON 9130); -- Revealing Predicates in Execution Plans
