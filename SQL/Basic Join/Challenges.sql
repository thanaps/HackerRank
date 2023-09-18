SELECT
    h.hacker_id,
    name,
    COUNT(challenge_id) as challenges_created
FROM Hackers h
LEFT JOIN Challenges USING (hacker_id)
GROUP BY h.hacker_id, name
HAVING COUNT(challenge_id) = 50 
OR COUNT(challenge_id) IN
    (
    SELECT 
        challenges_created
    FROM (
            SELECT 
            hacker_id,
            name,
            COUNT(challenge_id) as challenges_created
            FROM Hackers
            LEFT JOIN Challenges c USING (hacker_id)
            GROUP BY hacker_id, name
            ) AS old
    GROUP BY challenges_created
    HAVING COUNT(challenges_created) = 1
    )
ORDER BY challenges_created DESC, h.hacker_id
