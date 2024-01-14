-- Rename a column

;WITH simpleCTE (FortyTwo) AS (
    SELECT 42 AS tweeënveertig -- Setting the column name in Dutch
)

SELECT FortyTwo FROM simpleCTE

GO

-- equivalent to

SELECT FortyTwo FROM (
    SELECT 42 AS tweeënveertig
) simpleSubquery (FortyTwo) -- Renaming the column another way

GO


-- Get a selection of employees

;WITH Emps AS (
    SELECT * FROM HumanResources.Employee AS e
    WHERE e.BirthDate > '1990-01-01'
),
People AS (
    SELECT * FROM Person.Person AS p
    WHERE p.LastName LIKE 'K%'
)

SELECT CONCAT_WS(', ', p.FirstName, p.LastName, e.JobTitle) AS NameAndTitle 
FROM Emps e
JOIN People p 
    ON p.BusinessEntityID = e.BusinessEntityID

GO


-- Updating (also good for deleting and inserting)

BEGIN TRAN  -- Protect against unwanted changes

;WITH cur AS (
    SELECT CurrencyCode, Name FROM Sales.Currency AS c --ORDER BY name 
    WHERE c.CurrencyCode IN ('NLG', 'BEF', 'FRF', 'ITL', 'DEM') 
)

UPDATE cur
SET cur.Name = CONCAT_WS(' ', cur.name, '-', cur.CurrencyCode, 'No longer used, use Euro')
OUTPUT deleted.CurrencyCode, deleted.Name, inserted.Name

ROLLBACK

GO