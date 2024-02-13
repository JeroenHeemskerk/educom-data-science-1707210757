SELECT mhl_cities.name, IFNULL(mhl_communes.name, 'INVALID') as gemeente
FROM mhl_cities
LEFT JOIN mhl_communes
ON mhl_cities.commune_ID = mhl_communes.id;
