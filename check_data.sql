
SELECT * FROM neighborhood;

SELECT * FROM poi_info;

SELECT * FROM poi_category;

SELECT category, COUNT(*)
FROM  poi_category
GROUP BY category;

SELECT n.borough, n.neighborhood, ifnull(s.total_school, 0) AS total_school, ifnull(h.total_hospital, 0) AS total_hospital, ifnull(r.total_restaurant, 0) AS total_restaurant, ifnull(b.total_bank, 0) AS total_bank
FROM neighborhood n
LEFT JOIN 
(SELECT borough, neighborhood, COUNT(*) AS total_school
FROM poi_category
WHERE category = 'schools'
GROUP BY borough, neighborhood) s
ON n.borough = s.borough AND n.neighborhood = s.neighborhood
LEFT JOIN 
(SELECT borough, neighborhood, COUNT(*) AS total_hospital
FROM poi_category
WHERE category = 'hospitals'
GROUP BY borough, neighborhood) h
ON n.borough = h.borough AND n.neighborhood = h.neighborhood
LEFT JOIN 
(SELECT borough, neighborhood, COUNT(*) AS total_restaurant
FROM poi_category
WHERE category = 'restaurants'
GROUP BY borough, neighborhood) r
ON n.borough = r.borough AND n.neighborhood = r.neighborhood
LEFT JOIN 
(SELECT borough, neighborhood, COUNT(*) AS total_bank
FROM poi_category
WHERE category = 'banks'
GROUP BY borough, neighborhood) b
ON n.borough = b.borough AND n.neighborhood = b.neighborhood
ORDER BY n.neighborhood, n.borough;



SELECT p.* FROM poi_info p
JOIN poi_category c ON
p.poi_id = c.poi_id AND p.api = c.api
WHERE c.neighborhood = 'East Harlem'
AND c.category = 'hospitals';



/*
DELETE FROM poi_category WHERE neighborhood = 'South Slope - Greenwood Heights';
*/
/*
UPDATE neighborhood SET latitude = 40.812433
WHERE neighborhood = 'Broadway Corridor';
*/