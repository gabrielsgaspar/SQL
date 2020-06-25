SELECT year,
               avg_temp,
               AVG(avg_temp) OVER (ORDER BY year ASC ROWS 49 PRECEDING) AS mov_avg_50
        FROM global_data
        WHERE year BETWEEN 1750 AND 2013;
