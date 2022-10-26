# Write your MySQL query statement below
select
  u.name,
  coalesce(sum(distance), 0) as travelled_distance
from
  Users u
left join
  Rides r
on
  u.id = r.user_id
group by
  u.id
order by
  2 desc, 
  1 asc