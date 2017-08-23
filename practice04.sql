--practice04


--Q1
select count(*)
from employees
where salary < ( select avg(salary) from employees );


--Q2
select employee_id, last_name, salary
from employees
where salary in
(select  max(salary) 
from employees 
group by department_id) 
order by salary desc; 



--Q3
select job_title, abc
from jobs j, ( select job_id, sum(salary) abc
				from employees
				group by job_id) s
where j.job_id=s.job_id
order by abc desc;


--Q4
select employee_id, last_name, round(salary,0) ,department_id, s.avgm
from employees e, (select nvl(department_id,0) as id, round(avg(salary)) as avgm 
					from employees 
					group by department_id 
					order by department_id) s
where e.department_id = s.id and e.SALARY > s.avgm;






 







