# Write your MySQL query statement below
with manager_count as (
    select
        reports_to as id,
        count(employee_id) as cnt,
        avg(age) as avg_age
    from
        Employees e1
    group by 
        reports_to
    having
        reports_to is not null)
select
    e2.employee_id as employee_id,
    e2.name as name,
    m.cnt as reports_count,
    round(m.avg_age) as average_age
from 
    manager_count m
left join
    Employees e2
on
    m.id = e2.employee_id
order by
    1
    
    