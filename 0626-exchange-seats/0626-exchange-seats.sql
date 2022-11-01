# Write your MySQL query statement below
SELECT 
	id,
	case 
		when id % 2 = 1 then coalesce(lead(student) over (order by id asc), student)
		else lag(student) over (order by id asc)
	end as student
from 
	Seat