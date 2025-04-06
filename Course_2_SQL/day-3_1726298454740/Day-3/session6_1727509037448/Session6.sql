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
