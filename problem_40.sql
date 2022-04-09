/*
Get the makers who produce only one product type and more than one model. Output: maker, type.
*/
with getmaker as (
		select maker from (
		select distinct maker, type
		from product
		) as tb1
	group by maker
	having count(*) = 1
	intersect
	select maker from (
		select maker, model
		from product) as tb2
	group by maker
	having count(1) > 1
)

select distinct g.maker, p.type
from getmaker g
join product p
on g.maker = p.maker

