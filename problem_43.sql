/*
Get the battles that occurred in years when no ships were launched into water.
*/
select name
from battles 
where extract (year from date) not in 
	(select x.year_launched 
	 from (select date_part('year', date) as year_launched
		  from battles) x
	 join ships on x.year_launched = ships.launched)