SELECT  
    hacker_id,
    name,
    SUM(max) AS total
FROM
    (
    SELECT  
        hacker_id,
        name,
        challenge_id,
        MAX(score) AS max
    FROM Hackers
    LEFT JOIN Submissions USING (hacker_id)
    GROUP BY hacker_id, name, challenge_id
    HAVING max > 0
    ) AS sub
GROUP BY hacker_id, name
ORDER BY total DESC, hacker_id ASC
