/* -used to create rubriek view (only run once)-
CREATE VIEW RUBRIEKEN
AS
SELECT
    IFNULL(CHILD.id, PARENT.id) AS id,
    IF(ISNULL(PARENT.name), CHILD.name, CONCAT(PARENT.name, ' - ', CHILD.name)) AS rubriek,
    IFNULL(PARENT.name, CHILD.name) AS hoofdrubriek,
    IF(ISNULL(PARENT.name), '', CHILD.name) AS subrubriek
FROM mhl_rubrieken PARENT
RIGHT JOIN mhl_rubrieken CHILD ON CHILD.parent = PARENT.id
ORDER BY rubriek
*/

SELECT
	rubriek as name,
    COUNT(mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID) AS numsup
FROM rubrieken
JOIN mhl_suppliers_mhl_rubriek_view ON rubrieken.id = mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID
GROUP BY rubriek