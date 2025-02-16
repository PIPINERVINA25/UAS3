-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 12:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `nim` varchar(16) NOT NULL,
  `jk` varchar(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `id_sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `alamat`, `nim`, `jk`, `status`, `id_sks`) VALUES
(1, 'Andi', 'Tangerang', '20002', 'Pria', 'Drop Out', 1),
(2, 'nenden', 'Jakarta', '20021', 'wanita', 'aktif', 2);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id` int(11) NOT NULL,
  `id_sks` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id`, `id_sks`, `nama`) VALUES
(1, 3, 'Mtk'),
(2, 3, 'inggris');

-- --------------------------------------------------------

--
-- Table structure for table `mhs_mtkl`
--

CREATE TABLE `mhs_mtkl` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `id_mtkul` int(11) NOT NULL,
  `id_sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mhs_mtkl`
--

INSERT INTO `mhs_mtkl` (`id`, `nama`, `id_mtkul`, `id_sks`) VALUES
(47, '1', 2, 3),
(48, '1', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sks`
--

CREATE TABLE `sks` (
  `id` int(11) NOT NULL,
  `jml_sks` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sks`
--

INSERT INTO `sks` (`id`, `jml_sks`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sks` (`id_sks`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sks` (`id_sks`);

--
-- Indexes for table `mhs_mtkl`
--
ALTER TABLE `mhs_mtkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mtkul` (`id_mtkul`),
  ADD KEY `id_sks` (`id_sks`);

--
-- Indexes for table `sks`
--
ALTER TABLE `sks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mhs_mtkl`
--
ALTER TABLE `mhs_mtkl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `sks`
--
ALTER TABLE `sks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`);

--
-- Constraints for table `mhs_mtkl`
--
ALTER TABLE `mhs_mtkl`
  ADD CONSTRAINT `mhs_mtkl_ibfk_1` FOREIGN KEY (`id_mtkul`) REFERENCES `matkul` (`id`),
  ADD CONSTRAINT `mhs_mtkl_ibfk_2` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`),
  ADD CONSTRAINT `mhs_mtkl_ibfk_3` FOREIGN KEY (`id_mtkul`) REFERENCES `matkul` (`id`),
  ADD CONSTRAINT `mhs_mtkl_ibfk_4` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`),
  ADD CONSTRAINT `mhs_mtkl_ibfk_5` FOREIGN KEY (`id_mtkul`) REFERENCES `matkul` (`id`),
  ADD CONSTRAINT `mhs_mtkl_ibfk_6` FOREIGN KEY (`id_sks`) REFERENCES `sks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
