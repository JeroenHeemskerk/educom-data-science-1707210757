SELECT S.name, IFNULL(D.Contact, 't.a.v. de directie') as contact, L.adres, L.postcode, L.stad
FROM verzendlijst L
LEFT JOIN directie D ON L.id = D.ID
LEFT JOIN mhl_suppliers S ON L.id = S.id
ORDER BY S.name;
