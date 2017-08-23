--하이라키~

select level, manager_id, employee_id
from EMPLOYEES
start with manager_id is null
connect by prior employee_id = manager_id
order by level, manager_id, employee_id;