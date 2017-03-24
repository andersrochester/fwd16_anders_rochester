SELECT 
    COUNT(crewID) AS 'deceaced members'
FROM
    manifest.crew
WHERE
    deceased = 1;