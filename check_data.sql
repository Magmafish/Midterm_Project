SELECT * FROM neighborhood;

SELECT * FROM poi_info;

SELECT * FROM poi_category;

/*
SELECT neighborhood, category, COUNT(*)
FROM poi_category
GROUP BY neighborhood, category;
*/

ALTER TABLE neighborhood
ADD COLUMN criminal_rate REAL;
