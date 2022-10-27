# Write your MySQL query statement below
with all_sales as (
    select
      sale_date, 
      case
        when fruit = "apples" then sold_num
        when fruit = "oranges" then -sold_num
      end as quant
    from 
      Sales) 
select
  sale_date,
  sum(quant) as diff
from
  all_sales
group by
  sale_date
order by
  sale_date