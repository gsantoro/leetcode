SELECT 
  contest_id,
  round(count(distinct r.user_id) / count(distinct u.user_id) * 100.0, 2) as percentage
FROM 
  Users u
join
  Register r
group by 
  contest_id
order BY 
  2 desc,
  contest_id asc