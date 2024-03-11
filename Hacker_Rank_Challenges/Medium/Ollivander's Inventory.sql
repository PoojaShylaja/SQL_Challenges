--Ollivander's Inventory

---minimum no of gold galleons needed of high power and high age
---output id,age,coins_needed,power
---order power desc,age desc

WITH CTE_min_coins AS (
SELECT ROW_NUMBER() OVER (PARTITION BY code,power ORDER BY code,power,coins_needed asc) AS rn,id,code,coins_needed,power
FROM Wands)

SELECT  id, age, coins_needed,power
FROM Wands_Property wp 
JOIN CTE_min_coins mc
ON mc.code= wp.code AND mc.rn=1
WHERE is_evil=0
ORDER BY mc.power DESC,wp.age DESC;
