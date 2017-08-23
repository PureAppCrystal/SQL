--practice02



select * from jobs;
select * from employees;
select * from job_history;
select * from jobs;
select * from departments;

--Q1
select min_salary as "최저임금", max_salary as "최고임금", (max_salary - min_salary) as "최고임금 - 최저임금"
from jobs;


--Q2
select TO_CHAR(max(hire_date), 'YYYY"년" MM"월" DD"일"' )
from employees
order by hire_date desc;

--Q3
select department_id, max(salary), min(salary), avg(salary)
from employees
group by department_id
order by avg(salary) desc,  max(salary) desc, min(salary) desc;

--Q4
select job_id, (max(max_salary)+min(min_salary))/2 as "AVG" , max(max_salary) as "max", min(min_salary) as "min"
from jobs
group by job_id
order by (max(max_salary)+min(min_salary))/2 desc, max(max_salary) desc, min(min_salary) desc; 

--Q5
select TO_CHAR(min(hire_date), 'YYYY"년" MM"월" DD"일"' )
from employees
order by hire_date desc;

--Q6
select e.DEPARTMENT_ID, avg(salary) as "avg", min(salary) as "min", avg(salary)-min(salary) as "차이"
from employees e, DEPARTMENTS d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID 
group by e.department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--Q7
select * from jobs;
select * from employees;


select job_id,  (max(salary) - min(salary) ) as "DIFF"
from employees
group by job_id
order by max(salary) - min(salary) desc;

select job_id, max_salary-min_salary as DIFF
from jobs












