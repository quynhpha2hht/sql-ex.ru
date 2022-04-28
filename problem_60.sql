/*
For the database with money transactions being recorded not more than once a day, calculate the cash balance of each buy-back center at the beginning of 4/15/2001.
Note: exclude centers not having any records before the specified date.
Result set: point, balance
*/

select  x.point, 
		coalesce(x.income, 0) - coalesce(y.outcome, 0) as differ
from (
	select point,
			sum(inc) as income
	from income_o
	where date < '2001-04-15'
	group by 1
) as x
full join (
	select point, 
			sum(out) as outcome
	from outcome_o
	where date < '2001-04-15'
	group by 1
) as y
on x.point = y.point
order by x.point



