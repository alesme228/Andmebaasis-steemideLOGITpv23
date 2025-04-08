--kommentaar
--xampp control panel
--Conect TO:
Server Name: localhost -127.0.0.1
-- Authentification:
-- Kasutaja: root
  -- parool: ei ole

CREATE DATABASE smekalovaLOGITpv23;
USE smekalovaLOGITpv23;

--tabeli loomine 
--auto_increment - ise täidab tabeli 1,2,3....
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50),unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit,
);
SELECT * FROM inimene;

--tabeli kustumile
DROP TABLE inimene;
insert into inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Kristina Maksimova', '2022-06-01', '5657457', '155.5', 1),
('Dmitry Nagiev', '2025-04-05', '485856', '100.1', 0),
('Aleksandra Korol', '2005-07-07', '3486856', '177.0', 0),
('Melisa Panni', '2024-01-24', '4365734', '166.5', 1);

--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity (1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
--andmete lisamine tabeli elukoht
select * from elukoht;
--andmete lisamine tabeli elukoht
insert into elukoht(elukoht, maakond)
values ('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');
--tabeli muutmine uue veergu lisamine
alter table inimene add elukohtID int;
select * from inimene; 
--foreign key lisamine
alter table inimene
add constraint fk_elukoht
foreign key (elukohtID) references elukoht(elukohtID);

select * from elukoht;
select * from inimene; 

insert into inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
values
('sasha Benefit', '2006-07-07', '47639467', '170.0', '1', '34');

select inimene.nimi, inimene.synniaeg, elukoht.elukoht from inimene join elukoht
on inimene.elukohtID=elukoht.elukohtID;

select i.nimi, i.synniaeg, e.elukoht from inimene i join elukoht e
on i.elukohtID=e.elukohtID;

CREATE TABLE auto(
autoID int PRIMARY KEY identity (1,1),
autoNR varchar(50) UNIQUE,
mudell varchar(50),
mark varchar(50),
v_aasta int
);

select * from auto;

insert into auto(autoNR, mudell, mark, v_aasta)
values ('000 SOS', '65', 'BMW', '2007');

alter table inimene add autoID int;

alter table inimene
add constraint fk_auto
foreign key (autoID) references auto(autoID);

select * from auto;
select * from inimene; 

insert into inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
values
('Pavel Pashutin2', '2006-07-07', '4763967', '170.0', '1', 1, 11);

select inimene.nimi, inimene.synniaeg, auto.autoNR, auto.mudell, auto.mark from inimene join auto
on inimene.autoID=auto.autoID;
