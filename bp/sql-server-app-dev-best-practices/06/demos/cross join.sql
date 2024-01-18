USE PachaDataTraining;
GO

-- SELECT RIGHT(CAST(NEWID() as varchar(50)), 5)

INSERT INTO Contact.Contact
	([Title], [LastName], [FirstName], [Email], [Phone], [Fax], [Gender], [Mobile], [AddressId], [CompanyId], [OldLastName], [Comment])
SELECT --TOP 20
	[Title], [LastName], [FirstName], 
	v.c + RIGHT(CAST(NEWID() as varchar(50)), 5) + [Email], 
	[Phone], [Fax], [Gender], [Mobile], [AddressId], [CompanyId], [OldLastName], [Comment]
FROM Contact.Contact AS c
CROSS JOIN (VALUES ('a'), ('b'), ('c')) AS v(c)