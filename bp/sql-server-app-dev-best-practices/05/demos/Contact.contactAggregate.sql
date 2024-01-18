USE [PachaDataTraining]
GO

CREATE VIEW [Contact].[contactAggregate]
AS
SELECT c.ContactId 
      ,c.Title
	  ,c.LastName
	  ,c.FirstName
	  ,LOWER(c.Email) AS Email
	  ,s.SessionId
	  ,s.CourseId
	  ,s.LanguageCd
	  ,s.RoomId
	  ,s.StartDate
FROM Contact.Contact c
LEFT JOIN Enrollment.Enrollment e 
	ON c.ContactId = e.ContactId
LEFT JOIN Course.Session s 
	ON e.SessionId = s.SessionId;
GO


