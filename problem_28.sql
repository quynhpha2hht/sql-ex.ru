/*
Using Product table, find out the number of makers who produce only one model.
*/
select count(maker) from
(
	select maker, count(model)
	from product
	group by maker
	having count(model) = 1
	) as tb1
