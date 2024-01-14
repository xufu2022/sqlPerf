USE Pluralsight
GO
-- Errors and Native SP
CREATE OR ALTER PROCEDURE [dbo].[NativeSP] @iID INT, @jID INT    
    WITH NATIVE_COMPILATION
        ,SCHEMABINDING
        ,EXECUTE AS OWNER
AS
BEGIN ATOMIC
    WITH (
            TRANSACTION ISOLATION LEVEL = SNAPSHOT
			,LANGUAGE = 'us_english')
	SELECT ID, FName, LName
	FROM [dbo].[MemoryOptimizedTable]
	WHERE ID >= @iID AND ID <= @jID
END
GO

