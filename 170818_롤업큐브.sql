-- rollup, cube

select department_id, job_id, count(*), avg(salary)
from EMPLOYEES
group by department_id, job_id
order by 1, 2;


select 	case grouping(department_id)
			when 1 then '모든부서'
			else nvl(to_char(department_id), '-')
		end as "부서", 
		nvl(job_id,'--->'), 
		count(*) as "직책", 
		round(avg(salary),0)
from EMPLOYEES
group by rollup (department_id, job_id);


select first_name, salary
from employees
where salary > (select avg(salary) from employees );



-- corelated
select department_id, first_name, salary
from employees e
where salary = ( select max(salary)
					from employees
					where e.department_id=department_id)
order by department_id;

select department_id
from departments

