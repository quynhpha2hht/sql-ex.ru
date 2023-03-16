--Find the names of different passengers that ever travelled more than once occupying seats with the same number.

SELECT p.name
FROM Passenger p JOIN Pass_in_trip pt
ON p.ID_psg = pt.ID_psg
GROUP BY p.name, p.id_psg
HAVING COUNT(DISTINCT pt.place) < COUNT(*)