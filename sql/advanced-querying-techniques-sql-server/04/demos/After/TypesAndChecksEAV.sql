USE AdventureWorks2022;
GO

-- Create EAV table
DROP TABLE IF EXISTS #EAV
CREATE TABLE #EAV (EntityID int, AttributeID int, [Value] SQL_VARIANT)

-- Set up some variables to insert
DECLARE @EntityID int = 42
DECLARE @AttributeID int = 42

-- DECLARE @Value42 SQL_VARIANT = 42        -- valid value
DECLARE @Value42 SQL_VARIANT = 'The Answer' -- invalid value

DECLARE @msg VARCHAR(100) = (
    SELECT CASE

        -- Check the type

        WHEN SQL_VARIANT_PROPERTY(@Value42, 'BaseType') <> 'int'
            THEN 'Value is not an integer'
        
        -- Check the value
        WHEN CAST(@Value42 AS INT) > 42
            THEN 'Value not <= 42'

    END AS msg
)    

PRINT @msg

IF @msg IS NULL 
    BEGIN
        INSERT INTO #EAV (EntityID, AttributeID, [Value])
        VALUES
            (@EntityID, @AttributeID, @Value42)
    END
ELSE 
    THROW 51000, @msg, 1

GO
RETURN
