-- Top and bottom 5 most rented movies and how many times they have been rented
(
	SELECT f.film_id, 
		f.title AS Title,
		COUNT(r.rental_id) AS TimesRented
	FROM rental r INNER JOIN inventory i 
	ON r.inventory_id = i.inventory_id
	INNER JOIN film f 
	ON i.film_id = f.film_id
	GROUP BY f.film_id
	ORDER BY TimesRented DESC
	LIMIT 5
)
UNION
(
	SELECT f.film_id, 
		f.title AS Title,
		COUNT(r.rental_id) AS TimesRented
	FROM rental r INNER JOIN inventory i 
	ON r.inventory_id = i.inventory_id
	INNER JOIN film f 
	ON i.film_id = f.film_id
	GROUP BY f.film_id
	ORDER BY TimesRented 
	LIMIT 5
)
ORDER BY TimesRented DESC