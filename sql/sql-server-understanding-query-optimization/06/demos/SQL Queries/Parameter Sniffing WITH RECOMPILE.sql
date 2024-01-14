--CREATE INDEX ix_Product_Sales ON dbo.FactOnlineSales (ProductKey) INCLUDE(SalesOrderNumber)

SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey =1827 

SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey = 1662; 

SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey =176; 

/*Create a sproc*/
CREATE PROCEDURE Get_Product_SalesAmt
@ProductKey int
AS
SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey = @ProductKey;


/*Run sproc*/
EXECUTE Get_Product_SalesAmt @ProductKey = 1827

/*Alter sproc with RECOMPILE*/
ALTER PROCEDURE Get_Product_SalesAmt
@ProductKey int
WITH RECOMPILE
AS
SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey = @ProductKey;

/*Alter sproc with Query Hint*/
ALTER PROCEDURE Get_Product_SalesAmt
@ProductKey int
AS
SELECT SalesOrderNumber
	, SalesAmount
	, productKey
FROM dbo.FactOnlineSales
WHERE ProductKey = @ProductKey
OPTION (OPTIMIZE FOR (@ProductKey=1827));
