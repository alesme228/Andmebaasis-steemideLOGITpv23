-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:42 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `smekalovalogitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `auto`
--

CREATE TABLE `auto` (
  `autoID` int(11) NOT NULL,
  `autoNR` varchar(50) DEFAULT NULL,
  `mudell` varchar(50) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `v_aasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `auto`
--

INSERT INTO `auto` (`autoID`, `autoNR`, `mudell`, `mark`, `v_aasta`) VALUES
(1, '000 SOS', '65', 'BMW', 2007);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tartu', 'Tartumaa'),
(2, 'Pärnu', 'Pärnumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inimeneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL,
  `loomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inimeneID`, `nimi`, `synniaeg`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autoID`, `loomID`) VALUES
(1, 'Kristina Maksimova', '2022-06-01', '5657457', 155.50, b'1', NULL, NULL, NULL),
(2, 'Dmitry Nagiev', '2025-04-05', '485856', 100.10, b'0', NULL, NULL, NULL),
(3, 'Aleksandra Korol', '2005-07-07', '3486856', 177.00, b'0', NULL, NULL, NULL),
(4, 'Melisa Panni', '2024-01-24', '4365734', 166.50, b'1', NULL, NULL, NULL),
(5, 'Molly Benefit', '2005-06-06', '43696797', 170.00, b'1', NULL, NULL, NULL),
(7, 'sasha Benefit', '2006-07-07', '47639467', 170.00, b'1', 1, NULL, NULL),
(9, 'Pavel Pashutin2', '2006-07-07', '4763967', 170.00, b'1', 1, 1, NULL),
(11, 'Grigory', '2006-07-07', NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` varchar(20) DEFAULT NULL,
  `kaal` decimal(5,2) DEFAULT NULL,
  `tyypID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loom`
--

INSERT INTO `loom` (`loomID`, `nimi`, `kaal`, `tyypID`) VALUES
(1, 'denny', 2.50, NULL),
(2, 'markiz', 1.50, 1);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tyyp`
--

CREATE TABLE `tyyp` (
  `tyypID` int(11) NOT NULL,
  `tyyp` varchar(50) DEFAULT NULL,
  `kirjeldus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tyyp`
--

INSERT INTO `tyyp` (`tyypID`, `tyyp`, `kirjeldus`) VALUES
(1, 'koer', 'mänguline ja armas');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autoNR` (`autoNR`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_auto` (`autoID`),
  ADD KEY `fk_loom` (`loomID`);

--
-- Indeksid tabelile `loom`
--
ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD KEY `fk_tyyp` (`tyypID`);

--
-- Indeksid tabelile `tyyp`
--
ALTER TABLE `tyyp`
  ADD PRIMARY KEY (`tyypID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `auto`
--
ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `tyyp`
--
ALTER TABLE `tyyp`
  MODIFY `tyypID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`),
  ADD CONSTRAINT `fk_loom` FOREIGN KEY (`loomID`) REFERENCES `loom` (`loomID`);

--
-- Piirangud tabelile `loom`
--
ALTER TABLE `loom`
  ADD CONSTRAINT `fk_tyyp` FOREIGN KEY (`tyypID`) REFERENCES `tyyp` (`tyypID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
