SELECT EXTRACT(MONTH FROM rental_date) AS rental_month, 
       EXTRACT(YEAR FROM rental_date) AS rental_year,
       s.store_id AS store_id,
       COUNT(*) AS count_rentals
  FROM store AS s
  JOIN staff AS st
  ON s.store_id = st.store_id
  JOIN rental r
  ON st.staff_id = r.staff_id
GROUP BY 1, 2, 3
ORDER BY 2, 1;
