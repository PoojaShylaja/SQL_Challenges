--Weather Observation Station 8

SELECT Distinct City 
FROM Station
WHERE Lower(LEFT(City,1)) IN ('a','e','i','o','u') AND 
      Right(City,1) IN ('a','e','i','o','u');