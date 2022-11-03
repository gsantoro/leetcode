# Write your MySQL query statement below
with ranks as (
    select
        s.school_id as school_id,
        e.score as score,
        rank() over (partition by school_id order by student_count desc, score asc) as rnk
    from
        Schools s
    join
        Exam e
    where
        s.capacity >= student_count)
, ranks_1 as (
    select
        school_id,
        score
    from
        ranks
    where
        rnk = 1)        
select
    s.school_id as school_id,
    coalesce(r.score, -1) as score
from
    Schools s
left join
    ranks_1 r
on 
    s.school_id = r.school_id