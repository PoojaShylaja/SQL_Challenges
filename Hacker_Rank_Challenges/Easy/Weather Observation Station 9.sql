--Weather Observation Station 9

SELECT Distinct City
FROM Station
WHERE Lower(Left(City,1)) NOT IN ('a','e','i','o','u');