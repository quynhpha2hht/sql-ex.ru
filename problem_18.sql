/*
Find the makers of the cheapest color printers.
Result set: maker, price.
*/
with tb1 as (
	select model, price
	from printer
	where price = (select min(price) from printer where color = 'y')
	
	intersect 
	
	select model, price
	from printer 
	where color = 'y'
)

select distinct product.maker, tb1.price
from product 
join tb1 on product.model = tb1.model