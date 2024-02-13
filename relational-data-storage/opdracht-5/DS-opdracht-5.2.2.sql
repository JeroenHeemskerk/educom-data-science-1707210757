SELECT
	mhl_cities.name, 
	COUNT(IF(mhl_membertypes.name = 'Gold', 1, NULL)) as Gold,
    COUNT(IF(mhl_membertypes.name = 'Silver', 1, NULL)) as Silver,
    COUNT(IF(mhl_membertypes.name = 'Bronze', 1, NULL)) as Bronze,
    COUNT(IF(mhl_membertypes.name NOT IN ('Gold', 'Silver', 'Bronze'), 1, NULL)) as Other

FROM mhl_suppliers
JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id
JOIN mhl_membertypes ON mhl_suppliers.membertype = mhl_membertypes.id

GROUP BY mhl_cities.name
ORDER BY Gold DESC;
