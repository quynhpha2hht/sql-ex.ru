/*
Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
Result set: maker
*/
select maker
from product 
where model in (select model from pc where speed >= 750)
and type = 'PC'

intersect

select maker
from product
where model in (select model from laptop where speed >= 750)
and type = 'Laptop'
