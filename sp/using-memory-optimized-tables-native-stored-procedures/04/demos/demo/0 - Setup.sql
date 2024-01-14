-- Set up - Load the Data
USE Pluralsight
GO
-- Inserting Data
INSERT INTO [dbo].[DiskBasedTable] (FName, LName)
SELECT TOP 500000  'Bob',				
					CASE WHEN ROW_NUMBER() OVER (ORDER BY a.name)%123456 = 1 THEN 'Baker' 
						 WHEN ROW_NUMBER() OVER (ORDER BY a.name)%10 = 1 THEN 'Marley' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 5 THEN 'Ross' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 3 THEN 'Dylan' 
					ELSE 'Hope' END
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
GO

INSERT INTO [dbo].[MemoryOptimizedTable] (FName, LName)
SELECT TOP 500000  'Bob', 					
					CASE WHEN ROW_NUMBER() OVER (ORDER BY a.name)%123456 = 1 THEN 'Baker' 
						 WHEN ROW_NUMBER() OVER (ORDER BY a.name)%10 = 1 THEN 'Marley' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 5 THEN 'Ross' 
						WHEN  ROW_NUMBER() OVER (ORDER BY a.name)%10 = 3 THEN 'Dylan' 
					ELSE 'Hope' END
FROM sys.all_objects a
CROSS JOIN sys.all_objects b
GO