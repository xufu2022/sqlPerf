SELECT 
	YEAR(InvoiceDate) AS [Year], 
	MONTH(InvoiceDate) AS [Month],
    SUM(Amount) AS Revenue
FROM Enrollment.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate);









SELECT 
	YEAR(InvoiceDate) AS [Year], 
	MONTH(InvoiceDate) AS [Month],
    SUM(Amount) AS Revenue,
	SUM(SUM(Amount)) OVER (PARTITION BY YEAR(InvoiceDate)) as RevenuePerYear
FROM Enrollment.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate);









SELECT 
	YEAR(InvoiceDate) AS [Year], 
	MONTH(InvoiceDate) AS [Month],
    SUM(Amount) AS Revenue,
	SUM(SUM(Amount)) OVER (PARTITION BY YEAR(InvoiceDate)) as RevenuePerYear,
	SUM(SUM(Amount)) OVER (
		PARTITION BY YEAR(InvoiceDate) 
		ORDER BY MONTH(InvoiceDate)
	) as RunningRevenuePerYear
FROM Enrollment.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate);




SELECT 
	YEAR(InvoiceDate) AS [Year], 
	MONTH(InvoiceDate) AS [Month],
    SUM(Amount) AS Revenue,
	SUM(SUM(Amount)) OVER (PARTITION BY YEAR(InvoiceDate)) as RevenuePerYear,
	SUM(SUM(Amount)) OVER (
		PARTITION BY YEAR(InvoiceDate) 
		ORDER BY MONTH(InvoiceDate)
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) as RunningRevenuePerYear
FROM Enrollment.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate);




SELECT 
	YEAR(InvoiceDate) AS [Year], 
	MONTH(InvoiceDate) AS [Month],
    SUM(Amount) AS Revenue,
	(SUM(Amount) - LAG(SUM(Amount)) OVER (
		PARTITION BY YEAR(InvoiceDate) ORDER BY MONTH(InvoiceDate)))
	/ LAG(SUM(Amount)) OVER (
		PARTITION BY YEAR(InvoiceDate) ORDER BY MONTH(InvoiceDate)) * 100
		as EvolutionOfRevenue
FROM Enrollment.Invoice
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY YEAR(InvoiceDate), MONTH(InvoiceDate);


