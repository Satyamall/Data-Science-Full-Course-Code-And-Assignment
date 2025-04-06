use northwind;

call ProductsByCategory('Beverages');

use sept24;
select emp_ID, First_Name, Salary, BonusByRating(emp_ID) from employees;