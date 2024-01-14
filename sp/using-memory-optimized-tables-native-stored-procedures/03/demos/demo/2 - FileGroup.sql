USE [Pluralsight]
GO

-- Disk Based Table
CREATE TABLE [DiskBasedTable] (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
GO

-- Memory Optimize Table (Durable)
-- Need a Memory Optimized FileGroup
CREATE TABLE [MemoryOptimizedTable] (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED 
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
    WITH (
            MEMORY_OPTIMIZED = ON
            ,DURABILITY = SCHEMA_AND_DATA
            )
GO

-- Add Memory Optimized FileGroup
ALTER DATABASE [Pluralsight] 
	ADD FILEGROUP [Pluralsight_FG] 
	CONTAINS MEMORY_OPTIMIZED_DATA
GO

-- Add File to Memory Optimized FileGroup
ALTER DATABASE [Pluralsight] ADD FILE (
    NAME = N'Pluralsight_dir'
    ,FILENAME = N'D:\Data\Pluralsight_dir'
    ) TO FILEGROUP [Pluralsight_FG]
GO

-- Memory Optimize Table (Durable)
CREATE TABLE [MemoryOptimizedTable] (
    ID INT IDENTITY NOT NULL PRIMARY KEY NONCLUSTERED 
    ,FName VARCHAR(20) NOT NULL
    ,LName VARCHAR(20) NOT NULL
    )
    WITH (
            MEMORY_OPTIMIZED = ON
            ,DURABILITY = SCHEMA_AND_DATA
            )
GO