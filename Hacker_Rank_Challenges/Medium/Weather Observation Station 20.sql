--Weather Observation Station 20

SELECT CONVERT( DECIMAL(10,4), LAT_N)
FROM(SELECT ROW_NUMBER() OVER( ORDER BY LAT_N) AS rn, LAT_N FROM STATION) as RankNames
WHERE rn=(SELECT CASE WHEN COUNT(LAT_N) % 2 = 0  THEN COUNT(LAT_N) / 2
          ELSE COUNT(LAT_N) / 2 + 1
         END
         FROM STATION);
