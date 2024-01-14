USE [WiredBrainCoffee];
GO

/*
Notes from Susan
A script for adding a new salesperson
1) Remember, we no longer use a period between first and last names on the email.
2) If we don't know their start date, use today.
3) If we don't know the levelId, use 3 for staff.
*/
INSERT INTO [Sales].[SalesPerson] ([FirstName], [LastName], [EmployeeNumber], [SalaryHr], [LevelId], [Email],[StartDate],[IsActive])
VALUES ('Erin','Wright','0005221',475,3,'ErinWright@WiredBrainCoffee.com',GETDATE(),1);
GO
    


CREATE OR ALTER PROCEDURE [Sales].[InsertSalesPerson]
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

			INSERT INTO Sales.SalesPerson ([FirstName], [LastName], [EmployeeNumber], [SalaryHr], [LevelId], [Email], [StartDate],[IsActive])
			VALUES (@FirstName, @LastName, @EmployeeNumber, @SalaryHr, @LevelId, @SalesPersonEmail, @SalesPersonStart,1);

		COMMIT TRANSACTION;

END
GO



-- Now let's run this procedure.
EXECUTE [Sales].[InsertSalesPerson] @FirstName = 'Erin', 
									@LastName = 'Wright', 
									@EmployeeNumber = '0005221',
									@SalaryHr = 475, 
									@StartDate = NULL;
GO


SELECT * FROM [Sales].[SalesPerson]
WHERE [Email] = 'ErinWright@WiredBrainCoffee.com';
GO