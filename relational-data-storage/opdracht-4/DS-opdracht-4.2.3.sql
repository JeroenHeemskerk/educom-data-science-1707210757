SELECT B.name AS Hoofdrubriek, A.name AS Subrubriek
FROM mhl_rubrieken A
JOIN mhl_rubrieken B
ON A.parent = B.id

UNION

SELECT name as Hoofdrubriek, REPLACE(parent, '0','') as Subrubriek
FROM mhl_rubrieken
WHERE parent = 0
ORDER BY Hoofdrubriek, Subrubriek
