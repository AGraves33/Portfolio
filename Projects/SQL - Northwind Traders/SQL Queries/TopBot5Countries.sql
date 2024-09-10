-- Count what the top and bottom 5 countires/cities are in terms of order count
-- Using CTE Expressions
WITH Countries AS (
	SELECT   -- Microsoft SQL Server does not support LIMIT
		c.country,
		COUNT(*) AS orderCount
	FROM [Northwind Trade Food Sales].dbo.customers c
	JOIN [Northwind Trade Food Sales].dbo.orders o
	ON c.customerID = o.customerID
	GROUP BY c.country
),
TopFive AS (
	SELECT TOP 5
		country,
		orderCount
	FROM Countries
	ORDER BY orderCount DESC 
),
BottomFive AS (
	SELECT TOP 5
		country,
		orderCount
	FROM Countries
	ORDER BY orderCount ASC
)
SELECT * FROM TopFive
UNION
SELECT * From BottomFive
ORDER BY orderCount DESC;