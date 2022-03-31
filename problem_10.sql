/*
Find the printer models having the highest price. Result set: model, price.
*/

select model, price
from printer
where price = (select max(price) from printer)