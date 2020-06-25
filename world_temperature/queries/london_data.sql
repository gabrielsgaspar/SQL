SELECT year,
               city,
               country,
               avg_temp,
               AVG(avg_temp) OVER (ORDER BY year ASC ROWS 49 PRECEDING) AS mov_avg_50
        FROM city_data
        WHERE country  = 'United Kingdom' AND city = 'London' AND year BETWEEN 1750 AND 2013;
