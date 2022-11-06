
with valid_trips as (
	SELECT 
		id,
		status,
		t.request_at
	FROM 
		Trips t
	left join
		Users u1
	on
		t.client_id = u1.users_id
	JOIN 
		Users u2
	on
		t.driver_id = u2.users_id
	where
		u1.banned = "No" AND 
		u2.banned = "No" AND 
		t.request_at between '2013-10-01' and '2013-10-03')
SELECT 
	request_at as Day,
	round(sum(case when status = "completed" then 0 else 1 end) / count(id), 2) as "Cancellation Rate"
FROM 
	valid_trips t
group by 
	request_at
