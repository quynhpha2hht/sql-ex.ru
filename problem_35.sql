/*
Find models in the Product table consisting either of digits only or Latin letters (A-Z, case insensitive) only.
Result set: model, type.
*/

select model, type
from product
where model not like '%[^A-Z]%' OR model not like '%[^0-9]%' or model not like '%[^a-z]%'

