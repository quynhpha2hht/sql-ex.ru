with x as (
	select extract('month' from date) || '-' || extract('year' from date) as date,
			cust_name, 
			sum(case product_name when 'san pham A' then quantity end) as "san pham A",
			sum(case product_name when 'san pham B' then quantity end) as "san pham B",
			sum(case product_name when 'san pham C' then quantity end) as "san pham C"
	from source_tb
	group by 1, 2
),

y as (
	select x.date, x.cust_name,
			sp.sanpham,
-- single quote: string constants/value, double quote: column name
	case sp.sanpham when 'san pham A' then "san pham A"
					when 'san pham B' then "san pham B"
					when 'san pham C' then "san pham C"
	end as quantity
	from x
	cross join (select sanpham
		from (values ('san pham A'), ('san pham B'), ('san pham C')
		 ) as sp(sanpham)
	) sp
)

select right(date, 4) as time,
		cust_name, sanpham, sum(quantity) as quantity
from y
group by 1, 2, 3
order by sanpham