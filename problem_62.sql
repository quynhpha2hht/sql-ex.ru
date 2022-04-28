/*
For the database with money transactions being recorded not more than once a day, calculate the total cash balance of all buy-back centers at the beginning of 04/15/2001.
*/
select 
	sum(
		case when inc is null then 0 else inc end
		-
		case when out is null then 0 else out end
	)
from (
	select point, sum(inc) as inc
	from income_o
	where date < '2001-04-15'
	group by 1) x
full join
(	select point, sum(out) as out 
	from outcome_o
	where date < '2001-04-15'
	group by 1) y
on x.point = y.point