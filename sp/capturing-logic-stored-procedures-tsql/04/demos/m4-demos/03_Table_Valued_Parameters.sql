USE [WiredBrainCoffee];
GO




-- Create a table type with one integer column.
CREATE TYPE [SalesPersonId] AS TABLE ([SalesPersonId] int);
GO



-- Create a stored procedure with a table type.
CREATE OR ALTER PROCEDURE [Sales].[SalesPersonDetail]
@SalesPersonInput [SalesPersonId] READONLY
AS
BEGIN

	SELECT CONCAT([LastName],', ',[FirstName]) AS 'FullName'
		   ,[SalaryHr] AS 'SalaryPerHour'
		   ,[StartDate] AS 'StartDate'
	FROM [Sales].[SalesPerson] sp
	INNER JOIN @SalesPersonInput spi ON sp.[Id] = spi.[SalesPersonId]; 

END
GO



-- Declare an instance of our table type.
DECLARE @SalesPersonInput [SalesPersonId];

-- Insert some salespeople into the table.
INSERT INTO @SalesPersonInput VALUES (1001);
INSERT INTO @SalesPersonInput VALUES (85);
INSERT INTO @SalesPersonInput VALUES (32);
INSERT INTO @SalesPersonInput VALUES (45);
INSERT INTO @SalesPersonInput VALUES (987);

-- Pass in as a table-valued parameter.
EXECUTE [Sales].[SalesPersonDetail] @SalesPersonInput;
GO



-- Finally, let's remove the table type.
DROP TYPE [SalesPersonId];
GO