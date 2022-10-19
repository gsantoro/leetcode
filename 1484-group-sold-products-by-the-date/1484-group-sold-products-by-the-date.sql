
SELECT 
  sell_date,
  count(distinct product) as num_sold,
  GROUP_CONCAT(DISTINCT product) as products  
FROM 
  Activities a 
group by
  sell_date
order BY 
  sell_date, GROUP_CONCAT(DISTINCT product) asc