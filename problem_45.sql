/*
Find all ship names consisting of three or more words (e.g., King George V).
Consider the words in ship names to be separated by single spaces, and the ship names to have no leading or trailing spaces.
*/
select name
from (
	select name
	from ships
	union 
	select ship 
	from outcomes) x
where name like '% % %'