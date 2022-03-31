/*
Find out the average speed of the laptops priced over $1000.
*/

select avg(speed) as avg_speed
from laptop
where price > 1000