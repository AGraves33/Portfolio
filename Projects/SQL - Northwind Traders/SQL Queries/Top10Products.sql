-- Find top 10 selling Products and list the category they belong to

SELECT TOP 10
	p.productName,
	c.categoryName,
	SUM(od.quantity*od.unitPrice* (1-od.discount)) AS SalePrice
FROM [Northwind Trade Food Sales].dbo.order_details od
JOIN [Northwind Trade Food Sales].dbo.products p
ON od.productID = p.productID
JOIN [Northwind Trade Food Sales].dbo.categories c
ON p.categoryID = c.categoryID
GROUP BY p.productName, c.categoryName
ORDER BY SalePrice DESC;