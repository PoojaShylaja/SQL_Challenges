--Challenges

WITH CTE_Totalhallenges_found AS
(SELECT h.hacker_id,h.name,COUNT(c.challenge_id) AS Total_Challenges,
 COUNT(*) OVER (Partition by COUNT(c.challenge_id)) AS Same_Challenges
FROM Hackers h
JOIN Challenges c
ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id,h.name)
SELECT tc.hacker_id, tc.name, tc.Total_Challenges
FROM CTE_Totalhallenges_found tc
WHERE tc.Same_Challenges <= 1 OR
      tc.Total_Challenges =(SELECT MAX(Total_Challenges) FROM CTE_Totalhallenges_found )
ORDER BY tc.Total_Challenges DESC,tc.hacker_id;

    





