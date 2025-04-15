--kommentaar
--SQL SERVER Managment Stuudio 
--Conect TO:
Server Name: (localdb)\mssqllocaldb
-- Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida vare tehtud kasutajad

CREATE DATABASE smekalovaLOGITpv23;
USE smekalovaLOGITpv23;

--tabeli loomine 
--identity(1,1) - ise täidab tabeli 1,2,3,....
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

create database proceduurSmekalovaLOGITpv23;
use proceduurSmekalovaLOGITpv23;
Create table filmid(
filmID int primary key identity(1,1),
filmNimi varchar(30) unique,
filmPikkus int,
rezisoor varchar(30)
);
select * from filmid;

insert into filmid(filmNimi, FilmPikkus, rezisoor)
values ('Minecraft', 84, 'Radek Beran');

--protseduur, mis lisab uus film ja kohe tabelis (insert, select)

create procedure lisaFilm
@nimi varchar(30),
@pikkus int,
@rezisoor varchar(30)
AS
BEGIN
insert into filmid(filmNimi, FilmPikkus, rezisoor)
values (@nimi, @pikkus, @rezisoor);
select * from filmid;
END;

--KUTSE
EXEC lisafilm 'Bob ja Bobek', 120, 'testtest';

--delete procedure
drop procedure lisaFilm;

--proceduur, mis kustutab filmi filmID järgi (Delete, select)
create procedure kustutaFilm
@id int
AS
BEGIN
select * from filmid;
Delete from filmid where filmID=@id;
select * from filmid;
END;

--kutse
EXEC kustutaFilm 1;
EXEC kustutaFilm @id=1; 

--proceduur, mis uuendab filmiPikkus 5% suurendab 
Create procedure uuendaFilmiPikkus
AS
BEGIN
Select * from filmid;
UPDATE filmid SET filmPikkus=filmPikkus*1.05;
select * from filmid;
END;

EXEC uuendaFilmiPikkus;

--proceduur, mis uuendab filmiPikkus kasutaja sisestav väärtus
Create procedure uuendaFilmiPikkus2
@arv decimal(5,2)
AS
BEGIN
Select * from filmid;
UPDATE filmid SET filmPikkus=filmPikkus*@arv;
select * from filmid;
END;

EXEC uuendaFilmiPikkus2 @arv=0.5;

Create table filmid(
filmID int primary key identity(1,1),
filmNimi varchar(30) unique,
filmPikkus int,
rezisoor varchar(30)
);

select * from filmid;

insert into filmid(filmNimi, FilmPikkus, rezisoor)
values ('Maria', 124, 'Pablo Larrain');

--protseduur, mis näitab filmid tähe järgi

create procedure filmid1taht
@taht char(1)
AS
BEGIN
select * from filmid
where filmNimi LIKE CONCAT (@taht, '%');
END

--kutse
EXEC filmid1taht 'M';

--protseduur, mis näitab filmid mis sisaldavad nimes sistestatud täht

create procedure filmidSisaldabtaht
@taht char(1)
AS
BEGIN
select * from filmid
where filmNimi LIKE CONCAT ('%', @taht, '%');
END

--kutse
EXEC filmidSisaldabTaht 'u';

--protseduur, mis näitab keskmine filmide pikkus
create procedure keskminePikkus
AS
BEGIN
select AVG(filmPikkus) as 'Keskmine Pikkus' from filmid
END

--kutse
exec keskminePikkus;

--KEERULINE PROTSEDUUR
--ALTER TABLE tablinimi ADD veerg tyyp -- добавление столбца
--ALTER TABLE tabelinimi drop veerg -- удаление столбца


CREATE PROCEDURE tabelimuudatus
@tegevus varchar(10),
@tabelinimi varchar(25),
@veerunimi varchar(25),
@tyyp varchar(25) =null
AS
BEGIN
DECLARE @sqltegevus as varchar(max)
set @sqltegevus=case 
when @tegevus='add' then concat('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)
when @tegevus='drop' then concat('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
begin 
EXEC (@sqltegevus);
END
END;

select * from filmid;

--добавление столбца
EXEC tabelimuudatus @tegevus='add', @tabelinimi='filmid', @veerunimi='test', @tyyp='int';
--удаление столбца
EXEC tabelimuudatus @tegevus='drop', @tabelinimi='filmid', @veerunimi='test';
