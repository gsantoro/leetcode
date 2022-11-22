# Write your MySQL query statement below
select
    employee_id,
    department_id
from
    Employee e
group by
    employee_id
having
    count(department_id) = 1
union
select
    employee_id,
    department_id
from
    Employee e  
where
    primary_flag = 'Y'