with orders_2019 as (
	SELECT 
	  buyer_id,
	  count(order_id) as orders
	FROM 
	  Orders
	where 
	  order_date like '2019-%'
	group by
	  buyer_id)
SELECT 
  u.user_id as buyer_id,
  u.join_date as join_date,
  coalesce(o.orders, 0) as orders_in_2019
FROM 
  Users u
left join
  orders_2019 o 
on
  u.user_id = o.buyer_id