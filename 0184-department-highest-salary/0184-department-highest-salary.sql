# Write your MySQL query statement below
with ranked as (
    select
        name,
        salary,
        departmentId,
        rank() over (partition by departmentId order by salary desc) as rnk
    from
        Employee)
, first_salaries as (
    select
        *
    from
        ranked
    where
        rnk = 1)
select
    d.name as Department,
    f.name as Employee,
    f.salary as Salary
from
    first_salaries f
join
    Department d
on
    f.departmentId = d.id