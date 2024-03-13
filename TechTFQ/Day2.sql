--Creating table mountain_huts

drop table if exists mountain_huts;

create table mountain_huts 
(
	id 			integer not null unique,
	name 		varchar(40) not null unique,
	altitude 	integer not null
);

--Inserting value

insert into mountain_huts values (1, 'Dakonat', 1900);
insert into mountain_huts values (2, 'Natisa', 2100);
insert into mountain_huts values (3, 'Gajantut', 1600);
insert into mountain_huts values (4, 'Rifat', 782);
insert into mountain_huts values (5, 'Tupur', 1370);

--creating table trails

drop table if exists trails;

create table trails 
(
	hut1 		integer not null,
	hut2 		integer not null
);

--Inserting values

insert into trails values (1, 3);
insert into trails values (3, 2);
insert into trails values (3, 5);
insert into trails values (4, 5);
insert into trails values (1, 5);

select * from mountain_huts;
select * from trails;

/*Problem Statement: 
A ski resort company is planning to construct a new ski slope using a pre-existing network of mountain huts and trails 
between them. A new slope has to begin at one of the mountain huts, have a middle station at another hut connected with 
the first one by a direct trail, and end at the third mountain hut which is also connected by a direct trail to the 
second hut. The altitude of the three huts chosen for constructing the ski slope has to be strictly decreasing.


Each entry in the table trails represents a direct connection between huts with IDs hut1 and hut2. Note that 
all trails are bidirectional.
Create a query that finds all triplets(startpt,middlept,endpt) representing the mountain huts that may be used 
for construction of a ski slope.
Output returned by the query can be ordered in any way.

Assume that:
*there is no trail going from a hut back to itself;
*for every two huts there is at most one direct trail connecting them;
*each hut from table trails occurs in table mountain_huts;

*/

----------------------------------------------------------SOLUTION-----------------------------------------------------------------------

WITH trail_path AS (
					SELECT t1.hut1 AS start_hut,h1.name AS start_hut_name,h1.altitude AS start_hut_altitude,
					       t1.hut2 AS end_hut,h2.name AS end_hut_name,h2.altitude AS end_hut_altitude,
						   CASE 
						       WHEN h1.altitude > h2.altitude THEN 1
						       ELSE 0 
					       END AS flag
					FROM mountain_huts h1
					JOIN trails t1
					ON h1.id = t1.hut1
					JOIN mountain_huts h2
					ON h2.id = t1.hut2
					),
    
	trail_desc AS ( SELECT 
							CASE
								WHEN flag = 1 THEN start_hut ELSE end_hut 
							END AS start_h,
							CASE 
								WHEN flag = 1 THEN start_hut_name ELSE end_hut_name
							END AS start_h_name,
							CASE
								WHEN flag = 1 THEN end_hut ELSE start_hut 
							END AS end_h,
							CASE 
								WHEN flag = 1 THEN end_hut_name ELSE start_hut_name
							END AS end_h_name  					 		    
					 FROM trail_path 
				  )
SELECT td1.start_h_name AS startpt,td1.end_h_name AS middlept,td2.end_h_name AS endpt
FROM trail_desc td1
JOIN trail_desc td2
ON td1.end_h = td2.start_h


