DROP TABLE IF EXISTS #Person
CREATE TABLE #Person (
    PersonId    INT IDENTITY PRIMARY KEY,
    FirstName   VARCHAR(100) NOT NULL,
    MiddleName  VARCHAR(100) NULL,
    LastName    VARCHAR(100) NOT NULL,
    Attributes  XML,
)

INSERT INTO #Person (FirstName, MiddleName, LastName, Attributes)
VALUES 
    ('Bobs', 'Your', 'Uncle', 
        '<Attributes HomePhone="2125551212" />'
        ),
    ('Carol', NULL, 'Aunt', 
        '<Attributes WorkPhone="4165551212" />'
        ),
    ('Ted', 'Eddie', 'Brother', 
        '<Attributes HomePhone="8008889999" WorkPhone="2145551212" />'
        ),
    ('Alice', 'Allie', 'Sister', 
        '<Attributes HomePhone="8008889999" WorkPhone="2145551212" MobilePhone="2125551212" />'
        )

SELECT * FROM #Person

GO
RETURN

SELECT Firstname, Lastname, Attributes.value('(/Attributes/@HomePhone)[1]', 'nvarchar(10)') AS HomePhone
FROM #Person

GO
RETURN
