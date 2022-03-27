/* problem 5:
Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
*/

select model, speed, hd
from pc
where price < 600
and (cd = '12x' or cd = '24x')