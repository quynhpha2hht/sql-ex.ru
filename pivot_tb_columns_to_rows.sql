with x as (
	select *
	from crosstab(
		'select student, subject, evaluation_result 
		 from evaluations
		 order by 1, 2
		')
		as final_results(
		 student varchar, "Geography" numeric, "History" numeric, "Language" numeric, 
			"Maths" numeric, "Music" numeric
		)
)
select subjects, result 
from (
	select 'Maths' as subjects, "Maths" as result
	from x
	union 
	select 'Geography' as subjects, "Geography" as result
	from x
	union
	select 'Music' as subjects, "Music" as result
	from x
	union
	select 'Geography' as subjects, "Geography" as result
	from x
	union
	select 'Language' as subjects, "Language" as result
	from x
	union
	select 'History' as subjects, "History" as result
	from x) as y
order by 1