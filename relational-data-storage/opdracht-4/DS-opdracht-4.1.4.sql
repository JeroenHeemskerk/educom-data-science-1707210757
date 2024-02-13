SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
JOIN (
    SELECT DISTINCT supplier_ID
    FROM mhl_yn_properties A
    JOIN (
        SELECT id
        FROM mhl_propertytypes
        WHERE name = 'specialistische leverancier' OR name = 'ook voor particulieren') B
    ON A.propertytype_ID = B.id
    WHERE content = 'Y') supp_properties
ON mhl_suppliers.id = supp_properties.supplier_ID
ORDER BY id;
