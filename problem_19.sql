/*
For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
Result set: maker, average screen size.
*/
select product.maker, avg(laptop.screen) as average_screen
from laptop
left join product on laptop.model = product.model
group by product.maker