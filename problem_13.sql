/*
Find out the average speed of the PCs produced by maker A.
*/

select avg(speed)
from pc
where model in (select model from product where maker = 'A')