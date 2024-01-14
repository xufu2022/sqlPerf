SELECT *
FROM Data.Orders AS ord
	INNER JOIN Data.Customer AS cu ON cu.CustomerKey = ord.CustomerKey
	INNER JOIN Data.Product AS pr ON pr.ProductKey = ord.ProductKey
WHERE cu.Age > 20
	AND pr.Brand = 'Contoso'
