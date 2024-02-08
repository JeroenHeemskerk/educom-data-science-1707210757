SELECT name, straat, huisnr, postcode
FROM mhl_suppliers 
JOIN (SELECT id FROM `mhl_cities` WHERE name = 'amsterdam') amscity
ON mhl_suppliers.city_ID = amscity.id
UNION
SELECT name, straat, huisnr, postcode
FROM mhl_suppliers 
JOIN (SELECT id FROM `mhl_cities` WHERE name = 'den haag') dhcity
ON mhl_suppliers.p_city_ID = dhcity.id
