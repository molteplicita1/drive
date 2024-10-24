-- 
-- 
-- Creazione database PROGFINANZIATI, 
-- e definizione delle tabelle Docente, Progetto e Partecipa
--
-- 

--
-- Eliminazione del database PROGFINANZIATI (se esiste)
--

DROP DATABASE IF EXISTS PROGFINANZIATI;

--
-- Creazione del database PROGFINANZIATI
--

CREATE DATABASE PROGFINANZIATI;

USE PROGFINANZIATI;

--
-- Creazione delle tabelle Docente, Progetto e Partecipa
--

CREATE TABLE Docente(
CodiceDocente CHAR(3) PRIMARY KEY,
Nome VARCHAR(20),
Cognome VARCHAR(20),
Dipartimento CHAR
);

CREATE TABLE Progetto(
CodiceProgetto CHAR(3) PRIMARY KEY,
Nome VARCHAR(20),
EnteFinanziatore VARCHAR(20)
);

CREATE TABLE Partecipa(
CodiceDocente CHAR(3),
CodiceProgetto CHAR(3),
DataInizio DATE,
DataFine DATE,
PRIMARY KEY(CodiceDocente,CodiceProgetto),
FOREIGN KEY(CodiceDocente) REFERENCES Docente(CodiceDocente),
FOREIGN KEY(CodiceProgetto) REFERENCES Progetto(CodiceProgetto)
);

--
-- Inserimento di valori nelle tabelle Docente, Progetto e Partecipa
--

INSERT INTO Docente VALUES('000','Anna','Rossi','A');
INSERT INTO Docente VALUES('001','Mario','Mela','A');
INSERT INTO Docente VALUES('002','Massimiliano','De Luca','A');
INSERT INTO Docente VALUES('003','Alessia','Russo','A');
INSERT INTO Docente VALUES('004','Roberto','Padova','B');
INSERT INTO Docente VALUES('005','Alberto','Vitaliano','B');
INSERT INTO Docente VALUES('006','Franco','Quagliarella','B');
INSERT INTO Docente VALUES('007','Roberto','Baldazzi','C');
INSERT INTO Docente VALUES('008','Silvia','Verdi','C');
INSERT INTO Docente VALUES('009','Stefania','Storti','D');
INSERT INTO Docente VALUES('010','Mauro','De Mauri','E');
INSERT INTO Docente VALUES('011','Pietro','De pietri','F');

INSERT INTO Progetto VALUES('WP1','WORKPAD','Regione Campania');
INSERT INTO Progetto VALUES('SM4','SM4ALL','Regione Campania');
INSERT INTO Progetto VALUES('ACS','ACSI','Regione Campania');
INSERT INTO Progetto VALUES('P32','PD32','MUR');
INSERT INTO Progetto VALUES('NET','NETWORK','Regione Lazio');
INSERT INTO Progetto VALUES('ISW','Sw Engineering','MUR');
INSERT INTO Progetto VALUES('DBR','DB Relazionali','Regione Lazio');


INSERT INTO Partecipa VALUES('000','WP1','2018-11-01','2021-11-30');
INSERT INTO Partecipa VALUES('001','WP1','2018-11-01','2021-11-30');
INSERT INTO Partecipa VALUES('002','WP1','2018-11-01','2021-11-30');
INSERT INTO Partecipa VALUES('003','WP1','2019-03-01','2021-11-30');
INSERT INTO Partecipa VALUES('001','SM4','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('007','SM4','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('008','SM4','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('004','P32','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('005','P32','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('006','P32','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('009','P32','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('009','NET','2019-09-01','2022-09-30');
INSERT INTO Partecipa VALUES('010','ACS','2020-09-01','2023-09-30');
INSERT INTO Partecipa VALUES('011','ISW','2020-09-01','2023-09-30');
INSERT INTO Partecipa VALUES('008','ISW','2021-07-01','2023-06-30');


