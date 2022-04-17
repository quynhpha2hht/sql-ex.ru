/*
For each class, determine the year the first ship of this class was launched.
If the lead ship’s year of launch is not known, get the minimum year of launch for the ships of this class.
Result set: class, year.
*/

SELECT C.class, 
       CASE WHEN S.launched IS NULL THEN 
       (SELECT MIN(launched) 
        FROM   Ships as S 
       WHERE   S.class = C.class) ELSE S.launched END
FROM   Classes as C LEFT JOIN Ships as S
ON     C.class = S.name;