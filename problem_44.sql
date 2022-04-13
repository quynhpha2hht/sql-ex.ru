/*
Find all ship names beginning with the letter R.
*/
select name
from (
	select name from ships
	union
	select ship from outcomes
	) x
where name like 'R%'