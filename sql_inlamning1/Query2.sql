SELECT 
    a.description, COUNT(fa.depID) AS dep_count
FROM
    manifest.crew AS fa
        JOIN
    manifest.departement AS a ON a.depID = fa.depID
GROUP BY fa.depID
ORDER BY dep_count , a.description;