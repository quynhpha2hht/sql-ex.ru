/*
Find the names of the ships having a gun caliber of 16 inches (including ships in the Outcomes table).
*/

select name
from ships
where class in (select class from classes where bore = 16)
union
select ship
from outcomes
where ship in (select class from classes where bore = 16)