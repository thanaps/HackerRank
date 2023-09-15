SELECT CONCAT(name, "(", LEFT(occupation, 1), ")")
FROM occupations
ORDER BY name;

SELECT CONCAT("There are a total of", ' ', COUNT(*), ' ', LCASE(occupation), 's.')
FROM occupations
GROUP BY occupation
ORDER BY count(*) ASC, occupation ASC;
