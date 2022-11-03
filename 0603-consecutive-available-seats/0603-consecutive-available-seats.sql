with next_seats as (    
	select *, 
	coalesce(lead(free) over (order by seat_id), 0) as next_seat,
	coalesce(lag(free) over (order by seat_id), 0) as prev_seat
	from Cinema)
select
	seat_id
FROM 
	next_seats
where 
	free = 1 and (next_seat = 1 or prev_seat = 1)
order by 
	1