CREATE DATABASE sept24;
use sept24;

CREATE TABLE Student
(
  Rollno int,
  Sname varchar(50)
);

insert into Student values (1, 'Satya');
insert into Student values (2, 'Suraj');
insert into Student values (3, 'Amrutesh');
insert into Student values (4, 'Ronak');

select * from Student;

delete from Student;

delete from Student Where Rollno =1;
delete from Student Where Rollno =4;
set sql_Safe_updates = 0;

select * from employees;
select Emp_Id, First_name, Last_name,Salary from employees;
select Emp_Id, First_name, Last_name,Salary,Salary*12 from employees;
select Emp_Id, First_name, Last_name,Salary,Salary*12 as AnnualSalary from employees;

select DEPT from employees;
select distinct DEPT from employees;

select * from employees where Gender = "F";
select * from employees where DEPT <> "Retail";
select * from employees where DEPT != "Retail";
select * from employees where Exp > 15;
select * from employees where Exp < 5;
select * from employees where Exp <= 5;

select * from employees where Gender = "M";
select * from employees where Gender = "M" and exp >= 8;
select * from employees where Gender = "M" or exp >= 8;

select * from employees where country="India";
select * from employees where country="India" and salary > 8000;
select * from employees where country="India" or salary > 8000;

select * from employees order by salary;
select * from employees order by salary desc;

select * from employees order by Dept,Exp desc;
