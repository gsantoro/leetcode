# Write your MySQL query statement below
with next_nums as (
    select
        num as n,
        lead(num, 1) over (order by id) as n_1,
        lead(num, 2) over (order by id) as n_2
    from
        Logs)
select
    distinct n as ConsecutiveNums
from
    next_nums
where 
    n = n_1 and n_1 = n_2
