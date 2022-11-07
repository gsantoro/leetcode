# Write your MySQL query statement below
with highest_invoice as (
    select
        s.invoice_id as invoice_id,
        sum(s.quantity * p.price) as total
    from
        Purchases s
    left join
        Products p
    on
        s.product_id = p.product_id
    group by
        s.invoice_id
    order by
        2 desc,
        1 asc
    limit 
        1)
select
    s.product_id as product_id,
    s.quantity as quantity,
    s.quantity * p.price as price
from
    Purchases s
left join
    Products p
on 
    s.product_id = p.product_id
where
    invoice_id = (select invoice_id from highest_invoice)
