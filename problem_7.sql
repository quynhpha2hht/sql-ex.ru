/* problem 7:
Get the models and prices for all commercially available products (of any type) produced by maker B.
*/

select model, price
from laptop
where model in (select model from product where maker = 'B')
union 
select model, price
from pc
where model in (select model from product where maker = 'B')
union
select model, price
from printer
where model in (select model from product where maker = 'B')
