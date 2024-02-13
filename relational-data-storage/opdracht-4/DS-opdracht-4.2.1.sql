SELECT mhl_cities.name, mhl_cities.commune_ID
FROM mhl_cities
LEFT JOIN mhl_communes
ON mhl_cities.commune_ID = mhl_communes.id
WHERE mhl_communes.name IS NULL;
