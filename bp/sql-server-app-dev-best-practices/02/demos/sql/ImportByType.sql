USE PachaDataTraining
GO

DROP TYPE IF EXISTS Contact.TContactToImport;
GO
CREATE TYPE Contact.TContactToImport AS TABLE (
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	ZipCode varchar(20) NOT NULL,
	City varchar(255) NOT NULL,
	Phone varchar(50) NULL,
	Email varchar(100) NOT NULL
)
GO

DROP PROCEDURE IF EXISTS Contact.InsertContactToImport;
GO

CREATE PROCEDURE Contact.InsertContactToImport
	@contact as Contact.TContactToImport ReadOnly
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE Contact.ContactToImport;

	INSERT INTO Contact.ContactToImport
           (FirstName, LastName, Address, ZipCode,
            City, Phone, Email)
    SELECT FirstName, LastName, Address, ZipCode,
            City, Phone, Email
	FROM @contact;

	RETURN @@ROWCOUNT;

END
GO

