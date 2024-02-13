SELECT name, CONCAT(UPPER(LEFT(name, 1)), SUBSTR(name, 2, LENGTH(name))) AS nice_name
FROM mhl_cities
