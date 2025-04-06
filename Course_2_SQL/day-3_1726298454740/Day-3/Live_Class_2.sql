use sept24;

select * from employees where exp >=5 and exp<=10;

select * from employees where exp between 5 and 10;
select * from employees where exp NOT between 5 and 10;

-- WildCard Filter
-- % is a place holder for any length of characters
-- _ is a place holder for a SINGLE character

select * from employees where FIRST_NAME LIKE "C%";
select * from employees where FIRST_NAME like '_a%';
select * from employees where FIRST_NAME like '__a%';
select * from employees where FIRST_NAME like '%a%';

select * from employees where ROLE like '%Data Scientist';
select * from employees where ROLE not like '%Data Scientist';

select * from employees where COUNTRY = 'INDIA' or COUNTRY = 'Germany' or country = 'Canada' or country = 'USA';
select * from employees where COUNTRY IN('INDIA' ,'Germany', 'Canada' , 'USA');
select * from employees where COUNTRY NOT in('INDIA' ,'Germany', 'Canada' , 'USA','China');

-- Aggregate Fuction
select sum(SALARY) from employees;
select sum(SALARY) TotalSalary from employees;
select avg(SALARY),Max(SALARY),Min(SALARY) from employees;

select count(*) from employees;
select count(*) from employees group by DEPT;
select DEPT,count(*) from employees group by DEPT;

select COUNTRY,count(*) from employees group by COUNTRY;
select COUNTRY,count(*) from employees  where COUNTRY in('INDIA' ,'Germany', 'Canada' , 'USA','China') group by COUNTRY;

-- Display the Total Salary for Each DEPT
select DEPT,sum(SALARY) TotalSalary from employees group by DEPT;
select DEPT,sum(SALARY) from employees group by DEPT having sum(Salary) > 30000 order by sum(Salary) desc;
select DEPT,sum(SALARY) from employees where country <> 'China' group by DEPT having sum(Salary) > 30000 order by sum(Salary) desc;

select * from employees;

-- List no of employees for each country which has more than 3 employees
select COUNTRY,count(*) from employees group by COUNTRY having count(*) > 3;

select * from employees limit 5;
select * from employees order by SALARY desc limit 5;
select * from employees order by SALARY desc limit 5 offset 5;
select * from employees order by SALARY desc limit 1 offset 1;
select * from employees order by SALARY desc limit 1, 1;
select * from employees order by SALARY desc limit 1 offset 2;
select * from employees order by SALARY desc limit 2, 1;

select EMP_ID, FIRST_NAME, upper(First_Name), lower(First_Name) from employees;
select EMP_ID, FIRST_NAME, left(First_Name,3) from employees;
select EMP_ID, FIRST_NAME, left(First_Name,3), lower(First_Name) from employees;
select EMP_ID, FIRST_NAME, upper(First_Name), lower(First_Name) from employees order by FIRST_NAME;
select EMP_ID, FIRST_NAME, left(First_Name,3), right(emp_id,3) from employees order by FIRST_NAME;

select EMP_ID, concat(First_Name," ", Last_Name) FullName from employees;

select Dept, Gender,count(*) from employees group by Dept, Gender;
