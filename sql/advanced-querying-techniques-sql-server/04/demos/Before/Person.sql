USE AdventureWorks2022
GO

DROP TABLE IF EXISTS #Person
CREATE TABLE #Person (
    PersonId    INT IDENTITY PRIMARY KEY,
    FirstName   VARCHAR(100) NOT NULL,
    MiddleName  VARCHAR(100),
    LastName    VARCHAR(100) NOT NULL,
    HomePhone   CHAR(10),
    WorkPhone   CHAR(10),
    MobilePhone CHAR(10),
    -- other attributes (birthweight, height at age 19, time in 100 meter sprint at 2020 olympics, etc.)
)

GO
RETURN

INSERT INTO #Person (FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone)
VALUES 
    ('Bobs', 'Your', 'Uncle', '2125551212', NULL, NULL),
    ('Carol', NULL, 'Aunt', NULL, '2125551212', '4165551212'),
    ('Ted', 'Eddie', 'Brother', '8008889999', '2145551212', NULL),
    ('Alice', 'Allie', 'Sister', '8008889999', '2145551212', '2125551212')

GO
RETURN

SELECT PersonID, FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone
FROM #Person

GO
RETURN
