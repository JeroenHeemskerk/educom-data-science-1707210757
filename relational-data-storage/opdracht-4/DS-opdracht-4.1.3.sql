SELECT R.name as Rubriek, Suppliers.name as Supplier, straat, huisnr, postcode
FROM (
    SELECT mhl_suppliers.name, straat, huisnr, postcode, mhl_rubriek_view_ID as rubriek_id
    FROM mhl_suppliers
    JOIN (SELECT id FROM `mhl_cities` WHERE name = 'amsterdam') amscity ON mhl_suppliers.city_ID = amscity.id
    JOIN (mhl_suppliers_mhl_rubriek_view) ON mhl_suppliers.id = mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID) Suppliers
JOIN (
    SELECT A.id, name
    FROM mhl_rubrieken A
    JOIN (
        SELECT id
        FROM mhl_rubrieken
        WHERE name = 'drank') B
    ON A.parent = B.id OR A.id = B.id) R
ON Suppliers.rubriek_id = R.id
ORDER BY Rubriek, Supplier;
