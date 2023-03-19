-- For all days between 2003-04-01 and 2003-04-07 find the number of trips from Rostov with passengers aboard.
-- Result set: date, number of trips.
with date_tb as (
	select date::timestamp
	from (select '2003-04-01' as date union all select '2003-04-02' as date
		 union all select '2003-04-03' as date union all
		 select '2003-04-04' as date
		 union all
		 select '2003-04-05' as date
		 union all 
		  select '2003-04-06' as date
		 union all
		 select '2003-04-07' as date) t
),
t1 as (
	select distinct p.date, p.trip_no
	from pass_in_trip p 
	right join trip t on p.trip_no=t.trip_no
	where p.date >= '2003-04-01' and p.date <= '2003-04-07'
	and t.town_from like '%Rostov%'
)
,
t2 as (
	select d.date as dt,t1.trip_no
	from date_tb d
	left join t1 on d.date = t1.date
)
select dt, coalesce(count(trip_no),0) as qty
from t2
group by 1
order by 1
