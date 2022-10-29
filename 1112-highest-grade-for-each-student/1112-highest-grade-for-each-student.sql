with ranks as (
	SELECT 
	  student_id,
	  course_id,
	  grade,
	  DENSE_RANK() over (partition by student_id order by grade desc, course_id asc) as rnk
	FROM 
	  Enrollments)
select
  student_id,
  course_id,
  grade
from 
  ranks
WHERE 
  rnk = 1
