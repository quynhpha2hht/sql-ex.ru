/*
Find the ship classes having at least one ship sunk in battles.
*/

select c.class
from classes c
where c.class in (select ship from outcomes where result = 'sunk')
union
select c.class
from classes c
join ships s on s.class = c.class
where s.name in (select ship from outcomes where result = 'sunk')