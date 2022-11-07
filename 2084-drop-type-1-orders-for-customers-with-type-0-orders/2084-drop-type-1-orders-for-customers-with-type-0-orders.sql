# Write your MySQL query statement below
with customer_types as (
    select
        customer_id,
        order_type
    from
        Orders
    group by
        customer_id,
        order_type)
, customer_with_diff_types as (
    select
        customer_id
    from
        customer_types
    group by
        customer_id
    having
        count(order_type) > 1)
select
    o.order_id as order_id,
    o.customer_id as customer_id,
    o.order_type as order_type
from
    Orders o
left join
    customer_with_diff_types c
on
    o.customer_id = c.customer_id
where
    (c.customer_id is not null and order_type = 0) or (c.customer_id is null)