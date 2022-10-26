with joins as (     
	SELECT 
	  stock_name, 
	  operation,
	  LEAD (price) over (partition by stock_name order by operation_day) - price as gain
	from 
	  Stocks),
buys as (	 
	select
	  *
	FROM 
	  joins
	WHERE 
	  operation = "Buy")
SELECT	
  stock_name,
  sum(gain) as capital_gain_loss
FROM 
  buys
group by
  stock_name