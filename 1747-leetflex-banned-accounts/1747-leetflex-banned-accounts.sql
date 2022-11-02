
with next_login as (
	SELECT 
		account_id,
		ip_address,
		coalesce(lead(ip_address) over (partition by account_id order by login asc), ip_address) as next_ip,
		login,
		coalesce(lead(login) over (partition by account_id order by login asc), login) as next_login,
		logout,
		COALESCE(lead(logout) over (partition by account_id order by login asc), logout) as next_logout
	FROM 
		LogInfo)
, session_overlaps as (		
	select
		account_id,
		case when ip_address != next_ip and LEAST(logout, next_logout) - greatest(login, next_login) >= 0 and (next_login > login or next_logout > logout) then "yes" else "no" end as overlap
	FROM 
		next_login)
select
	DISTINCT account_id
FROM 
	session_overlaps
WHERE 
	overlap = "yes"