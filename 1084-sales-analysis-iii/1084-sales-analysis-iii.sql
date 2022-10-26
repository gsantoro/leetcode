SELECT distinct
  p.product_id,
  p.product_name
FROM 
  Sales s
JOIN	
  Product p
on
  s.product_id = p.product_id
WHERE 
  s.sale_date between '2019-01-01' and '2019-03-31' and s.product_id not in (
	SELECT 
	  s2.product_id
	FROM 
	  Sales s2
	WHERE 
	  s2.sale_date not between '2019-01-01' and '2019-03-31')