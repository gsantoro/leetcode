# Write your MySQL query statement below
with first_game as (
    select
        player_id,
        min(event_date) as event_date
    from
        Activity
    group by
        player_id)
select
    round(count(distinct f.player_id) / count(distinct a.player_id), 2) as fraction
from 
    Activity a
left join
    first_game f
on
    a.player_id = f.player_id and
    a.event_date = date_add(f.event_date, interval 1 day)