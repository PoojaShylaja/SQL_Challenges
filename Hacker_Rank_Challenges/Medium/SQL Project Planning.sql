--SQL Project Planning

WITH CTE_StartDateBegin AS(
SELECT Start_Date,Rank() Over (Order By Start_Date) as Start_Rank
FROM PROJECTS
WHERE Start_Date NOT IN (SELECT End_Date FROM PROJECTS)),
CTE_EndDateBegin AS
(SELECT End_Date,Rank() Over (Order By End_Date) as End_Rank
FROM PROJECTS
WHERE End_Date NOT IN (SELECT Start_Date FROM PROJECTS))
SELECT a.Start_Date,b.End_Date
FROM CTE_StartDateBegin a
JOIN CTE_EndDateBegin b
ON a.Start_Rank =b.End_Rank
ORDER BY DATEDIFF(Day,a.Start_Date,b.End_Date),a.Start_Date;