DECLARE @q NVARCHAR(MAX)
	, @params NVARCHAR(MAX)

SET @q = N' SELECT cu.FirstName
	, cu.LastName
	, geo.RegionCountryName AS country
	, geo.CityName AS city
	, SUM(fso.SalesAmount) AS salesAmount
FROM dbo.FactOnlineSales AS fso
	INNER JOIN dbo.DimCustomer AS cu ON cu.CustomerKey = fso.CustomerKey
	INNER JOIN dbo.DimGeography AS geo ON geo.GeographyKey = cu.GeographyKey
WHERE cu.Education = @Education
	AND geo.RegionCountryName = @country
GROUP BY cu.CustomerKey
	, cu.FirstName
	, cu.LastName
	, geo.RegionCountryName 
	, geo.CityName
HAVING SUM(fso.SalesAmount) > 100
ORDER BY salesAmount DESC'

SET @params = N' @education NVARCHAR(64), @country NVARCHAR(64)'

EXEC sp_executesql @q
					, @params
					, @Education = 'Bachelors'
					, @country = 'France'