# Write your MySQL query statement below
with before_date as (
    select
        product_id as id,
        first_value(new_price) over (partition by product_id order by change_date desc) as price
    from
        Products
    where
        change_date <= "2019-08-16"
)
, product_with_price as (
    select
        id,
        max(price) as price
    from
        before_date
    group by
        1)
, product_ids as (
    select
        distinct product_id as id
    from 
        Products
)
select
    i.id as product_id,
    coalesce(p.price, 10) as price
from 
    product_ids i
left join
    product_with_price p
on
    i.id = p.id