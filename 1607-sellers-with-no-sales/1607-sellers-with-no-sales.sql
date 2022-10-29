# Write your MySQL query statement below
select
  seller_name
from
  Seller
where 
  seller_id not in (select
      distinct seller_id
    from
      Orders o
    where
      date_format(sale_date, "%Y") = "2020")
order by
  1 asc