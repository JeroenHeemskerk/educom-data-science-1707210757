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

SELECT rubriek AS name, IFNULL(total, 'Geen hits')
FROM rubrieken
LEFT JOIN (
    SELECT RV.mhl_rubriek_view_ID AS r_id, SUM(HC.hitcount) AS total
	FROM mhl_hitcount HC
	RIGHT JOIN mhl_suppliers_mhl_rubriek_view RV ON RV.mhl_suppliers_ID = HC.supplier_ID
	GROUP BY RV.mhl_rubriek_view_ID) RHC
ON rubrieken.id = RHC.r_id
