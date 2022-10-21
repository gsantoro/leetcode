# Write your MySQL query statement below
select 
*
from (
    (select
      e.employee_id as employee_id
    from 
      Employees e
    left join
      Salaries s
    on
      e.employee_id = s.employee_id
    where
      s.employee_id is null)
    union distinct
    (select
      s.employee_id as employee_id
    from Salaries s
    left join
      Employees e
    on 
      s.employee_id = e.employee_id
    where
      e.employee_id is null)) s
order by
  employee_id
 