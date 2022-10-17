# Write your MySQL query statement below
SELECT 
  w.name as warehouse_name,
  sum(p.Width * p.Length * p.Height * w.units) as volume
from 
  Products p
left join
  Warehouse w
on 
  p.product_id = w.product_id
where
  w.name is not null
group BY 
  w.name