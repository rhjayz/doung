-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25 Mei 2018 pada 06.06
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_doung`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `laporan` (
`IDPelanggan` int(11)
,`nama_p` varchar(50)
,`alamat_p` varchar(100)
,`namat_p` varchar(50)
,`notlp_p` varchar(20)
,`harga_p` varchar(15)
,`tgl_bayar` varchar(20)
,`waktu_bayar` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pelanggan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pelanggan` (
`IDPelanggan` int(11)
,`nama_p` varchar(50)
,`Totalb` varchar(10)
,`BayarB` varchar(10)
,`Kembali` varchar(10)
,`tgl_bayar` varchar(20)
,`waktu_bayar` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `struk`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `struk` (
`IDPelanggan` int(11)
,`nama_p` varchar(50)
,`coklat_p` int(4)
,`strawberry_p` int(4)
,`vanilla_p` int(4)
,`harga_p` varchar(15)
,`Totalb` varchar(10)
,`BayarB` varchar(10)
,`Kembali` varchar(10)
,`tgl_bayar` varchar(20)
,`waktu_bayar` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`) VALUES
('bima', '12345');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bayar`
--

CREATE TABLE `tb_bayar` (
  `IDPelanggan` int(11) NOT NULL,
  `Totalb` varchar(10) NOT NULL,
  `BayarB` varchar(10) NOT NULL,
  `Kembali` varchar(10) NOT NULL,
  `tgl_bayar` varchar(20) NOT NULL,
  `waktu_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_bayar`
--

INSERT INTO `tb_bayar` (`IDPelanggan`, `Totalb`, `BayarB`, `Kembali`, `tgl_bayar`, `waktu_bayar`) VALUES
(21, '220000', '900000', '680000', '20 May 2018', '05:39:25'),
(22, '120000', '900000', '780000', '21 May 2018', '11:12:39'),
(21, '220000', '1000000', '780000', '21 May 2018', '13:08:30'),
(21, '220000', '1000000', '780000', '21 May 2018', '13:09:00'),
(21, '220000', '1000000', '780000', '21 May 2018', '13:09:24'),
(23, '100000', '9000000', '8900000', '21 May 2018', '13:10:28'),
(24, '75000', '90000', '15000', '21 May 2018', '15:39:45'),
(23, '100000', '1000000', '900000', '24 May 2018', '12:51:29'),
(25, '115000', '1000000', '885000', '24 May 2018', '12:51:51'),
(26, '120000', '900000', '780000', '24 May 2018', '15:49:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `IDPelanggan` int(11) NOT NULL,
  `nama_p` varchar(50) NOT NULL,
  `alamat_p` varchar(100) NOT NULL,
  `namat_p` varchar(50) NOT NULL,
  `notlp_p` varchar(20) NOT NULL,
  `coklat_p` int(4) NOT NULL,
  `strawberry_p` int(4) NOT NULL,
  `vanilla_p` int(4) NOT NULL,
  `harga_p` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`IDPelanggan`, `nama_p`, `alamat_p`, `namat_p`, `notlp_p`, `coklat_p`, `strawberry_p`, `vanilla_p`, `harga_p`) VALUES
(26, 'Zayn', 'Jln baru', 'Keren', '0821312412', 12, 11, 1, '120000');

-- --------------------------------------------------------

--
-- Struktur untuk view `laporan`
--
DROP TABLE IF EXISTS `laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan`  AS  select `tb_order`.`IDPelanggan` AS `IDPelanggan`,`tb_order`.`nama_p` AS `nama_p`,`tb_order`.`alamat_p` AS `alamat_p`,`tb_order`.`namat_p` AS `namat_p`,`tb_order`.`notlp_p` AS `notlp_p`,`tb_order`.`harga_p` AS `harga_p`,`tb_bayar`.`tgl_bayar` AS `tgl_bayar`,`tb_bayar`.`waktu_bayar` AS `waktu_bayar` from (`tb_order` join `tb_bayar` on((`tb_order`.`IDPelanggan` = `tb_bayar`.`IDPelanggan`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pelanggan`
--
DROP TABLE IF EXISTS `pelanggan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pelanggan`  AS  select `tb_order`.`IDPelanggan` AS `IDPelanggan`,`tb_order`.`nama_p` AS `nama_p`,`tb_bayar`.`Totalb` AS `Totalb`,`tb_bayar`.`BayarB` AS `BayarB`,`tb_bayar`.`Kembali` AS `Kembali`,`tb_bayar`.`tgl_bayar` AS `tgl_bayar`,`tb_bayar`.`waktu_bayar` AS `waktu_bayar` from (`tb_order` join `tb_bayar` on((`tb_order`.`IDPelanggan` = `tb_bayar`.`IDPelanggan`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `struk`
--
DROP TABLE IF EXISTS `struk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `struk`  AS  select `tb_order`.`IDPelanggan` AS `IDPelanggan`,`tb_order`.`nama_p` AS `nama_p`,`tb_order`.`coklat_p` AS `coklat_p`,`tb_order`.`strawberry_p` AS `strawberry_p`,`tb_order`.`vanilla_p` AS `vanilla_p`,`tb_order`.`harga_p` AS `harga_p`,`tb_bayar`.`Totalb` AS `Totalb`,`tb_bayar`.`BayarB` AS `BayarB`,`tb_bayar`.`Kembali` AS `Kembali`,`tb_bayar`.`tgl_bayar` AS `tgl_bayar`,`tb_bayar`.`waktu_bayar` AS `waktu_bayar` from (`tb_order` join `tb_bayar` on((`tb_order`.`IDPelanggan` = `tb_bayar`.`IDPelanggan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`IDPelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `IDPelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
