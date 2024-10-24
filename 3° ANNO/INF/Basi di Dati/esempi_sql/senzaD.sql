USE PROGFINANZIATI;

SELECT *
FROM Docente
WHERE Cognome NOT LIKE 'D%';

SELECT P.CodiceDocente, CodiceProgetto
FROM Partecipa as P, (SELECT *
						FROM Docente
						WHERE Cognome NOT LIKE 'D%') as D
WHERE P.CodiceDocente = D.CodiceDocente;

SELECT DISTINCT *
FROM Progetto as P NATURAL JOIN (SELECT CodiceProgetto
						FROM Partecipa as P, (SELECT *
												FROM Docente
												WHERE Cognome NOT LIKE 'D%') as D
					WHERE P.CodiceDocente = D.CodiceDocente) as Pr
