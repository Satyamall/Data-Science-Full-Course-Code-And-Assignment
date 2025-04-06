use Northwind;

select * from Products;
select * from Categories;

-- Text Functions
select CustomerID,COntactname from customers;

-- Number Functoin
-- Date Functions

-- Text Functions
select CustomerID,upper(Contactname),lower(ContactName) from customers;

select EmployeeID,FirstName,LastName, 
	concat(firstName,' ',Lastname) as Fullname from employees;

select FirstName,left(FirstName,3),right(FirstName,3)
, mid(FirstName,2,3) from employees;


-- Number Functions
select round(45.8567,2);
select ceil(45.00001567);
select ceiling(45.00001567);
select floor(45.999999);

-- Date

select curdate();
select current_date();
select sysdate();
select now();

select Curdate();
select month(curdate());
select monthname(curdate());
select day(curdate());
select quarter(curdate());
select dayofweek(curdate());
select dayname( curdate() );

select cardate();

select dayname('2001-04-06');

select * from orders;

select * from orders where Year(Orderdate) = 1997 and month(Orderdate) = 6 ;
select * from orders where Year(Orderdate) = 1997 and monthname(Orderdate) = 'June';
select * from Orders where quarter(Orderdate) = 2 and year(Orderdate) = 1997; 

select * from orders where OrderDate >= '1997-06-15' and Orderdate <= '1997-06-30' ;

select * from orders where OrderDate between '1997-06-15' and '1997-06-30' ;

-- list Total no of orders for each year

select  year(Orderdate),count(*) from Orders group by year(Orderdate) ;

select  quarter(Orderdate),count(*) from Orders group by quarter(Orderdate) ;

select  Month(Orderdate),count(*) from Orders group by Month(Orderdate) ;

select date_add(curdate(), interval 28 day );
select date_add(curdate(), interval 3 month );
select date_add(curdate(), interval 5 year );

select datediff(curdate(),'2001-06-01');

select OrderID,CustomerID,OrderDate,ShippedDate,
	datediff(ShippedDate,OrderDate)
	from orders
	where datediff(ShippedDate,OrderDate) <=5;
    
select curdate(), date_format(curdate(),"%d / %m / %y") ;
select curdate(), date_format(curdate(),'%M / %d / %Y') ;

select year(Orderdate),Month(orderdate), count(*) TotalOrders
	from orders 
    group by year(Orderdate),Month(orderdate) 
    having TotalOrders >= 40;

select * from customers;
/*
-- List no of Customers for Each country  
-- and display only those country where No of customer are more then 8
-- Exclude the USA Customers
*/

select country, count(*) NOC 
	from customers 
	where Country != 'USA'
    group by Country
    having count(*) >= 8;
    




select * from Orders;
select datediff(Shippeddate,Orderdate)  from Orders;

select date_format(curdate(),"%m-%d-%Y");



select orderid,customerid,orderdate,shippeddate,
datediff(shippeddate,orderdate) days_to_deliver
from orders
where datediff(shippeddate,orderdate) <= 5;


select * from products;

-- WAQ to list all Products with STock Value
select CategoryID, sum( unitprice * unitsinstock) as Total_stock_value
     from products
     group by CategoryID;
     
-- WAQ to list Total Stock for Category

select CategoryID,sum(UnitsInStock)  Total_Stock
	from products
    group by CategoryID;