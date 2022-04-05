/*
Under the assumption that receipts of money (inc) and payouts (out) can be registered any number of times a day for each collection point [i.e. the code column is the primary key], display a table with one corresponding row for each operating date of each collection point.
Result set: point, date, total payout per day (out), total money intake per day (inc).
Missing values are considered to be NULL.
*/
with tb1 as (
	select i.point, i.date, sum(i.inc) as income
	from income i
	group by 1, 2
),
tb2 as (
	select point, date, sum(out) as outcome
	from outcome
	group by 1, 2
),
tb3 as (
	select tb1.point, tb1.date,  tb2.outcome, tb1.income
	from tb1
	left join tb2 on tb1.point = tb2.point and tb1.date = tb2.date

	union
	select tb2.point, tb2.date, tb2.outcome, tb1.income
	from tb2
	left join tb1 on tb1.point = tb2.point and tb1.date = tb2.date
)

select * 
from tb3 
order by point, date




