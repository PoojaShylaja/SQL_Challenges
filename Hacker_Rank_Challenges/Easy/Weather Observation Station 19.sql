--Weather Observation Station 19

SELECT CONVERT(DECIMAL(10, 4), SQRT(((MAX(LAT_N)-MIN(LAT_N)) * (MAX(LAT_N)-MIN(LAT_N))) + ((MAX(LONG_W)-MIN(LONG_W)) * (MAX(LONG_W)-MIN(LONG_W)))))
FROM STATION;