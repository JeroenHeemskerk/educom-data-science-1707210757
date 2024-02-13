SELECT name, SUM(hitcount) as numhits, COUNT(month) as nummonths, ROUND(SUM(hitcount) / COUNT(month)) as avgpermonth
FROM mhl_hitcount
JOIN mhl_suppliers
ON mhl_hitcount.supplier_ID = mhl_suppliers.id
GROUP BY name
ORDER BY numhits DESC;
