-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 10:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_spk_recaslab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(7) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aslab`
--

CREATE TABLE `aslab` (
  `NIM` varchar(7) NOT NULL,
  `Nama_aslab` varchar(30) NOT NULL,
  `Jenis_kelamin` varchar(10) NOT NULL,
  `IPK` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_alternatif`
--

CREATE TABLE `data_alternatif` (
  `id_alternatif` varchar(7) NOT NULL,
  `nama_calonaslab` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `tempat_lahir` varchar(10) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `NIM` varchar(7) NOT NULL,
  `Semester` varchar(2) NOT NULL,
  `IPK` float NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_kriteria`
--

CREATE TABLE `data_kriteria` (
  `id_kriteria` varchar(7) NOT NULL,
  `nama_kriteria` varchar(20) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `bobot_kriteria` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_normalisasi`
--

CREATE TABLE `data_normalisasi` (
  `id_normalisasi` varchar(7) NOT NULL,
  `id_kriteria` varchar(7) NOT NULL,
  `jenis_kriteria` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP` varchar(7) NOT NULL,
  `Nama_Dosen` varchar(30) NOT NULL,
  `MK_diampuh` varchar(15) NOT NULL,
  `Lab_dibina` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_normalisasi`
--

CREATE TABLE `hasil_normalisasi` (
  `id_hasilnormalisasi` varchar(7) NOT NULL,
  `id_alternatif` varchar(7) NOT NULL,
  `id_kriteria` varchar(7) NOT NULL,
  `id_nilai` varchar(5) NOT NULL,
  `bobot_kriteria` decimal(4,2) NOT NULL,
  `nilai_normalisasi` decimal(4,2) NOT NULL,
  `total_bobot` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hitung_preferensi`
--

CREATE TABLE `hitung_preferensi` (
  `id_preferensi` varchar(7) NOT NULL,
  `id_alternatif` varchar(7) NOT NULL,
  `id_hasilnormalisasi` varchar(7) NOT NULL,
  `bobot_preferensi` decimal(4,2) NOT NULL,
  `nilai_normalisasi` decimal(4,2) NOT NULL,
  `nilai_preferensi` decimal(4,2) NOT NULL,
  `total_nilai` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_kriteria`
--

CREATE TABLE `nilai_kriteria` (
  `id_nilai` varchar(7) NOT NULL,
  `id_kriteria` varchar(7) NOT NULL,
  `id_alternatif` varchar(7) NOT NULL,
  `nilai_kriteria` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perankingan`
--

CREATE TABLE `perankingan` (
  `id_ranking` varchar(7) NOT NULL,
  `id_preferensi` varchar(7) NOT NULL,
  `id_alternatif` varchar(7) NOT NULL,
  `nama_calonaslab` varchar(30) NOT NULL,
  `nilai_preferensi` decimal(4,2) NOT NULL,
  `ranking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(7) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `aslab`
--
ALTER TABLE `aslab`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `data_alternatif`
--
ALTER TABLE `data_alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `data_kriteria`
--
ALTER TABLE `data_kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `data_normalisasi`
--
ALTER TABLE `data_normalisasi`
  ADD PRIMARY KEY (`id_normalisasi`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `hasil_normalisasi`
--
ALTER TABLE `hasil_normalisasi`
  ADD PRIMARY KEY (`id_hasilnormalisasi`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_nilai` (`id_nilai`);

--
-- Indexes for table `hitung_preferensi`
--
ALTER TABLE `hitung_preferensi`
  ADD PRIMARY KEY (`id_preferensi`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_hasilnormalisasi` (`id_hasilnormalisasi`);

--
-- Indexes for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `perankingan`
--
ALTER TABLE `perankingan`
  ADD PRIMARY KEY (`id_ranking`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_preferensi` (`id_preferensi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_normalisasi`
--
ALTER TABLE `data_normalisasi`
  ADD CONSTRAINT `data_normalisasi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `data_kriteria` (`id_kriteria`);

--
-- Constraints for table `hasil_normalisasi`
--
ALTER TABLE `hasil_normalisasi`
  ADD CONSTRAINT `hasil_normalisasi_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `data_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `hasil_normalisasi_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `data_kriteria` (`id_kriteria`),
  ADD CONSTRAINT `hasil_normalisasi_ibfk_3` FOREIGN KEY (`id_nilai`) REFERENCES `nilai_kriteria` (`id_nilai`);

--
-- Constraints for table `hitung_preferensi`
--
ALTER TABLE `hitung_preferensi`
  ADD CONSTRAINT `hitung_preferensi_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `data_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `hitung_preferensi_ibfk_2` FOREIGN KEY (`id_hasilnormalisasi`) REFERENCES `hasil_normalisasi` (`id_hasilnormalisasi`);

--
-- Constraints for table `nilai_kriteria`
--
ALTER TABLE `nilai_kriteria`
  ADD CONSTRAINT `nilai_kriteria_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `data_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `nilai_kriteria_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `data_kriteria` (`id_kriteria`);

--
-- Constraints for table `perankingan`
--
ALTER TABLE `perankingan`
  ADD CONSTRAINT `perankingan_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `data_alternatif` (`id_alternatif`),
  ADD CONSTRAINT `perankingan_ibfk_2` FOREIGN KEY (`id_preferensi`) REFERENCES `hitung_preferensi` (`id_preferensi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
