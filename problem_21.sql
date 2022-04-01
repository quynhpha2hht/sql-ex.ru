/*
Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.
*/

select product.maker, max(pc.price) as maximum_price
from product
right join pc on product.model = pc.model
group by product.maker

