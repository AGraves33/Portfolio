-- Categorizes each renter based on how many rentals they have had

Select cust.customer_id, 
	CONCAT(cust.first_name,' ',cust.last_name) Customer,
	cust.store_id,
    COUNT(r.customer_id) AS TotalRentals,
	CASE
		WHEN COUNT(r.customer_id) >= 30 THEN 'HIGH VALUE'
        WHEN COUNT(r.customer_id) BETWEEN 20 AND 29 THEN 'AVG VALUE'
        ELSE 'LOW VALUE'
	END DRIP
FROM rental r INNER JOIN customer cust
ON r.customer_id = cust.customer_id
GROUP BY cust.customer_id
ORDER BY store_id DESC, TotalRentals DESC ;