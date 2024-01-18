USE [PachaDataTraining]
GO

ALTER PROCEDURE [Contact].[ImportContacts]
AS BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	DECLARE 
		@FirstName varchar(50),
		@LastName varchar(50),
		@Address varchar(50),
		@ZipCode varchar(20),
		@City varchar(255),
		@Phone varchar(50),
		@Email varchar(100);

	DECLARE 
		@CityId int,
		@AddressId int;

	DECLARE	cur CURSOR FORWARD_ONLY STATIC
	FOR 
		SELECT FirstName, Address, LastName, ZipCode, City, Phone, Email
		FROM Contact.ContactToImport;

	DECLARE @count smallint
	SELECT @count = 1

	OPEN cur
	FETCH NEXT FROM cur INTO @FirstName, @Address, @LastName, @ZipCode, @City, @Phone, @Email;

	WHILE (@@fetch_status <> -1)
	BEGIN
		IF (@@fetch_status <> -2)
		BEGIN
			-- insert the city if needed
			SELECT @CityId = CityId
			FROM Reference.City c
			WHERE c.ZipCode = @ZipCode
			AND c.Name = @City

			IF @@ROWCOUNT = 0 BEGIN
				INSERT INTO Reference.City
					(Name, ZipCode)
				VALUES
					(@City, @ZipCode);

				SET @CityId = SCOPE_IDENTITY();
			END;

			-- insert the address if needed
			IF NOT EXISTS (
				SELECT *
				FROM Contact.Address a
				WHERE a.Address1 = @Address
				AND a.CityId = @CityId
			)
			BEGIN
				INSERT INTO Contact.Address
					(CityId, Address1)
				VALUES
					(@CityId, @Address);

				SET @AddressId = SCOPE_IDENTITY();
			END ELSE BEGIN
				SELECT @AddressId = AddressId
				FROM Contact.Address a
				WHERE a.Address1 = @Address
				AND a.CityId = @CityId
			END;
			IF NOT EXISTS (
				SELECT *
				FROM Contact.Contact c
				WHERE c.Email = @Email
			)
			BEGIN
				INSERT INTO Contact.Contact 
					(FirstName, AddressId, LastName, Phone, Email)
				VALUES
					(@FirstName, @AddressId, @LastName, @Phone, @Email)
			END 
			DELETE FROM Contact.ContactToImport WHERE Email = @Email;
		END
		FETCH NEXT FROM cur INTO @FirstName, @Address, @LastName, @ZipCode, @City, @Phone, @Email;
		
		PRINT 'imported contact #' + CAST(@count as varchar(10));
		SELECT @count = @count + 1
	END

	CLOSE cur;
	DEALLOCATE cur;

	ROLLBACK TRANSACTION;
END;
