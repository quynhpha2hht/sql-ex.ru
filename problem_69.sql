/*
Using the Income and Outcome tables, find out the balance for each buy-back center by the end of each day when funds were received or payments were made.
Note that the cash isn’t withdrawn, and the unspent balance/debt is carried forward to the next day.
Result set: buy-back center ID (point), date in dd/mm/yyyy format, unspent balance/debt by the end of this day.
*/

with 
t3 as (
select t1.point, t1.date, t1.inc, coalesce(t2.out, 0) as out
from income as t1
left join outcome as t2 on t1.point = t2.point and t1.date = t2.date
)
,
t4 as (
select t2.point, t2.date, coalesce(t1.inc, 0) as inc, t2.out
from outcome as t2
left join income as t1 on t1.point = t2.point and t1.date = t2.date
)
,
t5 as (
	select * from t3
	union all
	select * from t4
)
,
t6 as(
	select point, date, sum(inc) as inc, sum(out) as out
	from t5
	group by point, date
)

