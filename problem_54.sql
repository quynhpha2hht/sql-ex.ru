/*
With a precision of two decimal places, determine the average number of guns for all battleships (including the ones in the Outcomes table).
*/
with x as (
select o.ship, c.numguns
from outcomes o 
join classes c on o.ship = c.class
where c.type = 'bb'
	
union
	
select s.name, c.numguns
from ships s
left join classes c on s.class = c.class
where c.type = 'bb'
)

select round(avg(numguns), 2)
from x