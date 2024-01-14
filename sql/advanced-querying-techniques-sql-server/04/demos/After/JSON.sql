DROP TABLE IF EXISTS #Person
CREATE TABLE #Person (
    PersonId    INT IDENTITY PRIMARY KEY,
    FirstName   VARCHAR(100) NOT NULL,
    MiddleName  VARCHAR(100) NULL,
    LastName    VARCHAR(100) NOT NULL,
    Attributes  NVARCHAR(MAX),
)

INSERT INTO #Person (FirstName, MiddleName, LastName, Attributes)
VALUES 
    ('Bobs', 'Your', 'Uncle', 
        '{"HomePhone": "2125551212"}'
        ),
    ('Carol', NULL, 'Aunt', 
        '{"WorkPhone": "4165551212"}'
        ),
    ('Ted', 'Eddie', 'Brother}', 
        '{"HomePhone": "8008889999", "WorkPhone": "2145551212"}'
        ),
    ('Alice', 'Allie', 'Sister', 
        '{"HomePhone": "8008889999", "WorkPhone": "2145551212", "MobilePhone": "2125551212"}'
        )

SELECT * FROM #Person

GO
RETURN

SELECT Firstname, Lastname, JSON_VALUE(Attributes, '$.HomePhone') AS HomePhone
FROM #Person

GO
RETURN
