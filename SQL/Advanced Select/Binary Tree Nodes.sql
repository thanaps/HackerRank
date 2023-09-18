SELECT n,
        CASE WHEN p is null THEN 'Root'
            WHEN n in (SELECT n
                       FROM bst
                       EXCEPT
                       SELECT p
                       FROM bst
                                ) THEN 'Leaf'
        
        ELSE 'Inner' END AS node_type
FROM bst
ORDER BY n;
