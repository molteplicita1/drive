USE PROGFINANZIATI;



UPDATE Docente
SET Soprannome = 'Annata'
WHERE CodiceDocente REGEXP '...';


SELECT *
FROM Docente;