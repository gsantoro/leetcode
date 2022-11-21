# Write your MySQL query statement below
with start_activity as (
    select
        machine_id as m_id,
        process_id as p_id,
        timestamp as t
    from 
        Activity
    where 
        activity_type = 'start')
, end_activity as (
    select
        machine_id as m_id,
        process_id as p_id,
        timestamp as t
    from
        Activity
    where
        activity_type = 'end')
select
    s.m_id as machine_id,
    round(avg(e.t - s.t), 3) as processing_time
from
    start_activity s
join
    end_activity e
on
    s.m_id = e.m_id and s.p_id = e.p_id
group by
    s.m_id