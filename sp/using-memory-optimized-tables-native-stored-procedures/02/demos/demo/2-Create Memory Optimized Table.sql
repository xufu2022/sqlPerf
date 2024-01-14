USE SQLAuthority
GO

-- Disk Based Table
CREATE TABLE DiskBasedTable (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
GO

-- Memory Optimize Table (Durable)
CREATE TABLE MemoryOptimizedTable (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED 
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
    WITH (
            MEMORY_OPTIMIZED = ON
            ,DURABILITY = SCHEMA_AND_DATA
            )
GO


-- Non Durable Memory Optimize Table
CREATE TABLE MemoryOptimizedTableNonDurable (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED 
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
    WITH (
            MEMORY_OPTIMIZED = ON
            ,DURABILITY = SCHEMA_ONLY
            )
GO

--  Check DMV
SELECT	SCHEMA_NAME(Schema_id) SchemaName, 
		name TableName,
		is_memory_optimized, 
		durability_desc,
		create_date, modify_date
FROM sys.tables
GO
