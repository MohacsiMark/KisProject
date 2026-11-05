-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Okt 06. 21:14
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kisprojekt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reg`
--

CREATE TABLE `reg` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `loginnev` varchar(100) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `szerepkor` varchar(20) NOT NULL,
  `auto` tinyint(1) DEFAULT 0,
  `pc` tinyint(1) DEFAULT 0,
  `mobil` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `reg`
--

INSERT INTO `reg` (`id`, `nev`, `loginnev`, `jelszo`, `szerepkor`, `auto`, `pc`, `mobil`, `email`) VALUES
(1, 'Mark Mohacsi', 'mark', '$2y$10$a.4lhX.aWOHYKRBAYtmbd.vFTJsyZPyLjGMg77hOLvOIDlwGIbagi', 'felhasznalo', 1, 0, '+36 30 123-4567', 'mark@gmail.com'),
(2, 'Mark Mohacsi', 'mark', '$2y$10$EwJUH52JubwSJmgg9TsqeO.RIHoYn8XCFiKzGMKmPM.0XZd6ISo0G', 'felhasznalo', 1, 0, '+36 30 123-4567', 'mark@gmail.com');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
