SELECT name, propname, IFNULL(content, 'NOT SET') AS content
FROM
    (SELECT mhl_suppliers.id AS supp_id, mhl_suppliers.name, straat, huisnr, postcode
    FROM mhl_suppliers 
    JOIN (SELECT mhl_cities.id FROM `mhl_cities` WHERE name = 'amsterdam') amscity
    ON mhl_suppliers.city_ID = amscity.id) ams
CROSS JOIN
    (SELECT name AS propname, proptype, id AS prop_id
    FROM mhl_propertytypes
    WHERE proptype = 'A') properties
    
LEFT JOIN mhl_yn_properties
ON mhl_yn_properties.propertytype_ID = prop_id AND mhl_yn_properties.supplier_ID = supp_id
ORDER BY name, prop_id;

/*
als de precieze volgorde van het antwoord nodig is kan het zo (bovenstaand antwoord heeft een ORDER BY nodig om niet alles door elkaar te halen)

SELECT
    mhl_suppliers.name,
    mhl_propertytypes.name,
    IFNULL(mhl_yn_properties.content, "NOT SET") as value
FROM mhl_suppliers
CROSS JOIN mhl_propertytypes
LEFT JOIN mhl_yn_properties ON mhl_suppliers.id=mhl_yn_properties.supplier_ID AND  mhl_propertytypes.id=mhl_yn_properties.propertytype_ID
JOIN mhl_cities ON mhl_suppliers.city_ID=mhl_cities.id
WHERE mhl_cities.name='amsterdam' AND mhl_propertytypes.proptype="A"

*/