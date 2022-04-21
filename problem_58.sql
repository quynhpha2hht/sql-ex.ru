/*
For each product type and maker in the Product table, find out, with a precision of two decimal places, the percentage ratio of the number of models of the actual type produced by the actual maker to the total number of models by this maker.
Result set: maker, product type, the percentage ratio mentioned above.
*/

-- get all makers with models.
with tb1 as (
	select distinct p.maker, x.type
	from product p
	cross join (
		select type
		from product
	) x
),
-- get count of each type in the same maker
c as (
		select tb1.maker, tb1.type, count(product.maker) count_quantity_each_type
		from product
		right join tb1 on product.maker = tb1.maker and product.type = tb1.type
		group by 1, 2
),
-- get sum of each maker
y as (
	select c.maker, sum(count_quantity_each_type) total
	from c
	group by 1
	)

-- calculate percentage ratio
select c.maker, c.type, round(c.count_quantity_each_type/y.total::numeric * 100, 2) as prc
from c 
join y on c.maker = y.maker