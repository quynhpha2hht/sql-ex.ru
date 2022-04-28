/*
Calculate the cash balance of each buy-back center for the database with money transactions being recorded not more than once a day.
Result set: point, balance.
*/
/*
SELECT x.point,
CASE 
	WHEN x.income IS NULL 
	THEN 0 
	ELSE x.income 
END -
CASE 
	WHEN y.outcome IS NULL 
	THEN 0
	ELSE y.outcome 
END
*/

select  x.point, 
		coalesce(x.income, 0) - coalesce(y.outcome, 0) as differ
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
order by x.point