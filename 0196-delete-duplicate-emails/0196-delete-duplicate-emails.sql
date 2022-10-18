DELETE 
FROM 
	Person
where id not in (
  select 
  * 
  from (
	SELECT 
	min(id) 
	from 
	Person
	group by
	email) as p)