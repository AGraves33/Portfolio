-- Find the total sales by each month and group them by the year. 

SELECT
	YEAR(o.orderDate) AS _Year,
	MONTH(o.orderDate) AS _Month,
	SUM(od.unitPrice * od.quantity * (1-od.discount)) AS Sales
FROM [Northwind Trade Food Sales].dbo.order_details od
JOIN [Northwind Trade Food Sales].dbo.orders o
ON od.orderID = o.orderID
GROUP BY YEAR(o.orderDate),MONTH(o.orderDate)
ORDER BY _Year DESC,Sales DESC;


-- Combine the Months to see totals for every year
SELECT
	MONTH(o.orderDate) AS _Month,
	SUM(od.unitPrice * od.quantity) AS Sales
FROM [Northwind Trade Food Sales].dbo.order_details od
JOIN [Northwind Trade Food Sales].dbo.orders o
ON od.orderID = o.orderID
GROUP BY MONTH(o.orderDate)
ORDER BY Sales DESC;