/*
Find the ships that `survived for future battles`; that is, after being damaged in a battle, they participated in another one, which occurred later.
*/
select distinct tb1.ship 
from (
	select distinct o.ship, b.date
	from outcomes o
	join battles b on o.battle = b.name
	where o.result = 'damaged') as tb1,
	(
	select distinct o.ship, b.date
	from outcomes o
	join battles b on o.battle = b.name) as tb2
where tb1.date < tb2.date and tb1.ship = tb2.ship

	

