select
  user_id,
  max(time_stamp) as last_stamp
from
  Logins
where
  # NOTE: you need to specify a full timestamp. If you provide a date, it will behave weirdly. 
  # Since date/datetime are converted into integer before comparing, a date without time is 
  # a much smaller integer than a datetime
  time_stamp between '2020-01-01 00:00:00' and '2020-12-31 23:59:59'
group BY
  user_id 