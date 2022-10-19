SELECT 
  sell_date,
  count(distinct product) as num_sold,
  GROUP_CONCAT(DISTINCT product order by product asc) as products  
FROM 
  Activities a 
group by
  sell_date
order BY 
  sell_date 