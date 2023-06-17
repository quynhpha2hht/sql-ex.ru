with RECURSIVE cte_recursive as (
	select 1 as base
	union all
	select base + 1 from cte_recursive
	where base < 10
)

select * from cte_recursive;