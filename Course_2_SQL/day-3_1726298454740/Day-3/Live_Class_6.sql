-- WINDOW Function

select *,
	rank() over(order by Salary desc) as Rk,
	Dense_rank() over(order by Salary desc) as DRk,
    row_number() over(order by Salary desc) as RN
	from employees;
    
select EMP_ID,FIRST_NAME,SALARY,EMP_RATING,
	rank() over(order by SALARY desc, EMP_RATING desc ) as RK
	from employees;
    
select EMP_ID,FIRST_NAME,SALARY,DEPT,
	rank() over( partition by DEPT order by SALARY desc ) as RK
	from employees
    where rk = 1;
    
    
select EMP_ID,FIRST_NAME,CONTINENT,SALARY,
	Rank() over( partition by CONTINENT Order by salary desc) from employees;
    
select * from (
select EMP_ID,FIRST_NAME,SALARY,DEPT,
	rank() over( partition by DEPT order by SALARY desc ) as RK
	from employees) as e
    where rk = 1;
    
-- CTE
with cte as
(
	select EMP_ID,FIRST_NAME,SALARY,DEPT,
	rank() over( partition by DEPT order by SALARY desc ) as RK
	from employees
)select * from cte where rk <=2;

   
select *,sum(salary) over() from employees;

select EMP_ID,FIRST_NAME,Salary,sum(salary) over(), (salary/sum(salary) over())*100 from employees;


with cte as
(
select DEPT,sum(SALARY) TS from employees group by DEPT
)select DEPT, TS/sum(TS) over() from cte;


--  LEAD and LAG


select * from employees;

select EMP_ID,FIRST_NAME,salary,LAG(Salary) over() from employees;



/* 1.  Clustered - similar to dictionary - where whole dictioary is sorted by words and next to word is associated meaning
table can have only one clustered index
created automatically, when we create a primary key on a table
2. Non Clustered Index - similar to index of book , data is in one place and index is in another
table can have multiple non clustered index
it has to be created explicitcally.
*/

create table TestProducts as select * from products;

create table testproducts as select * from Products;
select * from testproducts where ProductID = 50;

select * from testproducts;

create INDEX idx_CategoryID on testproducts(CategoryID);

alter TABLE testproducts drop index idx_CategoryID;

select * from testproducts where CategoryID = 1;

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Products2`()
BEGIN
	select ProductID,ProductName,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock from products;
END;


USE `northwind`;
DROP procedure IF EXISTS `northwind`.`P_Products2`;
;

DELIMITER $$
USE `northwind`$$
CREATE PROCEDURE `P_Products2`()
BEGIN
	select ProductID,ProductName,UnitPrice,UnitsInStock,UnitPrice*UnitsInStock from products;
END$$

DELIMITER ;
;


USE `northwind`;
DROP procedure IF EXISTS `CustomersByCountry`;

USE `northwind`;
DROP procedure IF EXISTS `northwind`.`CustomersByCountry`;
;

DELIMITER $$
USE `northwind`$$
CREATE PROCEDURE `CustomersByCountry`(ctry  varchar(50) )
BEGIN
	select CustomerID,CompanyName,ContactName,City,Country 
		from customers where country = ctry;
END$$

DELIMITER ;
;

USE `northwind`;
DROP procedure IF EXISTS `Product_Price`;

USE `northwind`;
DROP procedure IF EXISTS `northwind`.`Product_Price`;
;

DELIMITER $$
USE `northwind`$$
CREATE PROCEDURE `Product_Price`( per  int)
BEGIN
update testProducts 
	set UnitPrice = Unitprice + Unitprice * per /100;
END$$

DELIMITER ;
;





/*
	Stored Procedure
    is a Pre-Compiled Block of T-SQL statements stored with a name and executed
    it can contain Multiple SELECT, INSERT, UPDATE AND DELETE Statements
    con accept Parameters and perform task
*/

select ProductID,ProductName,UnitPrice,UnitsInStock from products;

call P_Products;

call P_Products2;

call StockByCategory;

select CategoryName,sum(UnitsInSTock) from products natural JOIN categories group by CategoryName ;


select CustomerID,CompanyName,ContactName,City,Country from customers where country = 'Brazil';

call CustomersByCountry ('France');

select * from testProducts;


update testProducts set UnitPrice = Unitprice + Unitprice *.1;

set sql_Safe_updates = 0;

call Product_Price (5);

/* 1.  Clustered - similar to dictionary - where whole dictioary is sorted by words and next to word is associated meaning

table can have only one clustered index

created automatically, when we create a primary key on a table

2. Non Clustered Index - similar to index of book , data is in one place and index is in another

table can have multiple non clustered index

it has to be created explicitcally.

*/