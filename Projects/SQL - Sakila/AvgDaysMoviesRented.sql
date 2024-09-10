-- Average Length of Rental Duration for Movies

SELECT f.title AS Title,
	AVG(
		CASE
			WHEN r.return_date IS NOT NULL THEN DATEDIFF(r.return_date,r.rental_date)
            ELSE DATEDIFF(current_date(),r.rental_date) -- Use current date if the return date is null
		END) AS AvgDaysRented
FROM rental r INNER JOIN inventory i 
ON r.inventory_id = i.inventory_id
INNER JOIN film f 
ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY AvgDaysRented;