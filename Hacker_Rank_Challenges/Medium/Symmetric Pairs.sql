Symmetric Pairs


WITH CTE_Temp AS(
SELECT x,y,ROW_NUMBER() OVER (ORDER BY x,y) AS rn
FROM FUNCTIONS
)
SELECT DISTINCT t1.x,t1.y
FROM CTE_Temp t1
JOIN CTE_Temp t2
ON t1.x=t2.y AND
   t2.x=t1.y AND
   t1.rn<>t2.rn
WHERE t1.x<=t1.y
ORDER BY t1.x;