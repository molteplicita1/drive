USE PROGFINANZIATI;

DROP VIEW IF EXISTS Progetto1;

CREATE VIEW Progetto1
AS SELECT *
FROM Progetto
WHERE Nome = 'SM4ALL';

DROP VIEW IF EXISTS Docente1;

CREATE VIEW Docente1
AS SELECT CodiceDocente
FROM Partecipa as P, Progetto1 as CP
WHERE P.CodiceProgetto = CP.CodiceProgetto;

SELECT Dipartimento
FROM Docente as D, Docente1 as D1
WHERE D.CodiceDocente = D1.CodiceDocente
ORDER BY Dipartimento ASC



