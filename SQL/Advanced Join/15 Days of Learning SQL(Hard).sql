SELECT submission_date, 

            (
            SELECT COUNT(DISTINCT hacker_id)
            FROM Submissions s2
            WHERE s2.submission_date = s1.submission_date
            AND (SELECT COUNT(DISTINCT s3.submission_date) 
                FROM Submissions s3
                WHERE s3.hacker_id = s2.hacker_id
                AND s3.submission_date < s1.submission_date)
                = DATEDIFF(s1.submission_date , '2016-03-01')
            ),

            (
            SELECT hacker_id
            FROM Submissions s4
            WHERE s4.submission_date = s1.submission_date
            GROUP BY hacker_id
            ORDER BY COUNT(*) DESC, hacker_id ASC
            LIMIT 1
            ) AS sub1,

            (
            SELECT name
            FROM Hackers 
            WHERE hacker_id = sub1
            )
            
FROM (SELECT DISTINCT submission_date
        FROM submissions) AS s1;
