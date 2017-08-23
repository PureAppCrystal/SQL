--practice05


--평균임금이 가장 높은 부서
CREATE VIEW maxSalaryDep
AS 
select department_id,  
from (select department_id, round(avg(salary)) as avgs
	 from employees
	 group by department_id
	 order by 2 desc)
where rownum = 1 ;





--Q1
--가장 늦게 입사한 직원의   이름 연봉 부서
select concat(e.first_name, e.last_name), e.salary, d.department_name
from employees e, departments d
where e.HIRE_DATE = ( select max(hire_date) 
					from employees ) 
		and e.DEPARTMENT_ID = d.DEPARTMENT_ID;
		
		
		
--Q2
--자신의 부서의 평균 급여보다      연봉이 많은 사원의 사번, 성 연봉
select e.employee_id, e.last_name, e.salary
from employees e, ( select department_id, avg(salary) avgs 
					from employees
 					group by department_id ) s
where e.department_id = s.department_id and e.SALARY > s.avgs;


--Q3
--평균연봉이 가장 높은 부서의    사원 사번 이름 성 연봉 업무

select e.employee_id, e.first_name, e.last_name, e.job_id, e.salary
from employees e
where department_id = (	select department_id 
						from (select department_id, round(avg(salary)) as avgs
							 from employees
							 group by department_id
							 order by 2 desc)
						where rownum = 1 );
						
						
--Q4
select d.department_name 
from departments d, maxSalaryDep s
where d.DEPARTMENT_ID = s.department_id;


--Q5

select * from regions;
select * from countries ;
select * from locations order by country_id;
select * from departments order by location_id;
select * from employees;

select l.city
from locations l, maxSalaryDep s, 
	departments d
where s.department_id = d.DEPARTMENT_ID and d.LOCATION_ID = l.LOCATION_ID ;

-- region check
select r.region_id, count(*)
from regions r, countries c
where r.REGION_ID = c.REGION_ID
group by r.region_id;

-- countries check
select c.country_id, count(*)
from countries c, locations s
where c.COUNTRY_ID = s.COUNTRY_ID
group by c.country_id;

select * from countries;
select count(*) from countries where region_id is null; 

-- locations check
select s.LOCATION_ID, count(*)
from locations s, departments d
where s.LOCATION_ID (+)= d.LOCATION_ID
group by s.LOCATION_ID;

select * from locations;
select count(*) from locations where country_id is null;

--department check
select d.department_id, count(*)
from DEPARTMENTS d, employees e
where d.DEPARTMENT_ID (+)= e.DEPARTMENT_ID
group by d.department_id;

select * from departments;
select count(*) from departments where location_id is null;
 


-- regions > countries > locations > departments > employees

select region from
(
select r.region_name as region , avg(e.salary) as avgs
from employees e, departments d, locations l, countries c, regions r
where       r.region_id     = c.REGION_ID 
		and c.COUNTRY_ID    = l.COUNTRY_ID
		and l.LOCATION_ID   = d.LOCATION_ID
		and d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by r.region_name
order by avgs desc
)
where rownum = 1;


--Q6

select * from employees;
select * from jobs;

select j.job_title, avgs
from jobs j,   (select job_id, avg(salary) as avgs
				from employees
				group by job_id
				order by avgs desc
				) s
where j.JOB_ID = s.job_id and rownum = 1






		
		
		
	