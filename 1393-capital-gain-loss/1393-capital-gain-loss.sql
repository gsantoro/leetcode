# # 1. matching sell with buy
# with joins as (     
# 	SELECT 
# 	  stock_name, 
# 	  operation,
# 	  LEAD (price) over (partition by stock_name order by operation_day) - price as gain
# 	from 
# 	  Stocks),
# buys as (	 
# 	select
# 	  *
# 	FROM 
# 	  joins
# 	WHERE 
# 	  operation = "Buy")
# SELECT	
#   stock_name,
#   sum(gain) as capital_gain_loss
# FROM 
#   buys
# group by
#   stock_name


select 
  stock_name, 
  sum(case when operation='Sell' then price else 0 end) - sum(case when operation='Buy' then price else 0 end) as capital_gain_loss
from 
  Stocks
group by 
  stock_name