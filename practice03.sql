-- practice03

select * from jobs;
select * from employees;
select * from job_history;
select * from jobs;
select * from departments;
select * from regions;
select * from countries;
select * from locations;
select * from countries;

--Q1
select e.employee_id, e.FIRST_NAME, d.DEPARTMENT_NAME, e2.FIRST_NAME
from employees e, employees e2, departments d
where e.MANAGER_ID = e2.EMPLOYEE_ID and e.DEPARTMENT_ID = d.DEPARTMENT_ID   
order by e.EMPLOYEE_ID;

--Q2
select r.region_name, c.country_name
from regions r, countries c
where r.REGION_ID = c.REGION_ID
order by r.REGION_NAME desc , c.COUNTRY_NAME desc;

--Q3


select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.FIRST_NAME, l.CITY, c.COUNTRY_NAME, r.REGION_NAME
from departments d, employees e, locations l, countries c, regions r
where       d.MANAGER_ID = e.employee_id 
		and d.LOCATION_ID = l.LOCATION_ID 
		and l.COUNTRY_ID = c.COUNTRY_ID
		and c.REGION_ID = r.REGION_ID
order by d.DEPARTMENT_ID;


--Q4

select e.EMPLOYEE_ID, concat(e.FIRST_NAME,e.LAST_NAME)
from job_history jh, jobs j,  employees e
where       j.JOB_TITLE = 'Public Accountant'  
		and j.JOB_ID = jh.JOB_ID               
		and e.employee_id = jh.EMPLOYEE_ID;

		
		
--Q5 


select e.last_name, e.FIRST_NAME, e.LAST_NAME, nvl(d.DEPARTMENT_NAME,'부서없음') as "부서"
from employees e 
join employees e2 				ON (e.LAST_NAME = e2.LAST_NAME and e.EMPLOYEE_ID  <> e2.EMPLOYEE_ID)
left outer join departments d  	ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID )  
order by e.last_name;


--Q6 


select e.employee_id, e.last_name, e.hire_date, e2.hire_date 
from employees e, employees e2
where e.MANAGER_ID = e2.EMPLOYEE_ID and e.HIRE_DATE < e2.HIRE_DATE
order by e.EMPLOYEE_ID

		  



