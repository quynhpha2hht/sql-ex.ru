/*
Find out the number of routes with the greatest number of flights (trips).
Notes.
1) A - B and B - A are to be considered DIFFERENT routes.
2) Use the Trip table only.
*/

with tb1 as (
SELECT COUNT(*) AS num_flights, town_from, town_to
FROM Trip
GROUP BY town_from, town_to
HAVING COUNT(*) = (
    SELECT MAX(num_trips)
    FROM (
        SELECT COUNT(*) AS num_trips
        FROM Trip
        GROUP BY town_from, town_to
    ) AS trip_counts
))

select count(*) as qty
from tb1 
