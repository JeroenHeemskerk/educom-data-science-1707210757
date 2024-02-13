/* -used to create month view (only run once)-
CREATE VIEW months_nl (id, name) AS 
    SELECT 1,'Januari'
    UNION SELECT 2,'Februari'
    UNION SELECT 3,'Maart'
    UNION SELECT 4,'April'
    UNION SELECT 5,'Mei'
    UNION SELECT 6,'Juni'
    UNION SELECT 7,'Juli'
    UNION SELECT 8,'Augustus'
    UNION SELECT 9,'September'
    UNION SELECT 10, 'Oktober'
    UNION SELECT 11,'November'
    UNION SELECT 12,'December'
*/

SELECT
    year AS jaar,
    months_nl.name AS maand,
    suppliers AS 'aantal leveranciers',
    hc_total AS 'totaal aantal hits'
FROM (
    SELECT year, month, COUNT(supplier_ID) AS suppliers, SUM(hitcount) AS hc_total
    FROM mhl_hitcount 
    GROUP BY year, month
) AS HC
JOIN months_nl ON month=months_nl.id
ORDER BY HC.year DESC, HC.month DESC
-- order by months_nl.name to match output exactly
