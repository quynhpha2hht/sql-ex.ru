/*
One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw).
Determine the average ship mw with an accuracy of two decimal places for each country having ships in the database.
*/
with tb1 as (
	select c.class, o.ship, c.country, c.bore
	from outcomes o 
	join classes c on o.ship = c.class
	),
tb2 as (
	select c.class, s.name, c.country, c.bore
	from classes c
	join ships s on c.class = s.class
),
tb3 as (
	select * from tb1
	union 
	select * from tb2
)

select country, round(avg(bore*bore*bore/2)::numeric, 2)
from tb3
group by country
order by country;




