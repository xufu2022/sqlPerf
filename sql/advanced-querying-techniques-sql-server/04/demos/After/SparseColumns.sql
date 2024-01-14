DROP TABLE IF EXISTS #Person
CREATE TABLE #Person (
    PersonId    INT IDENTITY PRIMARY KEY,
    FirstName   VARCHAR(100) NOT NULL,
    MiddleName  VARCHAR(100) SPARSE,
    LastName    VARCHAR(100) NOT NULL,
    HomePhone   CHAR(10) SPARSE,
    WorkPhone   CHAR(10) SPARSE,
    MobilePhone CHAR(10) SPARSE,
    TheAnswer   INT SPARSE 
    CONSTRAINT [TheAnswer must be <= 42] CHECK (TheAnswer <= 42)
)

INSERT INTO #Person (FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone, TheAnswer)
VALUES 
    ('Bobs', 'Your', 'Uncle', '2125551212', NULL, NULL, NULL),
    ('Carol', NULL, 'Aunt', NULL, '2125551212', '4165551212', 42),
    ('Ted', 'Eddie', 'Brother', '8008889999', '2145551212', NULL, 42),
    ('Alice', 'Allie', 'Sister', '8008889999', '2145551212', '2125551212', NULL)

SELECT * FROM #Person

INSERT INTO #Person (FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone, TheAnswer)
VALUES 
    ('Christine', 'A', 'Friend', '8008889999', '2145551212', '2125551212', 43)
GO
RETURN
