SELECT
    s.hacker_id,
    name
FROM Submissions s
LEFT JOIN Hackers h USING (hacker_id)
LEFT JOIN Challenges c USING (challenge_id)
LEFT JOIN Difficulty d USING (difficulty_level)
WHERE d.score = s.score
GROUP BY s.hacker_id, name
HAVING COUNT(challenge_id) > 1
ORDER BY COUNT(challenge_id) DESC, s.hacker_id
