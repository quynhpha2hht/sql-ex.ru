/*
Find the names of the ships with the largest number of guns among all ships having the same displacement (including ships in the Outcomes table).
*/
-- 1. ship in Ships table + ship in Outcomes table
-- 2. find the largest number of guns of each group displacement (consider class with highest numgun without ships)

with x as (
	select s.name as ship, c.displacement as displacement, c.numguns as numguns
	from ships s
	inner join classes c on s.class = c.class
	union
	select o.ship as ship, c.displacement as displacement, c.numguns as numguns
	from outcomes o 
	join classes c on o.ship = c.class
)
,
y as (
	select displacement, max(numguns) as numguns
	from x
	group by 1
)

select ship
from x
inner join y on x.displacement = y.displacement and x.numguns = y.numguns
order by ship