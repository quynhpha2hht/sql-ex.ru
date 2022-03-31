/*
Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
*/

select distinct maker
from product 
where model in (select model from pc where speed >= 450)
order by maker