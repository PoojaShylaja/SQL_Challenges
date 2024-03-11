--Weather Observation Station 12

SELECT Distinct City
FROM Station
WHERE Lower(Left(City,1)) NOT IN ('a','e','i','o','u') AND
            Right(City,1) NOT IN ('a','e','i','o','u');