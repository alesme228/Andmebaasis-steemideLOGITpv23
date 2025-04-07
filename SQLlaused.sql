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
