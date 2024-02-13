SELECT mhl_suppliers.name, straat, huisnr, postcode, swl_cities.name as plaatsnaam
FROM mhl_suppliers
JOIN (
    SELECT cities.id, cities.name
    FROM mhl_cities cities
    JOIN (
        SELECT *
        FROM mhl_communes
        WHERE name = 'Steenwijkerland') swl
    ON cities.commune_ID = swl.id ) swl_cities
ON mhl_suppliers.city_ID = swl_cities.id;
