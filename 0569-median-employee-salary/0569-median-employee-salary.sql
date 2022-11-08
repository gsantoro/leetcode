# Write your MySQL query statement below
with company_counts as (
    select
        company,
        count(*) as n
    from
        Employee
    group by 
        company)
, indices as (
    select
        company,
        (n div 2) + 1 as m
    from
        company_counts
    union
    select
        company,
        case 
            when mod(n, 2) = 0 then (n div 2)
            else (n div 2) + 1
        end as m
    from
        company_counts)
, ranked as (
    select
        id,
        company,
        salary,
        rank() over (partition by company order by salary asc, id asc) as rnk
    from
        Employee)
select
    r.id as id,
    r.company as company,
    r.salary as salary
from
    ranked r
join
    indices i
on
    r.company = i.company and r.rnk = i.m

