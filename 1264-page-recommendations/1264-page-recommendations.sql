   
with users as (
    select 
        case 
          when user1_id > user2_id then user2_id else user1_id
        end as u1,
        case
          when user1_id > user2_id then user1_id else user2_id
        end as u2
    from
        Friendship
    WHERE
    	user1_id = 1 or user2_id = 1)
-- select * from users    	 	
, friends_pages as (    	
	select
		u1,
		u2,
		l1.page_id as p1,
		l2.page_id as p2
	from 
		users u
	left join
		Likes l1
	on
		u.u1 = l1.user_id
	left JOIN 
		Likes l2
	on 
		u.u2 = l2.user_id
)
-- select * from friends_pages
SELECT 
	distinct(p2) as recommended_page
from 
	friends_pages
WHERE 
	p2 is not null and p2 not in (select p1 from friends_pages where p1 is not null)