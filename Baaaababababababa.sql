--문자열 함수

select lower('ABC Market') from dual;

select first_name 
from employees
where lower(first_name) like 'al%';

select first_name 
from employees
where upper(first_name) like 'AL%';

select initcap('ABC Market') from dual;

select concat('He', 'llo') from dual;

select length('abcdefg') from dual;
