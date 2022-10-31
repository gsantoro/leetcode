select
    s.student_id as student_id,
    s.student_name as student_name,
    ss.subject_name as subject_name,
    coalesce(count(e.subject_name), 0) as attended_exams
from
    Students s
join
	Subjects ss    
left join
    Examinations e
on
    s.student_id = e.student_id AND
	ss.subject_name = e.subject_name    
group by
    s.student_id,
    s.student_name,
    ss.subject_name
order by
    s.student_id,
    ss.subject_name