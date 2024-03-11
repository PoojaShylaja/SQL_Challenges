--Weather Observation Station 6

SELECT City
FROM Station
WHERE LEFT(City,1) IN ('A','E','I','O','U');