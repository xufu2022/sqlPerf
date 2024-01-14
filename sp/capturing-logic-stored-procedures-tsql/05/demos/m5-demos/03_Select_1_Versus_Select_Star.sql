USE [WiredBrainCoffee];
GO



-- Insert a new salesperson or update their salary.
CREATE OR ALTER PROCEDURE [Sales].[InsertUpdateSalesPerson]
	@FirstName nvarchar(500),
	@LastName nvarchar(500),
	@EmployeeNumber nvarchar(10),
	@SalaryHr decimal(32,2),
	@LevelId int = 3,
	@StartDate date
AS
BEGIN

	SET NOCOUNT ON;

		BEGIN TRANSACTION;

			DECLARE @SalesPersonEmail nvarchar(500);
			DECLARE @SalesPersonStart date;

			SELECT @SalesPersonEmail = CONCAT(@FirstName,@LastName,'@WiredBrainCoffee.com');
			SELECT @SalesPersonStart = ISNULL(@StartDate,GETDATE());

			IF NOT EXISTS (SELECT 1 FROM [Sales].[SalesPerson] WHERE [Email] = @SalesPersonEmail)
				
			BEGIN
			
				INSERT INTO Sales.SalesPerson ([FirstName], [LastName], [EmployeeNumber], [SalaryHr], [LevelId], [Email], [StartDate],[IsActive])
				VALUES (@FirstName, @LastName, @EmployeeNumber, @SalaryHr, @LevelId, @SalesPersonEmail, @SalesPersonStart,1);


			END
			
			ELSE
			
				BEGIN

					UPDATE [Sales].[SalesPerson] SET [SalaryHr] = @SalaryHr WHERE [Email] = @SalesPersonEmail;

						PRINT 'Salary Updated';

				END

		COMMIT TRANSACTION;

END
GO





-- Erin Wright already exists.
EXECUTE [Sales].[InsertUpdateSalesPerson] @FirstName = 'Erin', 
										  @LastName = 'Wright', 
										  @EmployeeNumber = '0005221',
										  @SalaryHr = 545, 
										  @StartDate = NULL;
GO



-- How can we determine if select * and select 1 are the same?
-- Let's check statistics and the execution plan.
SET STATISTICS IO ON;

IF EXISTS (SELECT 1 FROM [Sales].[SalesPerson] WHERE [Email] = 'ErinWright@WiredBrainCoffee.com')
	BEGIN
		PRINT 'Erin is already here!';
	END

SET STATISTICS IO OFF;
GO



-- Let's check statistics and the execution plan.
SET STATISTICS IO ON;

IF EXISTS (SELECT * FROM [Sales].[SalesPerson] WHERE [Email] = 'ErinWright@WiredBrainCoffee.com')
	BEGIN
		PRINT 'Erin is already here!';
	END

SET STATISTICS IO OFF;
GO




-- How can we determine if select * and select 1 are the same?
-- Checking statistics and the execution plan.
SET STATISTICS IO ON;

IF EXISTS (SELECT 1 FROM [Sales].[SalesOrder] WHERE [Id] = 1)
	BEGIN
		PRINT 'This is Select 1';
	END

SET STATISTICS IO OFF;
GO



-- Checking statistics and the execution plan.
SET STATISTICS IO ON;

IF EXISTS (SELECT * FROM [Sales].[SalesOrder] WHERE [Id] = 1)
	BEGIN
		PRINT 'This is Select *';
	END

SET STATISTICS IO OFF;
GO