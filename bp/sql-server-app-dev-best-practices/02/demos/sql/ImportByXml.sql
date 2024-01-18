DECLARE @contacts xml = N'<?xml version="1.0"?>
	<Contacts>
		<Contact>
			<FirstName>Terrence</FirstName>
			<LastName>Richardson</LastName>
			<Address>36 Milton Boulevard</Address>
			<ZipCode>74708</ZipCode>
			<City>Fremont</City>
			<Phone>6723446913</Phone>
			<Email>mthxxjs37@swdjaa.net</Email>
		</Contact>
		<Contact>
			<FirstName>Lawanda</FirstName>
			<LastName>Higgins</LastName>
			<Address>99 Cowley Avenue</Address>
			<ZipCode>37901</ZipCode>
			<City>Little Rock</City>
			<Phone>365-884-5067</Phone>
			<Email>oiewohjb4@oldnvxf.oxbcid.net</Email>
		</Contact>
	</Contacts>';

SELECT 
	c.query('.'),
	c.value('FirstName[1]', 'varchar(50)'),
	c.value('LastName[1]', 'varchar(50)'),
	c.value('Address[1]', 'varchar(50)'),
	c.value('ZipCode[1]', 'varchar(20)'),
	c.value('City[1]', 'varchar(255)'),
	c.value('Phone[1]', 'varchar(50)'),
	c.value('Email[1]', 'varchar(100)')
FROM @contacts.nodes('/Contacts/Contact') x(c);

DROP PROCEDURE IF EXISTS Contact.InsertContactToImportXML;
GO

CREATE PROCEDURE Contact.InsertContactToImportXML
	@contacts as xml
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE Contact.ContactToImport;

	INSERT INTO Contact.ContactToImport
           (FirstName, LastName, Address, ZipCode,
            City, Phone, Email)
	SELECT 
		c.value('FirstName[1]', 'varchar(50)'),
		c.value('LastName[1]', 'varchar(50)'),
		c.value('Address[1]', 'varchar(50)'),
		c.value('ZipCode[1]', 'varchar(20)'),
		c.value('City[1]', 'varchar(255)'),
		c.value('Phone[1]', 'varchar(50)'),
		c.value('Email[1]', 'varchar(100)')
	FROM @contacts.nodes('/Contacts/Contact') x(c);

	RETURN @@ROWCOUNT;
END
GO