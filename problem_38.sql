/*
Find countries that ever had classes of both battleships (‘bb’) and cruisers (‘bc’).
*/

select country
from classes
where type = 'bb'

intersect

select country
from classes
where type = 'bc'