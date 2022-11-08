# Write your MySQL query statement below
with grouped_sales as (
    select
        c.salesperson_id as salesperson_id,
        sum(s.price) as total
    from
        Sales s
    join
        Customer c
    on
        s.customer_id = c.customer_id
    group by
        c.salesperson_id)
select
    s.salesperson_id as salesperson_id,
    s.name as name,
    coalesce(g.total, 0) as total
from 
    Salesperson s
left join
    grouped_sales g
on
    s.salesperson_id = g.salesperson_id