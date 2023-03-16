-- Using the Income and Outcome tables, determine for each buy-back center the days when it received funds but made no payments, and vice versa.
-- Result set: point, date, type of operation (inc/out), sum of money per day.

select point, date, operation, sum(out) as money_sum
from (
	select point, date, 'out' as "operation", out, concat(point, '|', date) as combine
	from outcome
	where concat(point, '|', date) not in (select concat(point, '|', date) from income)
) as out_tb1
group by 1, 2, 3

union

select point, date, operation, sum(inc) as money_sum
from (
	select point, date, 'inc' as "operation", inc, concat(point, '|', date) as combine
	from income
	where concat(point, '|', date) not in (select concat(point, '|', date) from outcome) 
) as inc_tb1
group by 1, 2, 3
order by 1, 2

