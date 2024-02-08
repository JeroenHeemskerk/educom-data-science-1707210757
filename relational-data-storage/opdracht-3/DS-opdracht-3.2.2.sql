SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
JOIN (SELECT id FROM mhl_membertypes WHERE name in ('Gold', 'Silver', 'Bronze', 'GEEN INTERRESSE')) member
ON mhl_suppliers.membertype = member.id;
