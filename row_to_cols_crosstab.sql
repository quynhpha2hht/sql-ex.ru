-- enable <tablefunc> extension to call crosstab function
-- create extension tablefunc;


select *
from crosstab (
	'select student, subject, evaluation_result
	from evaluations
	order by 1, 2 ')
as final_results(
	student varchar, "Geography" numeric, "History" numeric, "Language" numeric, "Maths" numeric, "Music" 			numeric)


