--Interviews

WITH CTE_viewstats AS(
SELECT challenge_id,
       SUM(total_views) AS total_views,
       SUM(total_unique_views) AS total_unique_views
FROM View_Stats
GROUP BY challenge_id
),
CTE_submissionstats AS(
SELECT challenge_id,
       SUM(total_submissions) AS total_submissions,
       SUM(total_accepted_submissions) AS total_accepted_submissions
FROM Submission_Stats
GROUP BY challenge_id
)
SELECT c.contest_id,c.hacker_id,c.name,
       COALESCE(SUM(total_submissions), 0) AS total_submissions,
       COALESCE(SUM(total_accepted_submissions), 0) AS   total_accepted_submissions,
       COALESCE(SUM(total_views), 0) AS total_views,
       COALESCE(SUM(total_unique_views), 0) AS total_unique_views       
FROM Contests c
JOIN Colleges cg ON c.contest_id = cg.contest_id
JOIN Challenges cgs ON cg.college_id = cgs.college_id
LEFT JOIN CTE_viewstats vs ON cgs.challenge_id = vs.challenge_id
LEFT JOIN CTE_submissionstats ss ON cgs.challenge_id = ss.challenge_id
GROUP BY c.contest_id,c.hacker_id,c.name
HAVING SUM(total_views)>0 
    OR SUM(total_unique_views)>0
    OR SUM(total_submissions) >0
    OR SUM(total_accepted_submissions) > 0
ORDER BY contest_id;

