---create table for Q4 Data

drop table if exists Q4_data;
create table Q4_data
(
	id			int,
	name		varchar(20),
	location	varchar(20)
);
insert into Q4_data values(1,null,null);
insert into Q4_data values(2,'David',null);
insert into Q4_data values(3,null,'London');
insert into Q4_data values(4,null,null);
insert into Q4_data values(5,'David',null);


select * from Q4_data;

--------------------------Problem Statement:  Derive expected output---
/* 1 David London
   5 David London
*/


--------------------------------------------------------------SOLUTION 1----------------------------------------------

SELECT TOP 1 id,name,location
FROM (SELECT id FROM Q4_data) id
CROSS JOIN (SELECT name FROM Q4_data WHERE name IS NOT NULL) name
CROSS JOIN (SELECT location FROM Q4_data WHERE location IS NOT NULL ) location

SELECT TOP 1 id,name,location
FROM (SELECT id FROM Q4_data ) id
CROSS JOIN (SELECT name FROM Q4_data WHERE name IS NOT NULL) name
CROSS JOIN (SELECT location FROM Q4_data WHERE location IS NOT NULL ) location
ORDER BY ID DESC

--------------------------------------------------------------SOLUTION 2----------------------------------------------

SELECT MIN(id),MIN(name),MIN(location)
FROM Q4_data

SELECT MAX(id),MAX(name),MAX(location)
FROM Q4_data

