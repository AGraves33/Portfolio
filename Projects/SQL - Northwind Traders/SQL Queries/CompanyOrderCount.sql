-- Counts how many orders were made by each company, and where they are located
SELECT 
	c.companyName,
	c.country,
	c.city,
	COUNT(o.orderID) AS orderCount
FROM [Northwind Trade Food Sales].dbo.customers c
JOIN [Northwind Trade Food Sales].dbo.orders o 
ON c.customerID = o.customerID
GROUP BY c.companyName, c.country, c.city
ORDER BY orderCount