DECLARE @Country CHAR(2) = 'US'

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



		