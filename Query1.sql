SELECT 
    rank, COUNT(rank) AS apperance
FROM
    manifest.crew
GROUP BY rank
ORDER BY apperance DESC;
