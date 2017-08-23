select employee_id, hire_date from employees;


/*
숫자 -> 문자 : TO_CHAR(n,fmt)
문자 -> 날짜 : TO_DATE(s,fmt)
날짜 -> 문자 : TO_CHAR(d,fmt)
문자 -> 숫자 : TO_NUMBER(s,fmt)
*/


-- Join --
-- inner join : 둘의 공통 부분만 가져온다 ( 기본 조인 ) 
--       equi : 
-- outer join : 왼쪽 테이블의 모든 데이터와 둘의 공통 부분을 가져온다 
-- cross join : a,b 테이블 모두 나온다 ( axb 갯수의 결과값 ) 
-- self  join : 자기 자신을 조인 

-- inner join
select * 
from employees, DEPARTMENTS 
where employees.EMPLOYEE_ID = DEPARTMENTS.MANAGER_ID;

-- outer join 
select a.FIRST_NAME as "사원이름", nvl(b.DEPARTMENT_NAME, '대기발령') as "부서이름" 
from employees a, DEPARTMENTS b 
where b.DEPARTMENT_ID(+) = a.DEPARTMENT_ID;

-- outer self join 
select emp.first_name as "직원이름", nvl(man.first_name, '매니저없음') as "매니저 이름"
from employees emp, employees man
where emp.manager_id = man.employee_id(+);


-- ansi join
-- natural join 테이블들의 칼럼 이름이 동일한 경우
select count(*)
from EMPLOYEES a
join departments b
--using (department_id);
on a.DEPARTMENT_ID = b.DEPARTMENT_ID;

select * from employees;
select * from departments;



