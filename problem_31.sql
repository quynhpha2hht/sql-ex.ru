/*
For ship classes with a gun caliber of 16 in. or more, display the class and the country.
*/

select class, country
from classes
where bore >= 16
