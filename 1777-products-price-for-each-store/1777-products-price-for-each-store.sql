  
# Write your MySQL query statement below
with s as (
    select
      distinct product_id
    from 
      Products),
s1 as (
    select
      product_id,
      price
    from 
      Products
    where
      store = "store1"),
s2 as (
    select
      product_id,
      price
    from 
      Products
    where
      store = "store2"),
s3 as (
    select
      product_id,
      price
    from 
      Products
    where
      store = "store3")
select 
  s.product_id,
  s1.price as store1,
  s2.price as store2,
  s3.price as store3
from
  s
left join
  s1
on s.product_id = s1.product_id
left JOIN
  s2
on s.product_id = s2.product_id
left JOIN 
  s3
on s.product_id = s3.product_id