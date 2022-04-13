/*
For each maker who has models at least in one of the tables PC, Laptop, or Printer, determine the maximum price for his products.
Output: maker; if there are NULL values among the prices for the products of a given maker, display NULL for this maker, otherwise, the maximum price.

*/
with x as (
	select model, price from laptop
	union
	select model, price from printer
	union
	select model, price from pc
)

select p.maker, 
	case when max(case when x.price is null then 0 else 1 end) = 1 then max(x.price) 
	else null end as price
from product p
right join x on p.model = x.model
group by 1