SELECT 
    w.id as id,
    wp.age as age,
    w.coins_needed as coins_needed,
    w.power as power
FROM Wands w
LEFT JOIN Wands_Property wp 
    USING(code)
WHERE (age, coins_needed, power) IN ( 
    SELECT 
        age,
        min(coins_needed) AS coins_needed,
        power
    FROM Wands 
    LEFT JOIN Wands_Property USING(code)
    WHERE is_evil = 0
    GROUP BY power, age
    )
ORDER BY power DESC, age DESC
