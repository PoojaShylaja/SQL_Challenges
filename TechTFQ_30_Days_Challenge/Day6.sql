/* Student Performance 
 PROBLEM STATEMENT:
You are given a table having the marks of one student in every test. 
You have to output the tests in which the student has improved his performance. 
For a student to improve his performance he has to score more than the previous test.
Provide 2 solutions, one including the first test score and second excluding it. */

drop table if exists  student_tests;
create table student_tests
(
	test_id		int,
	marks		int
);
insert into student_tests values(100, 55);
insert into student_tests values(101, 55);
insert into student_tests values(102, 60);
insert into student_tests values(103, 58);
insert into student_tests values(104, 40);
insert into student_tests values(105, 50);

select * from student_tests;




----------------------------------------------------Solutions-----------------------------------------------
WITH test_val AS
(
SELECT test_id,marks,	   
	   LAG(marks,1,0) OVER (ORDER BY test_id) AS new_value,
	   (marks-COALESCE(LAG(marks,1) OVER (ORDER BY test_id),0)) AS flag
FROM student_tests
)
SELECT test_id,marks
FROM test_val
WHERE flag >0

---------------------------------------------------Solution2--------------------------------------------------
WITH test_val AS
(
SELECT test_id,marks,	   
	   LAG(marks,1,marks) OVER (ORDER BY test_id) AS new_value,
	   (marks-COALESCE(LAG(marks,1,marks) OVER (ORDER BY test_id),0)) AS flag
FROM student_tests
)
SELECT test_id,marks
FROM test_val
WHERE flag > 0 
