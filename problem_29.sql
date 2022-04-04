/*
Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each collection point [i.e. the primary key consists of (point, date)], write a query displaying cash flow data (point, date, income, expense).
Use Income_o and Outcome_o tables.
*/
with tb1 as (
	select Income_o.point, Income_o.date, Income_o.inc, Outcome_o.out from Income_o LEFT JOIN Outcome_o ON Income_o.point = Outcome_o.point AND Income_o.date = Outcome_o.date

	UNION

	select Outcome_o.point, Outcome_o.date, Income_o.inc, Outcome_o.out from Outcome_o LEFT JOIN Income_o ON Income_o.point = Outcome_o.point AND Income_o.date = Outcome_o.date
)

select point, date, inc, out
from tb1 
order by point, date
