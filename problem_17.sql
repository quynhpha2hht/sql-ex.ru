/*
Get the laptop models that have a speed smaller than the speed of any PC.
Result set: type, model, speed.
*/

with get_laptop_info  as (
	select l.model, p.type, l.speed
	from laptop l
	left join product p on l.model = p.model
)

select distinct gli.type, gli.model, gli.speed
from get_laptop_info gli
where gli.speed < all (select speed from pc)
