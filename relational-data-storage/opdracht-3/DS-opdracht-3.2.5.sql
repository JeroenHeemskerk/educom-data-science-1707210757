SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
WHERE REGEXP_REPLACE(huisnr, '[^0-9].*', '') BETWEEN 10 AND 20;
