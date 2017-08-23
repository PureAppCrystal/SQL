--select * 
--from Countries  a, regions  b
--where a.region_id = b.region_id;
--order by a.Countries.COUNTRY_ID 


--select * from Countries
--select * from REGIONS

/*
select first_name ||' '|| last_name from employees

select 100* 10 from dual;

select salary as "본봉", salary + salary*0.3 as "보너스"
from employees

select -salary from employees
*/

--null을 산술 연삭식에 사용하면 결과는 무조건 null
--select first_name ||' ' || last_name as "이름", (salary+ (salary * commission_pct) )* 12 as "연봉"
--from employees

--nvl2를 이용
select first_name ||' ' || last_name as "이름", nvl2 (commission_pct,  (salary+ (salary * commission_pct) )* 12, salary) as "연봉"
from employees