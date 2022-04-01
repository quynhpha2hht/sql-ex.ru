/*
Find the makers producing at least three distinct models of PCs.
Result set: maker, number of PC models.
*/

select maker, count(maker)
from product
where type = 'PC'
and model in (select distinct model from product)
group by maker
having count(maker) > 2