
with a_b_customers as (
	SELECT 
		customer_id as id
	FROM 
		Orders
	where 
		product_name = "A" or product_name = "B"
	group by 
		customer_id
	HAVING 
		count(distinct product_name) = 2)
, c_customers as (
	SELECT 
		customer_id as id
	from
		Orders o
	where product_name = "C")
, rec_customers as (
	SELECT 
		*
	FROM 
		a_b_customers a
	where 
		id not in (select * from c_customers))
select
	customer_id,
	customer_name
FROM 
	rec_customers r
join
	Customers c
on
	r.id = c.customer_id