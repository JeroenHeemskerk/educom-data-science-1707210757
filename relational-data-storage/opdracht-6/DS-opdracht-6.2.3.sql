SELECT DAYNAME(joindate) AS 'Dag van de week', COUNT(joindate) AS 'Aantal aanmeldingen'
FROM mhl_suppliers
GROUP BY DAYNAME(joindate)
ORDER BY DAYOFWEEK(joindate)
