/*
Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
Result set: maker, average HDD capacity.
*/
with tb1 as (
	select maker
	from product
	where type = 'Printer'
	intersect
	select maker
	from product 
	where type = 'PC'
)

select tb1.maker, avg(pc.hd)
from tb1 
join product on tb1.maker = product.maker
join pc on product.model = pc.model
group by tb1.maker

