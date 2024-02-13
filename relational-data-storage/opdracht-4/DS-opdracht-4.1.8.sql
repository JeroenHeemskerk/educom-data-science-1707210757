SELECT c1.name AS 'name', c1.id AS cid1, c2.id AS cid2, c1.commune_ID AS gid1, c2.commune_ID AS gid2, c1.gemeente AS gemeente_1, c2.gemeente AS gemeente_2
FROM (
    SELECT mhl_cities.name, mhl_cities.id, mhl_cities.commune_ID, mhl_communes.name AS gemeente
    FROM mhl_cities
    JOIN mhl_communes
    ON mhl_cities.commune_ID = mhl_communes.id) c1
JOIN (
    SELECT mhl_cities.name, mhl_cities.id, mhl_cities.commune_ID, mhl_communes.name AS gemeente
    FROM mhl_cities
    JOIN mhl_communes
    ON mhl_cities.commune_ID = mhl_communes.id) c2
ON c1.name = c2.name AND c1.id < c2.id
ORDER BY c1.name;
