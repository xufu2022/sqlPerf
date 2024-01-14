USE AdventureWorks2022;
GO

-- Create table with typed columns
DROP TABLE IF EXISTS #types
CREATE TABLE #types (a INT, b DATE, c UNIQUEIDENTIFIER, d DECIMAL(8,2))

-- Try to add invalid row
INSERT INTO #types (a, b, d, c)
    Values ('a', 'b', 'c', 'd')

GO
RETURN

-- Create a table with variant type columms
DROP TABLE IF EXISTS #types
CREATE TABLE #types (a SQL_VARIANT, b SQL_VARIANT, c SQL_VARIANT, d SQL_VARIANT)

-- Add row with (implicitly) typed data
INSERT INTO #types (a, b, c, d)
    VALUES (42, CURRENT_TIMESTAMP, NEWID(), 3.14)

GO
RETURN

-- Show the types of the data inserted
SELECT a as [Value], SQL_VARIANT_PROPERTY(a, 'BaseType') AS [BaseType], SQL_VARIANT_PROPERTY(a, 'TotalBytes') AS [TotalBytes], SQL_VARIANT_PROPERTY(a, 'MaxLength') AS [MaxLength]
FROM #types
UNION
SELECT b, SQL_VARIANT_PROPERTY(b, 'BaseType') AS [BaseType], SQL_VARIANT_PROPERTY(b, 'TotalBytes') AS [TotalBytes], SQL_VARIANT_PROPERTY(b, 'MaxLength') AS [MaxLength]
FROM #types
UNION
SELECT c, SQL_VARIANT_PROPERTY(c, 'BaseType') AS [BaseType], SQL_VARIANT_PROPERTY(a, 'TotalBytes') AS [TotalBytes], SQL_VARIANT_PROPERTY(a, 'MaxLength') AS [MaxLength]
FROM #types
UNION
SELECT d, SQL_VARIANT_PROPERTY(d, 'BaseType') AS [BaseType], SQL_VARIANT_PROPERTY(d, 'TotalBytes') AS [TotalBytes], SQL_VARIANT_PROPERTY(d, 'MaxLength') AS [MaxLength]
FROM #types

GO
RETURN

-- Create table with a check constraint
DROP TABLE IF EXISTS #checks
CREATE TABLE #checks (
    a INT,
    CONSTRAINT [a not <= 42] CHECK (a <= 42))

-- Add a row with invalid value
INSERT INTO #checks(a) VALUES (43)

GO
RETURN

-- Other constraint types: NULL, NOT NULL, DEFAULT, PERSISTED, PRIMARY KEY, FOREIGN KEY, INDEX
