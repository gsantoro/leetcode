# Write your MySQL query statement below
with posts as (
    select
        distinct sub_id as id
    from 
        Submissions
    where
        parent_id is null)
, comments as (
    select
        parent_id as post_id,
        count(distinct sub_id) as cnt
    from
        Submissions
    where
        parent_id is not null
    group by
        parent_id)
select
    p.id as post_id,
    coalesce(c.cnt, 0) as number_of_comments
from
    posts p
left join
    comments c
on
    p.id = c.post_id
order by
    post_id asc

