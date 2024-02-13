SELECT c1.name AS 'c1.name', c2.name AS 'c2.name', c1.id AS 'c1.id', c2.id AS 'c2.id', c1.commune_ID AS 'c1.commune_ID', c2.commune_ID AS 'c2.commune_ID'
FROM mhl_cities c1
JOIN mhl_cities c2
ON c1.name = c2.name AND c1.id < c2.id
ORDER BY c1.name;
