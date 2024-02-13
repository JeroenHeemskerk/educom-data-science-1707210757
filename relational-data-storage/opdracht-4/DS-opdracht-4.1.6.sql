SELECT hc.hitcount, supp.name as leverancier, city.name as stad, comm.name as gemeente, dist.name as provincie
FROM mhl_suppliers supp
JOIN mhl_cities city ON supp.city_ID = city.id
JOIN mhl_communes comm ON city.commune_ID = comm.id
JOIN mhl_districts dist ON comm.district_ID = dist.id
JOIN mhl_hitcount hc ON supp.id = hc.supplier_ID
WHERE year=2014 AND month=1 AND dist.name = "Limburg" OR dist.name="Brabant" OR dist.name="Zeeland"
