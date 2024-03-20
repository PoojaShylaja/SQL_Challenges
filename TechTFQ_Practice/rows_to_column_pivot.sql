/*
QUESTION: Derive the output.
write a query to fetch the results into a desired format.

Solve the problem using CASE statement, PIVOT table and CROSSTAB function.
*/
drop table if exists sales_data;
create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );

insert into sales_data values (convert(datetime, '01-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '02-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '03-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '01-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '02-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '03-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '01-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '02-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '03-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '01-Mar-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Apr-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-May-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Jun-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Jul-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Aug-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Sep-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Oct-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Nov-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Dec-2021',105), 'Cust-3', '-1$');

select * from sales_data;

-------------------------------------------------Solution-------------------------------------------


WITH pivot_data AS (
						SELECT *
						FROM (
								SELECT customer_id AS Customer,
									 FORMAT(sales_date,'MMM-yy') AS sales_date,
									 CAST(replace(amount,'$','') AS INT) AS amount
								FROM sales_data
							  ) AS data_sales
						PIVOT(
							  SUM(AMOUNT)
							  FOR sales_date IN ([Jan-21],[Feb-21],[Mar-21],[Apr-21],[May-21],[Jun-21],[Jul-21],
							                     [Aug-21],[Sep-21],[Oct-21],[Nov-21],[Dec-21])
							 ) AS pivot_table

						UNION
 
						SELECT *
						FROM (
							  SELECT 'Total' AS Customer,
									 FORMAT(sales_date,'MMM-yy') AS sales_date,
									 CAST(replace(amount,'$','') AS INT) AS amount
							  FROM sales_data
						) AS data_sales
						PIVOT(
							  SUM(AMOUNT)
							  FOR sales_date IN ([Jan-21],[Feb-21],[Mar-21],[Apr-21],[May-21],[Jun-21],[Jul-21],[Aug-21],[Sep-21],[Oct-21],[Nov-21],[Dec-21])
						 ) AS pivot_table

					),

		final_data AS (
						  SELECT Customer,
						  COALESCE([JAN-21],0) AS Jan_21,
						  COALESCE([Feb-21],0) AS Feb_21,
						  COALESCE([Mar-21],0) AS Mar_21,
						  COALESCE([Apr-21],0) AS Apr_21,
						  COALESCE([May-21],0) AS May_21,
						  COALESCE([Jun-21],0) AS Jun_21,
						  COALESCE([Jul-21],0) AS Jul_21,
						  COALESCE([Aug-21],0) AS Aug_21,
						  COALESCE([Sep-21],0) AS Sep_21,
						  COALESCE([Oct-21],0) AS Oct_21,
						  COALESCE([Nov-21],0) AS Nov_21,
						  COALESCE([Dec-21],0) AS Dec_21
						  FROM pivot_data
					)

SELECT Customer,
       CASE WHEN Jan_21 < 0  THEN CONCAT('(',Jan_21 * -1,')$') ELSE CONCAT(Jan_21,'$') END AS Jan_21,
	   CASE WHEN Feb_21 < 0  THEN CONCAT('(',Feb_21 * -1,')$') ELSE CONCAT(Feb_21,'$') END AS Feb_21,
	   CASE WHEN Mar_21 < 0  THEN CONCAT('(',Mar_21 * -1,')$') ELSE CONCAT(Mar_21,'$') END AS Mar_21,
	   CASE WHEN Apr_21 < 0  THEN CONCAT('(',Apr_21 * -1,')$') ELSE CONCAT(Apr_21,'$') END AS Apr_21,
	   CASE WHEN May_21 < 0  THEN CONCAT('(',May_21 * -1,')$') ELSE CONCAT(May_21,'$') END AS May_21,
	   CASE WHEN Jun_21 < 0  THEN CONCAT('(',Jun_21 * -1,')$') ELSE CONCAT(Jun_21,'$') END AS Jun_21,
	   CASE WHEN Jul_21 < 0  THEN CONCAT('(',Jul_21 * -1,')$') ELSE CONCAT(Jul_21,'$') END AS Jul_21,
	   CASE WHEN Aug_21 < 0  THEN CONCAT('(',Aug_21 * -1,')$') ELSE CONCAT(Aug_21,'$') END AS Aug_21,
	   CASE WHEN Sep_21 < 0  THEN CONCAT('(',Sep_21 * -1,')$') ELSE CONCAT(Sep_21,'$') END AS Sep_21,
	   CASE WHEN Oct_21 < 0  THEN CONCAT('(',Oct_21 * -1,')$') ELSE CONCAT(Oct_21,'$') END AS Oct_21,
	   CASE WHEN Nov_21 < 0  THEN CONCAT('(',Nov_21 * -1,')$') ELSE CONCAT(Nov_21,'$') END AS Nov_21,
	   CASE WHEN Dec_21 < 0  THEN CONCAT('(',Dec_21 * -1,')$') ELSE CONCAT(Dec_21,'$') END AS Dec_21,
	   CASE WHEN Customer = 'Total' THEN '' 
	        WHEN (Jan_21+Feb_21+Mar_21+Apr_21+May_21+Jun_21+Jul_21+Aug_21+Sep_21+Oct_21+Nov_21+Dec_21) < 0 
			THEN CONCAT('(',(Jan_21+Feb_21+Mar_21+Apr_21+May_21+Jun_21+Jul_21+Aug_21+Sep_21+Oct_21+Nov_21+Dec_21) * -1,')$')
			ELSE (Jan_21+Feb_21+Mar_21+Apr_21+May_21+Jun_21+Jul_21+Aug_21+Sep_21+Oct_21+Nov_21+Dec_21)
	   END AS Total
FROM final_data

