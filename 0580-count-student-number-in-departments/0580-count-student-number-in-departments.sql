# Write your MySQL query statement below
select
    d.dept_name as dept_name,
    coalesce(count(s.student_id), 0) as student_number
from
    Department d
left join
    Student s
on 
    d.dept_id = s.dept_id
group by
    d.dept_id,
    d.dept_name
order by
    2 desc, 
    1 asc