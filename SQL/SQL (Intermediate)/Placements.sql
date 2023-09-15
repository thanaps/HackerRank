SELECT a.name
FROM (
        SELECT *
        FROM students
        LEFT JOIN friends USING (ID)
        LEFT JOIN packages USING (ID)
    ) a
LEFT JOIN students s ON a.friend_id = s.id
LEFT JOIN packages p ON a.friend_id = p.id
WHERE a.salary < p.salary
ORDER BY p.salary
