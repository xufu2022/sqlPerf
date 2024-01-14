CREATE PROCEDURE dbo.SalesTotalsPerMonth_Recompile (@Country CHAR(2))
AS
    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC
	OPTION (RECOMPILE);
GO


CREATE PROCEDURE dbo.SalesTotalsPerMonth_Variables (@Country CHAR(2))
AS

	DECLARE @Country_inner CHAR(2);
	SET @Country_inner = @Country;

    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country_inner
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC;
GO

CREATE PROCEDURE dbo.SalesTotalsPerMonth_Unknown (@Country CHAR(2))
AS
    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC
	OPTION (OPTIMIZE FOR (@Country UNKNOWN));
GO

CREATE PROCEDURE dbo.SalesTotalsPerMonth_OptimiseFor (@Country CHAR(2))
AS
    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC
	OPTION (OPTIMIZE FOR (@Country = 'UK'));
GO

CREATE PROCEDURE dbo.SalesTotalsPerMonth_Small (@Country CHAR(2))
AS
    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC;
GO

CREATE PROCEDURE dbo.SalesTotalsPerMonth_Large (@Country CHAR(2))
AS
    SELECT  o.Reference AS OrderReference,
            o.Country AS CountryCode,
            DATEADD(MONTH, DATEDIFF(MONTH, 0, o.OrderDate), 0) AS OrderMonth,
            SUM(od.ItemPrice * od.Quantity) AS Total
    FROM    dbo.Orders o
            INNER JOIN dbo.OrderDetails od ON od.OrderID = o.OrderID
    WHERE   o.Country = @Country
            AND o.Status != 'C'
    GROUP BY o.Reference,
            o.Country,
            o.OrderDate
    ORDER BY OrderMonth DESC,
            Total DESC;
GO

CREATE PROCEDURE dbo.SalesTotalsPerMonth_Split (@Country CHAR(2))
AS
	IF (@Country IN ('MU','RE'))
		EXEC dbo.SalesTotalsPerMonth_Small @Country
	ELSE
		EXEC dbo.SalesTotalsPerMonth_Large @Country

GO