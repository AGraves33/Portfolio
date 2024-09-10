-- List the employees who have handled orders that were greater than $10000 and the customers they handled

SELECT
	e.employeeName,
	c.contactName,
	CustomerOrder.purchaces
FROM [Northwind Trade Food Sales].dbo.employees e
JOIN [Northwind Trade Food Sales].dbo.orders o
ON e.employeeID = o.employeeID
JOIN [Northwind Trade Food Sales].dbo.customers c
ON o.customerID = c.customerID
JOIN(
	SELECT 
		ord.customerID,
		SUM(od.unitPrice * od.quantity * (1-od.discount)) AS purchaces
		FROM [Northwind Trade Food Sales].dbo.orders ord
		JOIN [Northwind Trade Food Sales].dbo.order_Details od
		ON ord.orderID = od.orderID
		GROUP BY ord.CustomerID
) AS CustomerOrder 
ON c.customerID = CustomerOrder.customerID
WHERE CustomerOrder.purchaces >= 10000
ORDER BY e.employeeName, purchaces DESC;