with summary as (
    select
        visited_on as d,
        sum(amount) as m,
        count(customer_id) as c
    from
        Customer
    group by
        visited_on)
, moving_window as (
	select
	    d,
	    m + 
	    lag(m, 1) over (order by d) + 
	    lag(m, 2) over (order by d) +
	    lag(m, 3) over (order by d) + 
	    lag(m, 4) over (order by d) +
	    lag(m, 5) over (order by d) +
	    lag(m, 6) over (order by d) as amount
	from 
	    summary)
select
	d as visited_on,
	amount,
	round(amount / 7, 2) as average_amount
FROM 
	moving_window
WHERE 
	amount is not null