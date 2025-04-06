select ProductID,ProductName,UnitPrice,
	ntile(8) Over( order by unitprice desc) NT from products;
    
use achievers ;

select sum(SALARY) from employees;

select EMP_ID,FIRST_NAME,SALARY,sum(SALARY) OVER(),
 SALARY / sum(SALARY) OVER()*100 "Sal%" from employees;
 
 -- WAQ to list EMP_ID,FIRST_NAME,SALARY, Lowest , Highset and Avg salary for EACH ROLE ?
select emp_id,first_name,Role,salary,
	min(salary) over (partition by role) Lowest_Salary,
	max(salary) over (partition by role) Highest_Salary, 
avg(salary) over (partition by role) Avg_Salary from employees;

select EMP_ID,FIRST_NAME,SALARY,LAG(Salary,1) over(order by SALARY desc) from employees;

select EMP_ID,FIRST_NAME,SALARY,LEAD(Salary) over(order by SALARY desc) _LEAD ,
LAG(Salary,1) over(order by SALARY desc) _LAG
 from employees;

use northwind;
select Year(OrderDate),month(Orderdate),sum(Freight),
	lag(sum(Freight)) over() LastMonth ,
	 sum(Freight) - lag(sum(Freight)) over() Growth
from orders group by Year(OrderDate),month(OrderDate)
order by Year(OrderDate),month(OrderDate);

with cte as
(
select DEPT,Sum(Salary) TS from employees
 group by DEPT	
)select DEPT,TS /sum(TS) over()*100 as "Salary%" from cte ;

/* 
-- VIEW is an alternate way to see the data from 1 or more tables
  is a Stored Query
  a virtual table
*/

CREATE VIEW Vemployees
as
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,SALARY,EXP from employees;


select * from Vemployees;

CREATE VIEW SalaryByDept
as
select DEPT,Sum(Salary) as TotalSalary from employees
	group by DEPT;
    
    
select * from SalaryByDept;


CREATE VIEW StockByCategory
as
select CategoryName,Sum(UnitsInStock) as TotalStock 
	from products natural JOIN categories 
	group by CategoryName;

select * from StockByCategory;


create View Vprod
as 
select ProductID,ProductName,UnitPrice from products;


select * from Vprod;

create View UK_Customers 
as
select CustomerID,CompanyName,ContactTitle,Address,Country from customers
	where Country = 'UK';
    

select * from UK_Customers;


--  CREATE a View to list Top 10 customers with highest Freight charges.
create View Top10Company
as
	select CompanyName, sum(Freight) TotalFreight
	from customers natural Join orders
	group by CompanyName
	order by TotalFreight desc
	limit 10;

select * from Top10Company;




DELIMITER $$
USE `northwind`$$
CREATE PROCEDURE Top10CustomersByFreight ()
BEGIN
	select CompanyName,sum(Freight) Total_Freight from 	
	customers natural JOIN Orders
    group by CompanyName
    order by Total_Freight desc
    limit 10;
END$$

DELIMITER ;



call Top10CustomersByFreight;


-- CREATE A SP to list Product based on CategoryName

select ProductID,ProductName,UnitPrice,CategoryName,Description 
from products natural JOIN categories
	where CategoryName = 'Seafood';
    
    
call ProductsByCategoryName('Condiments');

select * from orders where year(OrderDate) = 1997;


Call OrderByYear();


--  User Defined Function   UDF 

select SquareNum(12);
select * from employees;
select EMP_ID,FIRST_NAME,EXP,SALARY,CalcBonus(Emp_ID) as Bonus from employees;

select EMP_ID,FIRST_NAME,SALARY,salary*.25 as Bonus from employees;

select EMP_ID,FIRST_NAME,EMP_RATING,SALARY,BonusByRating(Emp_ID) as Bonus from employees;

/*
-- CREATE a UDF for calc Bonus
-- Bonus is Calculated based on the ratings if the 
ratintg = 5  --- 25% of salary
ratintg = 4  --- 20% of salary
ratintg = 3  --- 15 of salary
ratintg = 2  --- 10% of salary
ratintg = 1  --- 0 of salary
*/

create table tblStudent(Rollno int, Sname   varchar(100));
insert into tblStudent values(101,"Mohammed Sadiq Ahmed");
insert into tblStudent values(102,"Abdul Samad Ahmed");

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(Sname, ',', 1), ' ', -1) as FNAME,
       SUBSTRING_INDEX(SUBSTRING_INDEX(Sname, ',', 2), ' ', -1) as MNAME,
       SUBSTRING_INDEX(SUBSTRING_INDEX(Sname, ',', 3), ' ', -1) as LNAME
  FROM tblStudent