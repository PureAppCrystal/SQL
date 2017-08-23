--where

select employee_id, job_id
from employees
--where job_id = 'AD_PRES' or job_id = 'AD_VP'
where job_id IN('AD_PRES', 'AD_VP');


