/*
List the models of any type having the highest price of all products present in the database.
*/

with tb1 as (
	select model, price
	from pc 
	where price = (select max(price) from pc)

	union 

	select model, price
	from laptop
	where price = (select max(price) from laptop)

	union

	select model, price
	from printer
	where price = (select max(price) from printer) 
	)

select model
from tb1
group by model, price
having price = (select max(price) from tb1)