USE [PachaDataTraining]
GO


ALTER PROCEDURE [Contact].[ImportContacts_New]
AS BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	INSERT INTO Reference.City
		(Name, ZipCode)
	SELECT City, ZipCode
	FROM Contact.ContactToImport
	EXCEPT
	SELECT Name, ZipCode
	FROM Reference.City;

	INSERT INTO Contact.Address
		(CityId, Address1)
	SELECT CityId, Address
	FROM Contact.ContactToImport AS ct
	JOIN Reference.City AS ci ON ct.ZipCode = ci.ZipCode AND ct.City = ci.Name
	EXCEPT
	SELECT CityId, Address1
	FROM Contact.Address;

	INSERT INTO Contact.Contact 
		(FirstName, AddressId, LastName, Phone, Email)
	SELECT ct.FirstName, AddressId, ct.LastName, ct.Phone, ct.Email
	FROM Contact.ContactToImport AS ct
	JOIN Reference.City AS ci ON ct.ZipCode = ci.ZipCode AND ct.City = ci.Name
	JOIN Contact.Address AS a ON ci.CityId = a.CityId AND ct.Address = a.Address1
	EXCEPT
	SELECT FirstName, AddressId, LastName, Phone, Email
	FROM Contact.Contact;

	ROLLBACK TRANSACTION;
END;
