-- Movie Revenue by month for each year

SELECT
    f.title AS Title,
    DATE_FORMAT(p.payment_date, '%Y-%m') AS YearMonth,
    SUM(p.amount) AS Revenue,
    COUNT(r.rental_id) AS TimesRented
FROM payment p INNER JOIN rental r 
ON p.rental_id = r.rental_id
INNER JOIN inventory i 
ON r.inventory_id = i.inventory_id
INNER JOIN film f 
ON i.film_id = f.film_id
GROUP BY f.title, YearMonth
ORDER BY f.title, YearMonth;