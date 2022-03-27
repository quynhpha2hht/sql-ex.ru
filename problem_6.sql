/* problem 6:
Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
*/

with get_maker as (
select maker, type, model
from product
where type = 'Laptop')
,

get_speed as (
select model, speed 
from laptop
where hd >= 10)

select distinct m.maker, s.speed
from get_maker m, get_speed s
where m.model = s.model
order by 1
