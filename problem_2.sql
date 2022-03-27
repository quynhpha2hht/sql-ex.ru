/* problem 2:
List all printer makers. Result set: maker.
*/

select distinct maker
from product
where type = 'Printer'