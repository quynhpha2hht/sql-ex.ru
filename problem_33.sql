/*
Get the ships sunk in the North Atlantic battle.
Result set: ship.
*/
select ship
from outcomes
where result = 'sunk' and battle = 'North Atlantic'