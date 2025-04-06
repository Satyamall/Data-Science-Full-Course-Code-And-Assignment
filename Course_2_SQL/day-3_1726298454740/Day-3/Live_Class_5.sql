SELECT EMP_ID,FIRST_NAME,SALARY,
	rank() over(Order By SALARY desc) as Rk,
    DENSE_rank() over(Order By SALARY desc) as DRk,
    row_Number() over(Order By SALARY desc) as RN 
    FROM employees;


SELECT EMP_ID,FIRST_NAME,SALARY,Emp_Rating,
	rank() over(Order By SALARY desc, EMP_RATING DESC) as Rk from employees;
    
 SELECT EMP_ID,FIRST_NAME,DEPT,SALARY,
	rank() over(Order By SALARY desc) as Rk from employees;   
    
 SELECT EMP_ID,FIRST_NAME,DEPT,SALARY,
	rank() over(partition by DEPT Order By SALARY desc) as Rk from employees;
    
select *,
	ntile(5) Over(order By salary)	from employees;
    
    
select * from (
 SELECT EMP_ID,FIRST_NAME,DEPT,SALARY,
	rank() over(partition by DEPT Order By SALARY desc) as Rk from employees) as e
    where Rk = 1;
    
-- CTE Common Table Expression

with cte as
(
 SELECT EMP_ID,FIRST_NAME,DEPT,SALARY,
	rank() over(partition by DEPT Order By SALARY desc) as Rk from employees
)select * from cte where rk <= 2;


with cte as
(
	select *,sum(Salary) over() TotalSalary from employees
)select Emp_ID,First_Name,salary,TotalSalary, concat(round((salary / TotalSalary)*100,2)," %")  from cte;


with cte as
(
select DEPT,sum(salary) TS  from employees
	group by DEPT
) select DEPT,TS /sum(ts) over() from cte;

with cte as
(
	select Emp_ID,First_Name, Salary  from employees
)select *, Salary / sum(Salary) over() from cte;