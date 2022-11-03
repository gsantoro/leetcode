# Write your MySQL query statement below
with areas as (
    select
        least(p1.id, p2.id) as point1,
        greatest(p1.id, p2.id) as point2,
        abs(p1.x_value - p2.x_value) * abs(p1.y_value - p2.y_value) as area
    from
        Points p1
    join
        Points p2)
select distinct
    point1 as P1,
    point2 as P2,
    area as AREA
from 
    areas
where
    area > 0
order by
    3 desc,
    1 asc,
    2 asc