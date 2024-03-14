---Create a table footer

DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 	INT PRIMARY KEY,
	car VARCHAR(20), 
	length INT, 
	width INT, 
	height INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 


SELECT * FROM FOOTER; 


/*-----------------------------
PROBLEM STATEMENT: Write a sql query to return the footer values from input table, meaning all the last 
non null values from each field as shown in expected output.
---------------------------------*/


-----------------------------------Solution 1

SELECT *
FROM (SELECT TOP 1 car FROM FOOTER WHERE CAR IS NOT NULL ORDER BY id DESC ) CAR
CROSS JOIN (SELECT TOP 1 length FROM FOOTER WHERE length IS NOT NULL ORDER BY id DESC) length
CROSS JOIN (SELECT TOP 1 width FROM FOOTER WHERE width IS NOT NULL ORDER BY id DESC) width
CROSS JOIN (SELECT TOP 1 height FROM FOOTER WHERE height IS NOT NULL ORDER BY id DESC) height

-----------------------------------Solution 2

WITH temp AS (
				SELECT *,
				SUM(CASE WHEN car IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY id) AS car_segment,
				SUM(CASE WHEN length IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY id) AS length_segment,
				SUM(CASE WHEN width IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY id) AS width_segment,
				SUM(CASE WHEN height IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY id) AS height_segment
				FROM FOOTER
			 )
SELECT TOP 1 
FIRST_VALUE(car) OVER (PARTITION BY car_segment ORDER BY id) AS new_car,
FIRST_VALUE(length) OVER (PARTITION BY length_segment ORDER BY id) AS new_length,
FIRST_VALUE(width) OVER (PARTITION BY width_segment ORDER BY id) AS new_width,
FIRST_VALUE(height) OVER (PARTITION BY height_segment ORDER BY id) AS new_height
FROM temp
ORDER BY id DESC

