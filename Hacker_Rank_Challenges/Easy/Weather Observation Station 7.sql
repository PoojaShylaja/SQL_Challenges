--Weather Observation Station 7

SELECT Distinct City
FROM Station
WHERE lower(Right(City,1)) IN ('a','e','i','o','u');