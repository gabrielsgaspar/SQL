WITH t1 AS (
		SELECT m.title AS film_title,
			   c.name AS category_name,
			   r.rental_id AS rental_id
			FROM category c
			JOIN film_category f
			ON c.category_id = f.category_id
			JOIN film m
			ON m.film_id = f.film_id
			JOIN inventory i
			ON m.film_id = i.film_id
			JOIN rental r
			ON i.inventory_id = r.inventory_id
		WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
			)

SELECT film_title,
	   category_name,
	   COUNT(*) AS rental_count
	FROM t1
GROUP BY 1, 2
ORDER BY 2, 1;
