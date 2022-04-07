/*
List the names of lead ships in the database (including the Outcomes table).
*/
select ship
from outcomes where ship in (select class from classes)
union
select name
from ships
where name = any (select class from classes)