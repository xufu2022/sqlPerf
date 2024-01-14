USE AdventureWorks2022
GO

DROP TABLE IF EXISTS #PersonEAV
CREATE TABLE #PersonEAV(
    Entity      INT, 
    Attribute   VARCHAR(100),
    [Value]     VARCHAR(100),
)

INSERT INTO #PersonEAV(Entity, Attribute, [Value])
VALUES
    (1, 'FirstName', 'Bobs'),
    (1, 'MiddleName', 'Your'),
    (1, 'LastName', 'Uncle'),
    (1, 'HomePhone', '2125551212'),
    (2, 'FirstName', 'Carol'),
    -- (2, 'MiddleName', 'Your'),
    (2, 'LastName', 'Aunt'),
    -- (2, 'HomePhone', '2125551212'),
    (2, 'WorkPhone', '2125551212'),
    (2, 'MobilePhone', '4165551212'),
    (3, 'FirstName', 'Ted'),
    (3, 'MiddleName', 'Eddie'),
    (3, 'LastName', 'Brother'),
    (3, 'HomePhone', '8008889999'),
    (3, 'WorkPhone', '2145551212'),
    -- (3, 'MobilePhone', '4165551212')    
    (4, 'FirstName', 'Alice'),
    (4, 'MiddleName', 'Allie'),
    (4, 'LastName', 'Sister'),
    (4, 'HomePhone', '8008881234'),
    (4, 'WorkPhone', '2145551212'),
    (4, 'MobilePhone', '2125551212')

GO
RETURN

SELECT Entity as PersonID, FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone
FROM #PersonEAV

PIVOT (
    MAX([Value])
    FOR Attribute IN (FirstName, MiddleName, LastName, HomePhone, WorkPhone, MobilePhone)

) pvt
ORDER BY Entity

GO
RETURN
