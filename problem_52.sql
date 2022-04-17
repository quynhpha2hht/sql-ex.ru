/*
Determine the names of all ships in the Ships table that can be a Japanese battleship having at least nine main guns with a caliber of less than 19 inches and a displacement of not more than 65 000 tons.
*/

select s.name
from ships s
join classes c
on s.class = c.class 
where c.country = 'Japan' and c.type = 'bb'
and (c.numguns >= 9 or c.numguns is null) and (c.bore < 19 or c.bore is null) 
and (c.displacement <= 65000 or c.displacement is null)