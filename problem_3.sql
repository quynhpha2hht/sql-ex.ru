/* problem 3:
Find the model number, RAM and screen size of the laptops with prices over $1000.
*/
select model, ram, screen
from laptop
where price > 1000