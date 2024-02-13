CREATE VIEW VERZENDLIJST
AS
SELECT
	S.id,
	IF(S.p_address = '', CONCAT(S.straat, ' ', S.huisnr), S.p_address) AS adres,
    IF(S.p_address = '', S.postcode, S.p_postcode) AS postcode,
    IF(S.p_address = '', C.name, PC.name) AS stad

FROM mhl_suppliers S
LEFT JOIN mhl_cities C ON S.city_ID = C.id
LEFT JOIN mhl_cities PC ON S.p_city_ID = PC.id
