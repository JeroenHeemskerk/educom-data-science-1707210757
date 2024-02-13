SELECT 
	SUPP.name,
	IFNULL(CONTACTS.name, 't.a.v. de directie') as aanhef,
    IF(SUPP.p_address = '', CONCAT(SUPP.straat, " ", SUPP.huisnr), SUPP.p_address) AS adres,
    IF (p_address != '', p_postcode, postcode) AS postcode,
    IF (p_address != '', POSTCITY.name, CITY.name) AS stad,
    IF (p_address != '', POSTDIST.name, DIST.name) AS provincie
FROM mhl_suppliers SUPP
LEFT JOIN ( SELECT mhl_contacts.supplier_ID, mhl_contacts.name FROM mhl_contacts JOIN mhl_departments ON mhl_contacts.department = mhl_departments.id) CONTACTS
ON CONTACTS.supplier_ID = SUPP.id
LEFT JOIN mhl_cities AS POSTCITY ON SUPP.p_city_ID = POSTCITY.id
LEFT JOIN mhl_communes AS POSTCOMM ON POSTCITY.commune_ID = POSTCOMM.id
LEFT JOIN mhl_districts AS POSTDIST ON POSTCOMM.district_ID = POSTDIST.id
LEFT JOIN mhl_cities AS CITY ON SUPP.city_ID = CITY.id
LEFT JOIN mhl_communes AS COMM ON CITY.commune_ID = COMM.id
LEFT JOIN mhl_districts AS DIST ON COMM.district_ID = DIST.id
WHERE postcode <> ''
ORDER BY provincie, stad, SUPP.name;
