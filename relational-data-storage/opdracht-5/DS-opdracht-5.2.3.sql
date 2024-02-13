SELECT
	year,
    SUM(IF(month IN (1,2,3), hitcount, 0)) as Q1,
    SUM(IF(month IN (4,5,6), hitcount, 0)) as Q2,
    SUM(IF(month IN (7,8,9), hitcount, 0)) as Q3,
    SUM(IF(month IN (10,11,12), hitcount, 0)) as Q4,
	SUM(hitcount) as total

FROM mhl_hitcount
GROUP BY year;
