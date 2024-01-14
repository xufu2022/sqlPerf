USE [WiredBrainCoffee];
GO





-- Stored procedure with a default value.
CREATE OR ALTER PROCEDURE [Sales].[GenerateSalesReport]
  @LevelName nvarchar(500),
  @IsActive bit = 1
AS
BEGIN
	SELECT CONCAT(sp.[LastName], ', ',sp.[FirstName]) AS 'SalesPersonName',
	   sp.[Email] AS 'SalesPersonEmail',
	   spl.[LevelName] AS 'SalesPersonLevel',
	   SUM(so.SalesAmount) AS 'SalesAmount',
	   YEAR(so.SalesDate) AS 'SalesYear'
	FROM [Sales].[SalesPerson] sp
	INNER JOIN [Sales].[SalesOrder] so ON so.SalesPerson = sp.Id
	INNER JOIN [Sales].[SalesPersonLevel] spl ON sp.[LevelId] = spl.[Id]
	WHERE spl.LevelName = @LevelName AND sp.IsActive = @IsActive
	GROUP BY sp.[LastName],sp.[FirstName],sp.[Email],spl.[LevelName], YEAR(so.SalesDate);
END
GO



EXECUTE [Sales].[GenerateSalesReport] @LevelName = 'Senior Staff';
GO



EXECUTE [Sales].[GenerateSalesReport] 'Staff';
GO


-- You are overriding the default.
EXECUTE [Sales].[GenerateSalesReport]	@LevelName = 'Senior Staff'
										,@IsActive = 0;
GO



-- You are using an output parameter.
CREATE OR ALTER PROCEDURE [Sales].[ReturnSalesPersonId]
  @EmployeeEmail nvarchar(500),
  @EmployeeId int OUTPUT
AS
BEGIN
	SELECT @EmployeeId = Id 
	FROM [Sales].[SalesPerson] sp
	WHERE sp.[Email] = @EmployeeEmail;
END
GO



-- Selecting the output parameter for display.
DECLARE @EmployeeId int; 

EXECUTE [Sales].[ReturnSalesPersonId] @EmployeeEmail = 'Kerrie.Smith1@WiredBrainCoffee.com'
								  ,@EmployeeId = @EmployeeId OUTPUT;

SELECT @EmployeeId;
GO