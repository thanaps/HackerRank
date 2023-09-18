SELECT
    con.contest_id,
    con.hacker_id,
    con.name,
    SUM(ss.ts) AS ts, 
    SUM(ss.ta) AS ta,
    SUM(vs.tv) AS tv,
    SUM(vs.tu) AS tu
FROM Contests con
INNER JOIN Colleges col USING(contest_id)
INNER JOIN Challenges cha USING(college_id)
LEFT JOIN (SELECT 
                challenge_id,
                SUM(total_views) AS tv,
                SUM(total_unique_views) AS tu
            FROM View_Stats 
            GROUP BY challenge_id) vs USING(challenge_id)
LEFT JOIN (SELECT 
                challenge_id,
                SUM(total_submissions) AS ts,
                SUM(total_accepted_submissions) AS ta
            FROM Submission_Stats  
            GROUP BY challenge_id) ss USING(challenge_id)
GROUP BY con.contest_id,
        con.hacker_id,
        con.name
HAVING tv
    OR tu
    OR ts
    OR ta <> 0
ORDER BY con.contest_id
