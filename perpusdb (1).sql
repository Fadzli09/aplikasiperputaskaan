-- phpMyAdmin SQL Dump
-- version 5.2.2-dev+20230304.ec8a6a418f
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2023 at 01:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `jenis_kelamin`, `alamat`, `no_hp`) VALUES
('AG002', 'aziz', 'laki-laki', 'kp.babakan', '083879797800'),
('AG003', 'anggota2', 'laki-laki', 'parungkuda', '083879797801'),
('AG004', 'latifah', 'perempuan', 'parungkuda', '087878780905');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `id_pengarang` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tahun_terbit` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_pengarang`, `id_penerbit`, `judul_buku`, `tahun_terbit`, `jumlah`) VALUES
('BK002', 3, 3, 'pgsd', 2001, 0),
('BK003', 2, 3, 'php', 2001, 17),
('BK004', 2, 3, 'pemograman', 2000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator'),
(2, 'siswa', 'user', 'user123', 'peminjam'),
(4, 'petugas', 'petugass', '202cb962ac59075b964b07152d234b70', 'petugas'),
(5, 'petugas', 'petugas1', 'b53fe7751b37e40ff34d012c7774d65f', 'petugas'),
(6, 'abay', 'abay', '202cb962ac59075b964b07152d234b70', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pm` varchar(20) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pm`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`) VALUES
('PM004', 'AG002', 'BK004', '2023-03-01', '2023-03-08'),
('PM005', 'AG004', 'BK003', '2023-03-04', '2023-03-11');

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `jml_after_pinjam` AFTER INSERT ON `peminjaman` FOR EACH ROW update buku set buku.jumlah = buku.jumlah -1 where buku.id_buku = new.id_buku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`) VALUES
(3, 'penerbit2'),
(5, 'penerbit4');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama_pengarang`) VALUES
(2, 'fazli'),
(3, 'latifah');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_anggota` varchar(20) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_kembalikan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `tgl_kembalikan`) VALUES
(1, 'AG002', 'BK003', '2023-02-20', '2023-02-27', '2023-03-01'),
(2, 'AG003', 'BK003', '2023-03-01', '2023-03-08', '2023-03-01'),
(3, 'AG002', 'BK003', '2023-02-27', '2023-03-06', '2023-03-01'),
(4, 'AG003', 'BK004', '2023-03-01', '2023-03-08', '2023-03-04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pm`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
