-- Find Revenue by each store
SELECT s.store_id,
    CONCAT(a.address, ', ', c.city, ', ', co.country) AS Address,
    SUM(p.amount) AS Revenue
FROM payment p INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i 
ON r.inventory_id = i.inventory_id
INNER JOIN store s 
ON i.store_id = s.store_id
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city c 
ON a.city_id = c.city_id
INNER JOIN country co 
ON c.country_id = co.country_id
GROUP BY s.store_id;
