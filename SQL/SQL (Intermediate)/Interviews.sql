SELECT
    contest_id,
    hacker_id,
    name,
    COALESCE(SUM(total_submissions), 0) AS total_submissions, 
    COALESCE(SUM(total_accepted_submissions), 0) AS total_accepted_submissions,
    COALESCE(SUM(total_views), 0) AS total_views,
    COALESCE(SUM(total_unique_views), 0) AS total_unique_views
FROM Contests
LEFT JOIN Colleges USING(contest_id)
LEFT JOIN Challenges USING(college_id)
LEFT JOIN (SELECT 
                challenge_id,
                SUM(total_views) AS total_views,
                SUM(total_unique_views) AS total_unique_views
            FROM View_Stats 
            GROUP BY challenge_id) vs USING(challenge_id)
LEFT JOIN (SELECT 
                challenge_id,
                SUM(total_submissions) AS total_submissions,
                SUM(total_accepted_submissions) AS total_accepted_submissions
            FROM Submission_Stats  
            GROUP BY challenge_id) ss USING(challenge_id)
GROUP BY contest_id,
        hacker_id,
        name
HAVING total_views
    OR total_unique_views
    OR total_submissions
    OR total_accepted_submissions <> 0
ORDER BY contest_id
