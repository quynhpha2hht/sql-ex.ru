/*
Find the battles in which Kongo-class ships from the Ships table were engaged.
*/
with x as (
	select s.name, s.class
	from ships  s
	left join classes c
	on s.class = c.class
	where s.class = 'Kongo'
	)
select distinct battle 
from (
	select x.name, o.ship, o.battle
	from x 
	join outcomes o
	on x.name = o.ship
	) y
