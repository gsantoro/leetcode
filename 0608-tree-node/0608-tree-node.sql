# Write your MySQL query statement below
# 1
# 2
# 3
# 4

# id p_id.   p_id. id 
# 1 null     1.    2    root = t1.p_id is null
# 2 1        2.    3    t2.p_id is not null = Inner
# 3 2        3.    4
# 4 3        null  4    t2.p_id is null and t1.p_id is not null


select
  distinct t1.id as id,
  case
    when t1.p_id is null then "Root"
    when t2.p_id is not null then "Inner"
    when t2.p_id is null then "Leaf"
  end as type
from 
  Tree t1
left join
  Tree t2
on
  t1.id = t2.p_id