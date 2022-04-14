/*
Find the countries that have lost all their ships in battles.
*/
-- ship of outcomes in class
WITH ALL_SHIPS AS (
 SELECT ship, country from outcomes o
 JOIN classes c ON (c.class = o.ship)
 UNION
 SELECT name, country FROM ships s
 JOIN classes c ON (c.class = s.class)
),
SHIPS_PER_COUNTRY AS (
 SELECT country, COUNT(ship) count FROM ALL_SHIPS
 GROUP BY country
),
SHIPS_SUNK AS (
 SELECT ship, result FROM outcomes
 WHERE result = 'sunk'
),
SHIPS_SUNKED_PER_COUNTRY AS (
 SELECT aships.country, COUNT(ssunk.result) count FROM ALL_SHIPS aships
 JOIN SHIPS_SUNK ssunk ON (ssunk.ship = aships.ship)
 GROUP BY aships.country
)
SELECT spc.country FROM SHIPS_PER_COUNTRY spc
JOIN SHIPS_SUNKED_PER_COUNTRY sspc ON (sspc.country = spc.country)
WHERE spc.count = sspc.count