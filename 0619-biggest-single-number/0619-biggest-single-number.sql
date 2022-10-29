# Write your MySQL query statement below
with onces as (
    select
      num
    from 
      MyNumbers
    group by
      num
    having
      count(*) = 1)
select
  max(num) as num
from
  onces
