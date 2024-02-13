SELECT name, straat, huisnr, postcode, lat, lng
FROM mhl_suppliers
JOIN pc_lat_long
ON mhl_suppliers.postcode = pc_lat_long.pc6
ORDER BY lat DESC
LIMIT 5;
