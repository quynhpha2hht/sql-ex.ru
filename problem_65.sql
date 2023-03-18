with t0 as (
	select maker, type
	from product
	group by 1, 2
)

,
t1 as (
	select maker, type,
			case when type = 'PC' then 1 
				 when type = 'Laptop' then 2
				 when type = 'Printer' then 3
				 else 1 end as order_type
	from t0
)
,
t2 as (
	select *,
			row_number() over(partition by maker order by order_type) as rn
	from t1
)

select 
		row_number() over(order by maker) as num,
		case 
			when rn = 1 then maker
			else ''
		end as maker,
		type
from t2
order by num

