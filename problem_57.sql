/*
For classes having irreparable combat losses and at least three ships in the database, display the name of the class and the number of ships sunk.
*/

-- get class, ship with results are sunk
WITH sunk_ships AS (
  SELECT C.class, S.name, O.result FROM classes as C
  LEFT JOIN ships as S ON (C.class = S.class)
  LEFT JOIN outcomes as O ON (O.ship = S.name)
  WHERE O.result = 'sunk'
  UNION
  SELECT C.class, O.ship, O.result FROM classes as C
  LEFT JOIN outcomes as O ON (O.ship = C.class)
  WHERE O.result = 'sunk'
),

-- count the sunk ships
clasess_with_sunk_ships AS (
 	SELECT sships.class, COUNT(sships.result) sunk_count 
	FROM sunk_ships sships
 	GROUP BY sships.class
),

-- get all ships
all_ships AS (
 SELECT C.class, S.name FROM classes as C
 JOIN ships as S ON (C.class = S.class)
 UNION
 SELECT C.class, O.ship FROM classes as C
 JOIN outcomes O ON (O.ship = C.class)
),

--count classes that have >= 3 ships 
classes_with_valid_count AS (
 SELECT aships.class, COUNT(aships.name) count FROM all_ships as aships
 GROUP BY aships.class
 HAVING COUNT(aships.name) >= 3
)

-- join 2 tb that have count ships
SELECT cwsships.class, cwsships.sunk_count FROM clasess_with_sunk_ships cwsships
JOIN classes_with_valid_count cwvcount ON (cwvcount.class = cwsships.class)