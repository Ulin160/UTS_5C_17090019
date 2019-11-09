-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Nov 2019 pada 14.33
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(8) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `email`, `pass`) VALUES
(1, 'admin22@email.com', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `No_Order` char(4) NOT NULL,
  `Id_Pakaian` char(2) NOT NULL,
  `Jumlah_pakaian` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`No_Order`, `Id_Pakaian`, `Jumlah_pakaian`) VALUES
('1134', 'S4', 8),
('1136', 'B1', 1),
('1136', 'K2', 1),
('1138', 'K1', 2),
('1138', 'K3', 1),
('1139', 'J1', 2),
('1139', 'M1', 1),
('1139', 'S2', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pakaian`
--

CREATE TABLE `pakaian` (
  `Id_Pakaian` char(2) NOT NULL,
  `Jenis_Pakaian` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pakaian`
--

INSERT INTO `pakaian` (`Id_Pakaian`, `Jenis_Pakaian`) VALUES
('B2', 'Bad Cover'),
('B3', 'Boneka'),
('C2', 'Celana Panjang'),
('C3', 'Celana Pendek'),
('H1', 'Handuk'),
('J1', 'Jaket'),
('K1', 'Kaos'),
('K2', 'Kaos Dalam'),
('K3', 'Kaos Kaki'),
('K4', 'Kebaya'),
('K5', 'Kemeja'),
('M1', 'Mukena'),
('R1', 'Rok'),
('R2', 'Rompi'),
('S1', 'Sarung Bantal'),
('S2', 'Sejadah'),
('S3', 'Sarung Guling'),
('S4', 'Selimut'),
('S5', 'Seprei'),
('S6', 'Sweater');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `No_Identitas` char(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(30) DEFAULT NULL,
  `No_Hp` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`No_Identitas`, `Nama`, `Alamat`, `No_Hp`) VALUES
('10115310', 'Ipul', 'Pemalng', '089123222321'),
('10115313', 'Culin', 'Depok', '087822555784');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `No_Order` char(4) NOT NULL,
  `No_Identitas` char(8) NOT NULL,
  `Tgl_Terima` date DEFAULT NULL,
  `Tgl_Ambil` date DEFAULT NULL,
  `total_berat` float NOT NULL,
  `diskon` float NOT NULL,
  `Total_Bayar` int(6) DEFAULT NULL,
  `admin_id` int(8) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`No_Order`, `No_Identitas`, `Tgl_Terima`, `Tgl_Ambil`, `total_berat`, `diskon`, `Total_Bayar`, `admin_id`) VALUES
('1134', '10115562', '2017-06-10', '2017-06-12', 7.7, 0, 46000, 1),
('1140', '10115313', '2019-11-07', NULL, 3, 3000, 18000, 1),
('1136', '10115315', '2017-06-11', '2017-06-13', 2, 0, 12000, 1),
('1141', '10115313', '2019-11-07', NULL, 3, 1000, 20000, 1),
('1138', '10115322', '2017-06-12', '2017-06-14', 2.7, 0, 16200, 1),
('1139', '10115320', '2017-06-13', '2017-06-14', 4, 0, 24000, 1),
('1142', '10115313', '2019-11-07', '2019-11-07', 1, 1000, 6000, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `No_Order` (`No_Order`),
  ADD KEY `Id_Pakaian` (`Id_Pakaian`);

--
-- Indeks untuk tabel `pakaian`
--
ALTER TABLE `pakaian`
  ADD PRIMARY KEY (`Id_Pakaian`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`No_Identitas`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`No_Order`),
  ADD KEY `No_Identitas` (`No_Identitas`),
  ADD KEY `No_Identitas_2` (`No_Identitas`),
  ADD KEY `No_Identitas_3` (`No_Identitas`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
