CREATE VIEW full_table AS (
    WITH new_table AS(
                SELECT id, name, marks, 
                        CASE WHEN marks BETWEEN min_mark AND max_mark THEN grade ELSE NULL END AS grade
                FROM students, grades
            )
    SELECT *
    FROM new_table 
    WHERE grade IS NOT NULL
);

SELECT name, grade, marks
FROM full_table 
WHERE grade >= 8
ORDER BY grade DESC, name ASC;

SELECT CASE WHEN grade < 8 THEN NULL ELSE name END AS name, 
        grade, 
        marks
FROM full_table
WHERE grade < 8
ORDER BY grade DESC, marks ASC;
