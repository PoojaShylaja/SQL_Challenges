--Top Competitors

SELECT h.hacker_id , h.name 
--, COUNT(s.submission_id) AS count_num
--,s.challenge_id ,d.score,s.score,c.difficulty_level
FROM Hackers h
JOIN Submissions s
ON h.hacker_id = s.hacker_id
JOIN Challenges c
ON c.challenge_id  = s.challenge_id  
JOIN Difficulty d
ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score 
GROUP BY h.hacker_id , h.name
HAVING COUNT(s.submission_id) > 1
ORDER BY COUNT(s.submission_id) DESC,h.hacker_id