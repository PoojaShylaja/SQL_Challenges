--Weather Observation Station 10

SELECT Distinct City
FROM Station
WHERE Right(City,1) NOT IN ('a','e','i','o','u');