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
