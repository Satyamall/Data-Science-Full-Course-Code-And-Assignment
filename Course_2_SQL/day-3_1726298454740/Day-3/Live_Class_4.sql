-- JOINS
/*
  is used to get the data from Two or More tables based on the relationship
  > Inner Join
  > Outer Join
*/

use northwind;
select * from Products;
select * from Categories;
select * from suppliers;

select * from Products,Categories;

select * from Products,Categories where Products.categoryId = Categories.categoryId;

select ProductId, ProductName, UnitPrice,p.CategoryID, CategoryName,Description 
     from Products p JOIN categories c 
     ON p.categoryId = c.categoryId;
     
/* 
   > Inner Join
   lists only the common records from both the table
*/
select ProductId, ProductName, UnitPrice,p.CategoryID, CategoryName,Description 
     from Products p INNER JOIN categories c 
     ON p.categoryId = c.categoryId;


select Products.ProductID,Products.ProductName,UnitPrice,
	Products.CategoryID,CategoryName,Description
	from Products , Categories
    where Products.CategoryID = Categories.CategoryID;




select ProductID,ProductName,UnitPrice,
	p.CategoryID,CategoryName,Description
	from Products p JOIN Categories c
    ON p.CategoryID = c.CategoryID;
/*
     > Inner Join
     lists only the Common records from Both the table
*/
select ProductID,ProductName,UnitPrice,
	p.CategoryID,CategoryName,Description
	from Products p INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID;
    
/*
	> OUTER JOIN
    where fetches all the records atleast from one of the table
    plus common Records
*/

select ProductID,ProductName,UnitPrice,
	p.CategoryID,CategoryName,Description
	from Products p LEFT  JOIN Categories c
    ON p.CategoryID = c.CategoryID;
    
    
    
select ProductID,ProductName,UnitPrice,
	p.CategoryID,CategoryName,Description
	from Products p RIGHT JOIN Categories c
    ON p.CategoryID = c.CategoryID;
    
 --  Natural Join
 
 
 select ProductID,ProductName,UnitPrice,
	p.CategoryID,CategoryName,Description
	from Products p INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID;
    
    
 select ProductID,ProductName,UnitPrice,
	CategoryID,CategoryName,Description
	from Products  NATURAL JOIN Categories ;
    
    
 select ProductID,ProductName,UnitPrice,
	CategoryID,CategoryName,Description
	from Products  JOIN Categories using(CategoryID) ;


-- 3 Table Joins



use northwind;

select ProductID,ProductName,UnitPrice,
	c.categoryID,CategoryName,s.SupplierID, CompanyName
	from Products p Join Categories c on p.categoryID = c.CategoryID
		JOIN suppliers s ON s.SupplierID = p.SupplierID;
        
select ProductID,ProductName,UnitPrice,
	categoryID,CategoryName,SupplierID, CompanyName
	from Products Natural Join Categories
		natural JOIN suppliers ;
        
-- WAQ To list the Total Stock for Each Category

select CategoryName,sum(UnitsInStock)
	from products p Join categories c on p.CategoryID = c.CategoryID
    group by CategoryName;
    
select * from Orders;
select * from employees;

-- WAQ to list No of Order taken by each Employees by their name

select e.EMP_ID,e.FIRST_NAME,m.FIRST_NAME as ManagerName
	from employees e JOIN employees m on e.ManagerID = m.EMP_ID;


select e.EmployeeID,e.FirstName, m.FirstName as Managername
 from employees e JOIN employees m on e.ReportsTo = m.EmployeeID;   
 
 select * from employees;
-- Sub-Query
/*
-- Sub-Query is a nested query where one query is encapsulated within another Query
*/
select * from Products where UnitPrice >
 (select UnitPrice from products where ProductName = 'Alice Mutton');
 
 select * from Products where CategoryID =
 ( select CategoryID from categories where CategoryName = 'Confections');
 
 

select * from Orders where Customerid =(
select CustomerID from customers where ContactName = 'Maria Anders');


select * from Orders where Customerid in
(select CustomerID from customers where Country = 'Germany');


select * from customers;
select * from Orders;
select * from orderdetails;
select * from products;

select * from Products where ProductID in(
select ProductID from orderdetails where OrderID in(
select orderid from Orders where CustomerID =(
select CustomerID from customers where ContactName ='Maria Anders')));



