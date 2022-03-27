/* problem 1:
Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.
*/

select model, speed, hd
from pc
where price < 500