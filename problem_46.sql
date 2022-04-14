/*
For each ship that participated in the Battle of Guadalcanal, get its name, displacement, and the number of guns.
*/

select o.ship, c.displacement, c.numguns
from outcomes o
left join ships s on o.ship = s.name
left join classes c on c.class = s.class or  c.class = o.ship
where o.battle = 'Guadalcanal'