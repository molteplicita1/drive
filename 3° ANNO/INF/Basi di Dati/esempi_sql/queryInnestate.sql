SELECT Dipartimento
FROM Docente as D, (SELECT CodiceDocente
					FROM Partecipa as P, (SELECT CodiceProgetto
											FROM Progetto
											WHERE Nome = 'SM4ALL') as CP
					WHERE P.CodiceProgetto = CP.CodiceProgetto) as CD
WHERE D.CodiceDocente = CD.CodiceDocente;