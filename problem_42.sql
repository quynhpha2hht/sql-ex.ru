/*
Get the battles that occurred in years when no ships were launched into water.
*/

select ship, battle
from outcomes 
where result = 'sunk'