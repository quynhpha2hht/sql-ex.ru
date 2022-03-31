/*
Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
Result set: model with the bigger number, model with the smaller number, speed, and RAM.
*/

select distinct t1.model, t2.model, t2.speed, t2.ram
from pc as t1, pc as t2
where (t1.model > t2.model) and (t2.speed = t1.speed) and (t2.ram = t1.ram)
order by t1.model, t2.model