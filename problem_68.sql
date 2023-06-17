/*
Find out the number of routes with the greatest number of flights (trips).
Notes.
1) A - B and B - A are to be considered the SAME route.
2) Use the Trip table only.
*/
with tb1 as (
	select count(1) as qty
	from (
		select town_from, town_to,
			case when town_from < town_to then concat(town_from, town_to) else concat(town_to,town_from) end as route
		from trip
	)trip_route
	group by route
)
select count(qty) as qty
from tb1 
where qty = (select max(qty) as max_qty
	from tb1)



