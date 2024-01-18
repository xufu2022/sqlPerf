USE [PachaDataTraining]
GO

CREATE TRIGGER [Contact].[itr_contactAggregate]
ON [Contact].[contactAggregate]
INSTEAD OF UPDATE
AS BEGIN
	UPDATE c
	SET LastName = i.LastName,
		FirstName = i.FirstName,
		Email = i.Email
	FROM INSERTED i
	JOIN Contact.Contact c ON c.ContactId = i.ContactId;

	UPDATE s
	SET LanguageCd = i.LanguageCD
	FROM Course.Session s
	JOIN INSERTED i ON s.SessionId = i.SessionId;
END;
GO


