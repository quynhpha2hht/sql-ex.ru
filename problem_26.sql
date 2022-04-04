/*
Find out the average price of PCs and laptops produced by maker A.
Result set: one overall average price for all items.
*/
with tb1 as (
	select sum(pc.price) as price, count(pc.price) as count_price
	from pc join product on product.model = pc.model
	where product.maker = 'A'
	union
	select sum(laptop.price) as price, count(laptop.price) as count_price
	from laptop join product on product.model = laptop.model
	where product.maker = 'A'
)
select sum(price)/sum(count_price) as avg_items
from tb1


