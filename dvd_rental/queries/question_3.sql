WITH t1 AS (
			SELECT c.name AS category_name,
              	   m.rental_duration,
                   NTILE(4) OVER(ORDER BY m.rental_duration) AS standard_quartile
          		FROM category AS c
                JOIN film_category AS f
                ON c.category_id = f.category_id 
                JOIN film AS m
                ON m.film_id = f.film_id
			WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
			)
 
 SELECT category_name,
 		standard_quartile,
		COUNT(*) AS count
 FROM t1
 GROUP BY 1, 2
 ORDER BY 1, 2;
