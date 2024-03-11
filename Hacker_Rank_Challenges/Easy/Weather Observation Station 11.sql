--Weather Observation Station 11

SELECT Distinct City 
FROM Station
WHERE lower(Left(City,1)) NOT IN ('a','e','i','o','u') OR
            Right(City,1) NOT IN ('a','e','i','o','u');