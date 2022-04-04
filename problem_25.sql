/*
Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
Result set: maker.
*/

select distinct maker
from product
join pc on product.model = pc.model
where pc.speed = (
	select max(speed) from pc
	where ram = (select min(ram) from pc)
)
and product.type = 'PC'
and ram = (select min(ram) from pc)

intersect 

select distinct maker
from product
where type = 'Printer'