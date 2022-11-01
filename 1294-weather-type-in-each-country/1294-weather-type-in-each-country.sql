with avg_weather as (
    select
        country_id,
        avg(weather_state) as temp
    from
        Weather
    where
        date_format(day, "%Y-%m") = "2019-11"
    group BY
    	country_id)
select
    c.country_name as country_name,
    case 
        when w.temp <= 15 then "Cold" 
        when w.temp >= 25 then "Hot"
        else "Warm"
    end as weather_type
from
    Countries c
join
    avg_weather w
on
    c.country_id = w.country_id

