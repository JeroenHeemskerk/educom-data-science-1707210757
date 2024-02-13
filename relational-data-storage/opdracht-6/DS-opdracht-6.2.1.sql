SELECT DATE_FORMAT(joindate, '%d.%m.%Y') AS joindate, id
FROM mhl_suppliers
WHERE LAST_DAY(joindate) - joindate <= 7
