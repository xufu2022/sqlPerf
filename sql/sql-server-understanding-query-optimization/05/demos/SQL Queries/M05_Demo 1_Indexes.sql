--set statistics IO, time ON;

--#1 Filtering condition
SELECT [CustomerKey]
      ,[GeographyKey]
      ,[CustomerAlternateKey]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[NameStyle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Suffix]
      ,[Gender]
      ,[EmailAddress]
      ,[YearlyIncome]
      ,[TotalChildren]
      ,[NumberChildrenAtHome]
      ,[EnglishEducation]
      ,[SpanishEducation]
      ,[FrenchEducation]
      ,[EnglishOccupation]
      ,[SpanishOccupation]
      ,[FrenchOccupation]
      ,[HouseOwnerFlag]
      ,[NumberCarsOwned]
      ,[AddressLine1]
      ,[AddressLine2]
      ,[Phone]
      ,[DateFirstPurchase]
      ,[CommuteDistance]
  FROM [AdventureWorksDW2020].[dbo].[DimCustomer]
  WHERE CustomerKey = 11001

  --#2 Data selectivity
  --Identify column selectivity
  SELECT COUNT(DISTINCT c.Gender) AS DistinctValues
		, COUNT(c.Gender) AS TotalRows
		, CAST(COUNT(DISTINCT c.Gender) AS DECIMAL) / CAST(COUNT(c.Gender) AS DECIMAL) AS ColSelectivity
		, (1.0 / COUNT(DISTINCT c.Gender)) AS ColDensity
  FROM dbo.DimCustomer AS c


SELECT [CustomerKey]
      ,[BirthDate]
      ,[Gender]
  FROM [AdventureWorksDW2020].[dbo].[DimCustomer] WITH (INDEX(ix_Cust_gender))
  WHERE Gender = 'F'
	AND BirthDate = '1973-11-06'

--CREATE INDEX FOR CUSTOMER'S GENDER
CREATE INDEX ix_Cust_gender ON dbo.DimCustomer (BirthDate, Gender) WITH DROP_EXISTING;


--#3 COLUMN ORDER
USE AdventureWorks2019;

CREATE INDEX ix_Address_city ON Person.Address (City, PostalCode);

SELECT AddressID
	, City
	, PostalCode
FROM Person.Address
--WHERE City = 'Seattle'
WHERE PostalCode = '98104'