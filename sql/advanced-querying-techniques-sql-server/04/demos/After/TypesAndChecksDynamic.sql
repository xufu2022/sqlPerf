USE EAV;
GO

-- Sample using dynamic SQL

-- DECLARE @Value42 SQL_VARIANT = 42        -- valid value
DECLARE @Value42 SQL_VARIANT = 'The Answer' -- invalid value

DECLARE @DynamicConstraint NVARCHAR(MAX) = N'
    SELECT @msg = CASE

        -- Check the type

        WHEN SQL_VARIANT_PROPERTY(@Value, ''BaseType'') <> ''int''
            THEN ''Value is not an integer''
        
        -- Check the value
        WHEN CAST(@Value AS INT) > 42
            THEN ''Value not <= 42''

    END
'

DECLARE @msg VARCHAR(100)

EXEC sp_executesql @stmt = @DynamicConstraint, 
    @params = N'@Value sql_variant, @msg varchar(100) OUTPUT', 
    @Value = @Value42, @msg = @msg OUTPUT
PRINT @msg

GO
RETURN

-- Set up tables with support for dynamic constraints

DROP TABLE IF EXISTS Attributes
CREATE TABLE Attributes(
    AttributeID  INT IDENTITY PRIMARY KEY, 
    Attribute    VARCHAR(100) UNIQUE,
    [Constraint] NVARCHAR(4000),
)

DROP TABLE IF EXISTS PersonEAV
CREATE TABLE PersonEAV(
    Entity      INT, 
    AttributeID INT,
    [Value]     SQL_VARIANT,
    CONSTRAINT PK_PersonAV PRIMARY KEY (Entity, AttributeID)
)

ALTER TABLE PersonEAV
   ADD CONSTRAINT FK_Person_Attribute FOREIGN KEY (AttributeID)
      REFERENCES Attributes (AttributeID)

GO
RETURN

-- Populate the attributes table with a dynamic constraint

DECLARE @DynamicConstraint NVARCHAR(MAX) = N'
    SELECT @msg = CASE

        -- Check the type

        WHEN SQL_VARIANT_PROPERTY(@Value, ''BaseType'') <> ''int''
            THEN ''Value is not an integer''
        
        -- Check the value
        WHEN CAST(@Value AS INT) > 42
            THEN ''Value not <= 42''

        END
'

INSERT INTO Attributes(Attribute, [Constraint])
    Values('TheAnswer', @DynamicConstraint)

SELECT * FROM Attributes

GO
RETURN

-- Use the dynamic constraint to test my values before inserting them

DECLARE @stmt NVARCHAR(4000) = (
    SELECT [Constraint] FROM Attributes WHERE Attribute = 'TheAnswer'
 )

PRINT @stmt


DECLARE @Value42 SQL_VARIANT = 42        -- valid value
-- DECLARE @Value42 SQL_VARIANT = 'The Answer' -- invalid value

DECLARE @msg VARCHAR(100)


EXEC sp_executesql @stmt = @stmt, 
    @params = N'@Value sql_variant, @msg varchar(100) OUTPUT', 
    @Value = @Value42, @msg = @msg OUTPUT
PRINT @msg


DECLARE @TheAnswerID INT = (
    SELECT AttributeID FROM Attributes WHERE Attribute = 'TheAnswer'
)


IF @msg IS NULL 
    BEGIN
        INSERT INTO PersonEAV (Entity, AttributeID, [Value])
        VALUES
            (42, @TheAnswerID, @Value42)
    END
ELSE 
    THROW 51000, @msg, 1

SELECT * FROM PersonEAV

GO
RETURN
