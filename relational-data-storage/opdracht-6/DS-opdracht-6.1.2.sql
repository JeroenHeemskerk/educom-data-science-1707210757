SELECT gemeente, leverancier, hc AS total_hitcount, avg_hc AS average_hitcount
FROM (
    SELECT COMM.id, COMM.name AS gemeente, S.name AS leverancier, SUM(hitcount) AS hc
    FROM mhl_hitcount HC
    JOIN mhl_suppliers S ON S.id = HC.supplier_ID
    JOIN mhl_cities CITY ON CITY.id = S.city_ID
    JOIN mhl_communes COMM ON COMM.id = CITY.commune_ID
    JOIN mhl_districts DIST ON DIST.id = COMM.district_ID
    JOIN mhl_countries CTRY ON CTRY.id = DIST.country_ID
    WHERE CTRY.name = 'Nederland'
    GROUP BY COMM.id, S.name) A
JOIN (
    SELECT COMM.id, COMM.name, AVG(hitcount) AS avg_hc
    FROM mhl_hitcount HC
    JOIN mhl_suppliers S ON S.id = HC.supplier_ID
    JOIN mhl_cities CITY ON CITY.id = S.city_ID
    JOIN mhl_communes COMM ON COMM.id = CITY.commune_ID
    JOIN mhl_districts DIST ON DIST.id = COMM.district_ID
    JOIN mhl_countries CTRY ON CTRY.id = DIST.country_ID
    WHERE CTRY.name = 'Nederland'
    GROUP BY COMM.name) B
ON A.id = B.id
WHERE hc > avg_hc
ORDER BY gemeente, hc DESC
-- could order by ABS(hc-avg_hc) DESC, as per description but functionally does the same thing as only above average values are shown
