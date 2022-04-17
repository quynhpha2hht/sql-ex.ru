/*
With a precision of two decimal places, determine the average number of guns for the battleship classes.
*/

select round(avg(numguns)::numeric, 2)
from classes
where type = 'bb'