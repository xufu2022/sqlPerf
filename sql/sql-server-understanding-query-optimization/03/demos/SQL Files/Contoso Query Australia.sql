

SELECT cu.FirstName
	, cu.LastName
	, geo.RegionCountryName AS country
	, geo.CityName AS city
	, SUM(fso.SalesAmount) AS salesAmount
FROM dbo.FactOnlineSales AS fso
	INNER JOIN dbo.DimCustomer AS cu ON cu.CustomerKey = fso.CustomerKey
	--INNER JOIN dbo.DimProduct AS pr ON pr.ProductKey = fso.ProductKey
	INNER JOIN dbo.DimGeography AS geo ON geo.GeographyKey = cu.GeographyKey
WHERE cu.Education = 'Bachelors'
	AND geo.RegionCountryName = 'Australia'
GROUP BY cu.CustomerKey
	, cu.FirstName
	, cu.LastName
	, geo.RegionCountryName 
	, geo.CityName
HAVING SUM(fso.SalesAmount) > 100
ORDER BY salesAmount DESC