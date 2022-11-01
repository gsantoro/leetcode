

# Write your MySQL query statement below
with w as (
    select
        Wimbledon as p_id
    from
        Championships)
, fr as (
    select
        Fr_open as p_id
    from
        Championships)
, us as (
    select
        US_open as p_id
    from
        Championships)
, au as (
    select
        Au_open as p_id
    from
        Championships)
, championships as (
    select
    *
    from
    w
    union all
    select
    *
    from
    fr
    union all
    select
    *
    from
    us
    union all
    select
    *
    from
    au)
 , champ_summary as (
    select
        p_id,
        count(*) as cnt
    from
        championships
    group by
        p_id)
select
    p.player_id as player_id,
    p.player_name as player_name,
    c.cnt as grand_slams_count
from
    Players p
join
    champ_summary c
on
    p.player_id = c.p_id