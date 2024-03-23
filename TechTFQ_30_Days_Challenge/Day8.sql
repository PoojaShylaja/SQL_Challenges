/*

Add the missing values

PROBLEM STATEMENT: 
In the given input table, there are rows with missing JOB_ROLE values. Write a query to fill 
in those blank fields with appropriate values. Assume row_id is always in sequence and job_role 
field is populated only for the first skill.Provide two different solutions to the problem.

*/

---Creating table


drop table if exists job_skills;
create table job_skills
(
	row_id		int,
	job_role	varchar(20),
	skills		varchar(20)
);
insert into job_skills values (1, 'Data Engineer', 'SQL');
insert into job_skills values (2, null, 'Python');
insert into job_skills values (3, null, 'AWS');
insert into job_skills values (4, null, 'Snowflake');
insert into job_skills values (5, null, 'Apache Spark');
insert into job_skills values (6, 'Web Developer', 'Java');
insert into job_skills values (7, null, 'HTML');
insert into job_skills values (8, null, 'CSS');
insert into job_skills values (9, 'Data Scientist', 'Python');
insert into job_skills values (10, null, 'Machine Learning');
insert into job_skills values (11, null, 'Deep Learning');
insert into job_skills values (12, null, 'Tableau');

select * from job_skills;


------------------------------SOLUTION------------------------------------------------------
WITH TEMP  AS (
				SELECT * ,
					   sum(CASE WHEN job_role IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY row_id) as segment
					   FROM job_skills)
SELECT row_id,FIRST_VALUE(job_role) over ( partition by segment order by row_id) as job_role,skills
from TEMP


