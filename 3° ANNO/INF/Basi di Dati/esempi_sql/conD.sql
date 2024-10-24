USE PROGFINANZIATI;

SELECT *
FROM Docente
WHERE Cognome LIKE 'D%';

select distinct CodiceProgetto
from Partecipa as P
where CodiceDocente in (SELECT CodiceDocente
							FROM Docente
							WHERE Cognome LIKE 'D%');
                            
                            
select distinct *
from Progetto as P
where CodiceProgetto not in (select distinct CodiceProgetto
								from Partecipa as P
								where CodiceDocente in (SELECT CodiceDocente
														FROM Docente
														WHERE Cognome LIKE 'D%'))