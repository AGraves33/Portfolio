-- Find the average order amount per customer and their country

SELECT 
	c.contactName,
	c.country,
	ROUND(AVG(od.quantity * od.unitPrice *(1-od.discount)),2) AS AverageOrder
FROM [Northwind Trade Food Sales].dbo.customers c
JOIN [Northwind Trade Food Sales].dbo.orders o
ON c.customerID = o.customerID
JOIN [Northwind Trade Food Sales].dbo.order_details od
ON od.orderID = o.orderID
GROUP BY c.contactName, c.country
ORDER BY AverageOrder DESC;