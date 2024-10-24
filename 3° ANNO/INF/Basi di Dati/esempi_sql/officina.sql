DROP DATABASE IF EXISTS officina;

CREATE DATABASE officina;

use officina;

create table Isola(
codice varchar(6) primary key,
tipo varchar(20) default 'full',
mq decimal(5,2) not null 
);

create table Auto(
targa varchar(7) primary key,
marca varchar(15),
modello varchar(15),
stato varchar(11),
codiceIsola varchar(6),
foreign key (codiceIsola) references Isola(codice)
);

create table Attrezzatura(
matricola varchar(10) primary key,
tipo varchar(10),
marca varchar(10),
nroInventario int not null check(nroInventario>0),
dataAcquisto date,
dataInstallazine date
);

create table FunzioneIsola(
codiceIsola varchar(6),
matricola varchar(10),
primary key (codiceIsola, matricola),
foreign key (codiceIsola) references Isola(codice),
foreign key (matricola) references Attrezzatura(matricola)
);


insert into Attrezzatura values ('aaa', 'gomma', 'pirelli', 1, '2022-12-01', '2023-11-01');
insert into Attrezzatura values ('BBB', 'BULLONE', 'FISCHER', 2, '2022-10-06', '2023-01-01');
insert into Attrezzatura values ('ccc', 'BULLONE', 'FISCHER', 2, '2022-10-06', '2023-01-01');

insert into Isola values ('full1', 'tutto', 12);
insert into Isola values ('full2', 'tuttos', 1);
insert into Isola values ('full3', 'tuttop', 2);

insert into FunzioneIsola values('full1', 'aaa');
insert into FunzioneIsola values('full2', 'ccc');
insert into FunzioneIsola values('full1', 'BBB');


