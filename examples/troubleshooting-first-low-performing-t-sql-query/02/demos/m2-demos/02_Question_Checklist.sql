/*
You can ask Sally and yourself these questions by looking at the query.

Question 1 - What does this query do?

Sally uses it to report on the number of sales for each territory by year.
We also want to include the salesperson.
Sally takes this output and saves it to Excel for a pivot table.

Question 2 - What is the problem we're trying to solve?

The query takes longer and longer to run each month. Can you make it faster?

Question 3 - Is SQL pulling the correct data?

Not sure, but I think so.

Question 4 - Are we pulling back more data than we need?

Yes, Sally deletes most of the columns and filters out a lot of the data in Excel.

Question 5 - Does the query perform poorly?

Yes

Question 6 - Did it run faster at one time?

Yes, it ran faster a few months ago.
*/

USE WiredBrainCoffee;
GO

SELECT *
FROM Sales.SalesOrder so
LEFT OUTER JOIN Sales.SalesTerritory st ON so.SalesTerritory = st.Id
LEFT OUTER JOIN Sales.SalesPerson sp ON so.SalesPerson = sp.Id
WHERE CAST(so.SalesDate AS DATE) >= '1/01/2016'
	AND CAST(so.SalesDate AS DATE) <= '12/31/2022';
GO