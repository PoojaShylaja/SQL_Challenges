/*
Find Relevant dates

PROBLEM STATEMENT:
In the given input table DAY_INDICATOR field indicates the day of the week with the first 
character being Monday, followed by Tuesday and so on.
Write a query to filter the dates column to showcase only those days where day_indicator 
character for that day of the week is 1

*/


-- Creating Tables

drop table if exists Day_Indicator;
create table Day_Indicator
(
	Product_ID 		varchar(10),	
	Day_Indicator 	varchar(7),
	Dates			date
);

insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'04-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'05-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'06-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'07-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'08-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'09-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'10-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'04-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'05-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'06-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'07-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'08-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'09-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'10-Mar-2024', 102));

select * from Day_Indicator;


------------------------------------Solution-----------------------------------------------------------------------

SELECT x.Product_ID,x.Day_Indicator,x.Dates
FROM(
	SELECT *,((DATEPART(WEEKDAY,Dates)+5)%7)+1 AS DAY,
		CASE WHEN SUBSTRING(Day_Indicator,((DATEPART(WEEKDAY,Dates)+5)%7)+1,1) = 1 THEN 'INCLUDE' ELSE 'EXCLUDE'END AS Needed_day
	FROM Day_Indicator) AS x
	WHERE Needed_day ='INCLUDE'




	

