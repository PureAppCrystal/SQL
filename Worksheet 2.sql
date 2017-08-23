select employee_id, salary, salary + salary*nvl(commission_pct,0) 
from employees


--vnl 함수
select nvl(null, 10) from dual;

select employee_id, nvl(manager_id, 0)
from employees;