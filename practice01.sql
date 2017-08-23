--연습문제 01

select * from countries;
select * from employees;
select * from departments;
select * from jobs;
select * from locations;
select * from regions;

select count(distinct location_id) from locations;
select count(distinct location_id) from departments;




--Q1
select 	concat(first_name, last_name) as "이름",
		EMAIL as "이메일",
		phone_number as "전화번호"
from employees
order by hire_date asc;


--Q2
select job_title, max_salary
from jobs
order by max_salary desc;

--Q3
select count(*) 
from employees
where MANAGER_ID is null;

--Q4
select job_title
from jobs
order by max_salary desc;

--Q5
select count(department_id) from departments;

--Q6
select *
from departments
order by length(department_name) desc;

--Q7
select count(*) 
from departments
where manager_id is null;

--Q8
select upper(a.country_name), count(a.country_name)
from countries a, locations b
where a.COUNTRY_ID = b.COUNTRY_ID 
group by a.country_name
having count(a.country_name) > 1
order by  a.country_name asc;

--Q9
select region_name
from regions
order by region_name asc;

--Q10
select distinct lower(city)
from departments a, locations b
where a.location_id = b.location_id
order by lower(city) ;



