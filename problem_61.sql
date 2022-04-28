/*
For the database with money transactions being recorded not more than once a day, calculate the total cash balance of all buy-back centers.
*/

select sum(coalesce(x.income, 0)) - sum(coalesce(y.outcome, 0)) as differ
from (
	select point,
			sum(inc) as income
	from income_o
	group by 1
) as x
full join (
	select point, 
			sum(out) as outcome
	from outcome_o
	group by 1
) as y
on x.point = y.point

