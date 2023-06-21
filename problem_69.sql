/*
Using the Income and Outcome tables, find out the balance for each buy-back center by the end of each day when funds were received or payments were made.
Note that the cash isn’t withdrawn, and the unspent balance/debt is carried forward to the next day.
Result set: buy-back center ID (point), date in dd/mm/yyyy format, unspent balance/debt by the end of this day.
*/
select distinct
  point,
  to_char(date, 'DD/MM/YYYY') as date,
  sum(inc) over(partition by point order by date RANGE UNBOUNDED PRECEDING) as rem
  from (
    select point, date, inc from income
    union all
    select point, date, -out from outcome
  ) q
order by point, date