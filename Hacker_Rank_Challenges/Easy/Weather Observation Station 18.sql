--Weather Observation Station 18

SELECT CONVERT(DECIMAL(10, 4), ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W))) FROM STATION