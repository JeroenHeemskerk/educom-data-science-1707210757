SELECT id, joindate, DATEDIFF(CURRENT_DATE(), joindate) AS days
FROM mhl_suppliers
ORDER BY days