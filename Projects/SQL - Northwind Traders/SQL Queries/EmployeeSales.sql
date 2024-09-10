-- Employee sales 

SELECT
	e.employeeName,
	SUM(od.quantity * od.unitPrice * (1-od.discount)) as Sales
FROM [Northwind Trade Food Sales].dbo.employees e
JOIN [Northwind Trade Food Sales].dbo.orders o
ON e.employeeID = o.employeeID
JOIN [Northwind Trade Food Sales].dbo.order_details od
ON o.orderID = od.orderID
GROUP BY e.employeeName
ORDER BY Sales
