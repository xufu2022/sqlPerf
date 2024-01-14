USE master
GO

CREATE DATABASE EAV
GO

USE EAV;
GO

DROP TABLE IF EXISTS Attributes
CREATE TABLE Attributes(
    AttributeID INT IDENTITY PRIMARY KEY, 
    Attribute   VARCHAR(100) UNIQUE,
)

INSERT INTO Attributes (Attribute)
VALUES
    ('FirstName'),
    ('MiddleName'),
    ('LastName'),
    ('HomePhone'),
    ('WorkPhone'),
    ('MobilePhone')

DROP TABLE IF EXISTS PersonEAV
CREATE TABLE PersonEAV(
    Entity      INT, 
    AttributeID INT,
    [Value]     VARCHAR(100),
    CONSTRAINT PK_PersonAV PRIMARY KEY (Entity, AttributeID)
)

ALTER TABLE PersonEAV
   ADD CONSTRAINT FK_Person_Attribute FOREIGN KEY (AttributeID)
      REFERENCES Attributes (AttributeID)

GO
RETURN

DECLARE @FirstNameID INT, @MiddleNameID INT, @LastNameID INT, @HomePhoneID INT, @WorkPhoneID INT, @MobilePhoneID INT

SELECT @FirstNameID = AttributeID   FROM Attributes WHERE Attribute = 'FirstName'
SELECT @MiddleNameID = AttributeID  FROM Attributes WHERE Attribute = 'MiddleName'
SELECT @LastNameID = AttributeID    FROM Attributes WHERE Attribute = 'LastName'
SELECT @HomePhoneID = AttributeID   FROM Attributes WHERE Attribute = 'HomePhone'
SELECT @WorkPhoneID = AttributeID   FROM Attributes WHERE Attribute = 'WorkPhone'
SELECT @MobilePhoneID = AttributeID FROM Attributes WHERE Attribute = 'MobilePhone'

SELECT @FirstNameID AS FirstNameID, 
    @MiddleNameID   AS MiddleNameID, 
    @LastNameID     AS LastNameID, 
    @HomePhoneID    AS HomePhoneID, 
    @WorkPhoneID    AS WorkPhoneID, 
    @MobilePhoneID  AS MobilePhoneID

INSERT INTO PersonEAV(Entity, AttributeId, [Value])
VALUES
    (1, @FirstNameID, 'Bobs'),
    (1, @MiddleNameID, 'Your'),
    (1, @LastNameID, 'Uncle'),
    (1, @HomePhoneID, '2125551212'),
    (2, @FirstNameID, 'Carol'),
    (2, @LastNameID, 'Aunt'),
    (2, @WorkPhoneID, '2125551212'),
    (2, @MobilePhoneID, '4165551212'),
    (3, @FirstNameID, 'Ted'),
    (3, @MiddleNameID, 'Eddie'),
    (3, @LastNameID, 'Brother'),
    (3, @HomePhoneID, '8008889999'),
    (3, @WorkPhoneID, '2145551212'),
    (4, @FirstNameID, 'Alice'),
    (4, @MiddleNameID, 'Allie'),
    (4, @LastNameID, 'Sister'),
    (4, @HomePhoneID, '8008881234'),
    (4, @WorkPhoneID, '2145551212'),
    (4, @MobilePhoneID, '2125551212')

GO
RETURN

SELECT * FROM PersonEAV

;WITH src(Entity, Attribute, [Value]) AS (
    SELECT p.Entity, a.Attribute, p.[Value]
    FROM PersonEAV p
    JOIN Attributes a ON p.AttributeID = a.AttributeID
)


SELECT Entity as PersonID, FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone
FROM src

PIVOT (
    MAX([Value])
    FOR Attribute IN (FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone)

) pvt
ORDER BY Entity

GO
RETURN
