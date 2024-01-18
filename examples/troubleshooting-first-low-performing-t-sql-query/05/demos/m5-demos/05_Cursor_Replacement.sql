USE [WiredBrainCoffee];
GO


DROP TABLE IF EXISTS [dbo].[BULKSalesOrder];
GO


CREATE TABLE [dbo].[BULKSalesOrder]
(   [LoadId] INT NOT NULL,
    [SalesOrderId] INT NULL,
	[SalesPerson] INT NULL,
    [SalesAmount] DECIMAL(36, 2) NULL,
    [SalesDate] DATE NULL,
    [SalesTerritory] INT NULL,
    [SalesOrderStatus] INT NULL,
    [OrderDescription] NVARCHAR(MAX) NULL
);
GO


-- The statement below will insert 10 thousand rows.
INSERT INTO [dbo].[BulkSalesOrder]
(
    [LoadId],
	[SalesPerson],
    [SalesAmount],
    [SalesTerritory],
    [SalesDate],
	[SalesOrderStatus],
    [OrderDescription]
)
SELECT TOP 10000
       ROW_NUMBER() OVER (ORDER BY n.[Number]) AS [LoadId],
	   ABS(CHECKSUM(NEWID()) % 5000) + 1 AS [SalesPerson],
       ABS(CHECKSUM(NEWID()) % 50) + 10 AS [SalesAmount],
       ABS(CHECKSUM(NEWID()) % 10) + 1 AS [SalesTerritory],
       GETDATE() AS [SalesDate],
	   2 AS [SalesOrderStatus], -- Complete
       'Even a bad cup of coffee is better than no coffee at all.' AS [SalesDescription]
FROM [dbo].[Numbers] AS n;
GO


SELECT COUNT(1) AS [ImportCount] FROM [dbo].[BULKSalesOrder];

-- Inserting 10 thousand rows took approximately 25 seconds.
-- Inserting 100 thousand rows took approximately 45 minutes.
-- Here is where the cursor begins.
DECLARE @LoadId INT,
        @SalesOrderId INT,
        @SalesPerson INT,
        @SalesAmount DECIMAL(36, 2),
        @SalesTerritory INT,
        @SalesOrderStatus INT,
        @OrderDescription NVARCHAR(MAX),
		@CurrentData AS DATE = GETDATE()

DECLARE Cursor_Demo CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY FOR
SELECT [LoadId],
       [SalesPerson],
       [SalesAmount],
       [SalesTerritory],
       [SalesOrderStatus],
       [OrderDescription]
FROM [dbo].[BULKSalesOrder];

OPEN Cursor_Demo;
FETCH NEXT FROM Cursor_Demo
INTO @LoadId,
     @SalesPerson,
     @SalesAmount,
     @SalesTerritory,
     @SalesOrderStatus,
     @OrderDescription;
WHILE (@@FETCH_STATUS = 0)
BEGIN

    INSERT INTO [Sales].[SalesOrder]
    (
        [SalesPerson],
        [SalesAmount],
        [SalesDate],
        [SalesTerritory],
        [SalesOrderStatus],
        [OrderDescription],
        [CreateDate],
        [ModifyDate]
    )
    VALUES
    (@SalesPerson, @SalesAmount, @CurrentData, @SalesTerritory, @SalesOrderStatus, @OrderDescription, DEFAULT, NULL);

    SET @SalesOrderId = SCOPE_IDENTITY();

    UPDATE [dbo].[BULKSalesOrder]
    SET [SalesOrderId] = @SalesOrderId
    WHERE [LoadId] = @LoadId;

    FETCH NEXT FROM Cursor_Demo
    INTO @LoadId,
         @SalesPerson,
         @SalesAmount,
         @SalesTerritory,
         @SalesOrderStatus,
         @OrderDescription;
END;


CLOSE Cursor_Demo;
DEALLOCATE Cursor_Demo;
-- Here is where the cursor ends.




-- Below is a set-based option you can use.
BEGIN TRY

    BEGIN TRANSACTION;

    DROP TABLE IF EXISTS #SalesOrderLoad;

    CREATE TABLE #SalesOrderLoad
    (
        [LoadId] INT NULL,
        [SalesOrderId] INT NULL
    );


    MERGE INTO [Sales].[SalesOrder] dest
    USING [dbo].[BULKSalesOrder] src
    ON 1 = 0
    WHEN NOT MATCHED BY TARGET THEN
        INSERT
        (
            [SalesPerson],
            [SalesAmount],
            [SalesDate],
            [SalesTerritory],
            [SalesOrderStatus],
            [OrderDescription]
        )
        VALUES
        (src.[SalesPerson], src.[SalesAmount], src.[SalesDate], src.[SalesTerritory], src.[SalesOrderStatus],
         src.[OrderDescription])
    OUTPUT src.[LoadId],
           Inserted.[Id]
    INTO #SalesOrderLoad;


    UPDATE dest
    SET dest.[SalesOrderId] = src.[SalesOrderId]
    FROM [dbo].[BULKSalesOrder] dest
        INNER JOIN #SalesOrderLoad src
            ON src.[LoadId] = dest.[LoadId];

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH;
GO



SELECT *
FROM [dbo].[BULKSalesOrder];
SELECT COUNT(1)
FROM [Sales].[SalesOrder];
GO