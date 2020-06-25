WITH t1 AS (
		SELECT  c.customer_id AS customer_id,
				CONCAT(c.first_name, ' ', c.last_name) AS fullname,
				DATE_TRUNC('month', p.payment_date) AS payment_mon,
				p.amount AS amount,
				SUM(amount) OVER(PARTITION BY c.customer_id, DATE_TRUNC('month', p.payment_date) ORDER BY DATE_TRUNC('month', p.payment_date)) AS pay_amount
		FROM customer c
		JOIN payment p
		ON p.customer_id = c.customer_id
	ORDER BY 2, 3
		   ),
		
     t2 AS (
		SELECT customer_id,
			   fullname,
			   SUM(amount) AS total_spent
			FROM t1
		GROUP BY 1, 2
		ORDER BY 3 DESC
		LIMIT 10
			)
		
SELECT t1.payment_mon AS payment_mon,
	   t2.fullname AS fullname,
	   t1.pay_amount AS pay_amount,
	   COUNT(payment_mon) AS pay_countpermon
	FROM t2
	JOIN t1
	ON t1.customer_id = t2.customer_id
GROUP BY 1, 2, 3
ORDER BY 2;
