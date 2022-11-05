# Write your MySQL query statement below
with avgs as (
    select
        order_id,
        avg(quantity) as avg
    from
        OrdersDetails
    group by
        order_id)
select
    order_id
from
    OrdersDetails
group by 
    order_id
having
    max(quantity) > (select max(avg) from avgs)