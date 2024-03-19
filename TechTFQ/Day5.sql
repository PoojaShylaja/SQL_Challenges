/*
PROBLEM STATEMENT: Generate salary report
Using the given Salary, Income and Deduction tables, first write an sql query to 
populate the Emp_Transaction table as shown below and then generate a salary report as shown.
*/

--Create table Salary,Income,Deduction

drop table if exists salary;
create table salary
(
	emp_id		int,
	emp_name	varchar(30),
	base_salary	int
);
insert into salary values(1, 'Rohan', 5000);
insert into salary values(2, 'Alex', 6000);
insert into salary values(3, 'Maryam', 7000);


drop table if exists income;
create table income
(
	id			int,
	income		varchar(20),
	percentage	int
);
insert into income values(1,'Basic', 100);
insert into income values(2,'Allowance', 4);
insert into income values(3,'Others', 6);


drop table if exists deduction;
create table deduction
(
	id			int,
	deduction	varchar(20),
	percentage	int
);
insert into deduction values(1,'Insurance', 5);
insert into deduction values(2,'Health', 6);
insert into deduction values(3,'House', 4);

select * from salary;
select * from income;
select * from deduction;

------------------------------------------------------------SOLUTION 1 EMP_TRANSACTION------------------------------

drop table if exists emp_transaction;
create table emp_transaction
(
	emp_id		int,
	emp_name	varchar(50),
	trns_type	varchar(20),
	amount		int
);

INSERT INTO emp_transaction
SELECT emp_id,emp_name,p.trans_type,
CASE 
	WHEN p.trans_type = 'Insurance' THEN CAST(0.05 * s.base_salary AS int)
	WHEN p.trans_type = 'House' THEN CAST(0.04 * s.base_salary AS int)
	WHEN p.trans_type = 'Basic' THEN CAST(s.base_salary AS int)
	WHEN p.trans_type = 'Health' THEN CAST(0.06 * s.base_salary AS int)
	WHEN p.trans_type = 'Allowance' THEN CAST(0.04 * s.base_salary AS int)
	WHEN p.trans_type = 'Others' THEN CAST(0.06 * s.base_salary AS int)
	ELSE 'NO OUPTPUT'
END AS Amount
FROM salary s
CROSS JOIN
(
	SELECT i.income AS trans_type,i.percentage
	FROM income i
	UNION
	SELECT d.deduction as trans_type,d.percentage
	FROM deduction d
	) AS p

	select * from emp_transaction;


	------------------------------------------REPORT-----------------------------------------

SELECT emp_name AS Employee,
		   Basic,Allowance,Others,
		   (Basic+Allowance+Others) AS Gross,
		   Insurance,House,Health,
		   (Insurance+House+Health) AS Total_Deductions,
		   (Basic+Allowance+Others)-(Insurance+House+Health) AS NET_PAY
	FROM(
		 SELECT emp_name,trns_type,amount FROM emp_transaction
		 ) bq
	PIVOT(
		 SUM(amount)
		 FOR trns_type IN ([Allowance],[Basic],[Health],[House],[Insurance],[Others])
		) pq

	

	