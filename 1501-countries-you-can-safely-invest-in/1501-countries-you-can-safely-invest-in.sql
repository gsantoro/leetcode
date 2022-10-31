
with callers_country as (
	SELECT 
		id,
		SUBSTRING(phone_number, 1, 3) as country
	from
		Person)
, global_avg_duration as (
	select
		avg(duration)
	FROM 
		Calls)	
, all_duration as (
	SELECT 
		caller_id as id,
		duration
	FROM 
		Calls
	union
	select
		callee_id as id,
		duration
	from
		Calls)
, countries_duration as (
	select
		c.country as country
	from
		all_duration d
	join
		callers_country c
	on 
		c.id = d.id
	group BY 
		1
	HAVING 
		avg(d.duration) > (select * from global_avg_duration)
)
SELECT 
	c.name as country
FROM 
	countries_duration d
join
	Country c
on
	c.country_code = d.country

