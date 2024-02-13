SELECT YEAR(joindate) AS jaar, MONTHNAME(joindate) AS maand, COUNT(joindate) AS aantal
FROM mhl_suppliers
GROUP BY jaar, maand
ORDER BY jaar, MONTH(joindate)
