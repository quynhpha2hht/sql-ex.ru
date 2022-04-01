/*
For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
Result set: speed, average price.
*/
select speed, avg(price)
from pc
where speed > 600
group by speed