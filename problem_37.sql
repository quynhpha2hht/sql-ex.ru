/*
Find classes for which only one ship exists in the database (including the Outcomes table).
*/
with tb1 as (
	select c.class,  s.name
	from ships s
	join classes c
	on s.class = c.class
	group by 1, 2

	union

	select classes.class, ships1.ship
	from classes
	join (
		select ship from outcomes
		where ship in (select class from classes)
	) as ships1 on classes.class = ships1.ship
	where class in (select ship from ships)
)
select class from (
	select class, count(*) as countclass
	from tb1
	group by 1
	having count(*) = 1
) as tb2
		