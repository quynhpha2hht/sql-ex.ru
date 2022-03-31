/*
For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
*/

select c.class,
       s.name,
        c.country
from classes c
inner join ships s on c.class = s.class
where c.numGuns > 9 