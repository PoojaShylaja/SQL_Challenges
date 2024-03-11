--Contest Leaderboard

WITH CTE_Maxscore AS
(SELECT h.hacker_id,h.name,s.challenge_id,max(s.score) AS score_max
FROM Hackers h
JOIN Submissions s
ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id,h.name,s.challenge_id)
SELECT ms.hacker_id,ms.name,SUM(ms.score_max) AS Total_Sum
FROM CTE_Maxscore ms
GROUP BY ms.hacker_id,ms.name
HAVING SUM(ms.score_max)>1
ORDER BY SUM(ms.score_max) DESC,ms.hacker_id;