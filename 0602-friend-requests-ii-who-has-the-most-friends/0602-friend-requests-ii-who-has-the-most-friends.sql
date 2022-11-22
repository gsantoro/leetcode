# Write your MySQL query statement below
with friends as (
    select
        requester_id as id,
        accepter_id as friend
    from
        RequestAccepted
    union
    select
        accepter_id as id,
        requester_id as friend
    from
        RequestAccepted)
select
    id,
    count(friend) as num
from
    friends
group by
    id
order by
    2 desc
limit 1