CREATE VIEW DIRECTIE
AS
SELECT supplier_ID as ID, c.name as Contact, contacttype as Functie, d.name as Department
FROM mhl_contacts c
JOIN mhl_departments  d ON c.department = d.id
WHERE d.name = 'Directie' OR c.contacttype LIKE '%directeur%';
