select distinct battle 
from (
select o.battle, c.country
from outcomes as o
join battles as b on o.battle = b.name
left join ships as s on o.ship = s.name
join classes as c on s.class = c.class or o.ship = c.class
group by 1, 2
having count(o.ship) >= 3
) as t1

