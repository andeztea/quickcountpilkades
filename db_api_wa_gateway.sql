-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 02 Jun 2022 pada 08.56
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_api_wa_gateway`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_utama`
--

CREATE TABLE `data_utama` (
  `id` int(11) NOT NULL,
  `no_tps` varchar(10) NOT NULL,
  `no_urut_calon` varchar(10) NOT NULL,
  `jml_suara` int(10) NOT NULL,
  `tahun` year(4) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_utama`
--

INSERT INTO `data_utama` (`id`, `no_tps`, `no_urut_calon`, `jml_suara`, `tahun`, `created_by`, `created_date`, `updated_date`) VALUES
(22, '01', '01', 200, 2022, '6283804070476', '2022-06-02 05:45:10', '0000-00-00 00:00:00'),
(23, '01', '02', 200, 2022, '6283804070476', '2022-06-02 05:47:02', '0000-00-00 00:00:00'),
(24, '02', '03', 75, 2022, '6283804070476', '2022-06-02 05:48:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2022-05-31 08:20:55', '2022-05-31 08:20:55'),
(2, 'moderator', '2022-05-31 08:20:55', '2022-05-31 08:20:55'),
(3, 'admin', '2022-05-31 08:20:55', '2022-05-31 08:20:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_calon`
--

CREATE TABLE `tbl_calon` (
  `id_calon` int(5) NOT NULL,
  `no_urut` varchar(10) NOT NULL,
  `nama_calon` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_calon`
--

INSERT INTO `tbl_calon` (`id_calon`, `no_urut`, `nama_calon`) VALUES
(1, '01', 'H. Andre'),
(2, '02', 'H. Jaya'),
(3, '03', 'Akhmad Jaelani');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengumuman`
--

CREATE TABLE `tbl_pengumuman` (
  `id` int(10) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengumuman`
--

INSERT INTO `tbl_pengumuman` (`id`, `keterangan`, `status`) VALUES
(1, 'Ini Adalah Pengumuman untuk desa pawenang', 0),
(2, 'Tgl 13 Juni 2022 Hari Terakhir pemilihan', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tps`
--

CREATE TABLE `tbl_tps` (
  `id_tps` int(10) NOT NULL,
  `no_tps` varchar(10) NOT NULL,
  `nama_tps` varchar(200) NOT NULL,
  `lokasi` varchar(200) NOT NULL,
  `jml_dtp` int(10) NOT NULL,
  `jml_rusak` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tps`
--

INSERT INTO `tbl_tps` (`id_tps`, `no_tps`, `nama_tps`, `lokasi`, `jml_dtp`, `jml_rusak`) VALUES
(1, '01', 'TPS 1', 'Pasirhuni', 200, 20),
(2, '02', 'TPS 2', 'Panyindangan', 200, 0),
(3, '03', 'TPS 3', 'Cikolawing', 100, 0),
(4, '04', 'TPS 4', 'Cibodas', 100, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin@gmail.com', '$2a$08$g9C8mTeYqdOhEiFk/kIh4.Jl8MPFaXTTJYEPdCXyxOmaO9.Yo4M52', '2022-05-31 08:27:56', '2022-05-31 08:27:56'),
(2, 'admin2', 'admin2@gmail.com', '$2a$08$g9C8mTeYqdOhEiFk/kIh4.Jl8MPFaXTTJYEPdCXyxOmaO9.Yo4M52', '2022-05-31 08:27:56', '2022-05-31 08:27:56'),
(3, 'admin3', 'admin2@gmail.com', '$2a$08$g9C8mTeYqdOhEiFk/kIh4.Jl8MPFaXTTJYEPdCXyxOmaO9.Yo4M52', '2022-05-31 08:27:56', '2022-05-31 08:27:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2022-05-31 08:27:56', '2022-05-31 08:27:56', 1, 1),
('2022-05-31 08:27:56', '2022-05-31 08:27:56', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_utama`
--
ALTER TABLE `data_utama`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_calon`
--
ALTER TABLE `tbl_calon`
  ADD PRIMARY KEY (`id_calon`);

--
-- Indeks untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_tps`
--
ALTER TABLE `tbl_tps`
  ADD PRIMARY KEY (`id_tps`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_utama`
--
ALTER TABLE `data_utama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tbl_calon`
--
ALTER TABLE `tbl_calon`
  MODIFY `id_calon` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_tps`
--
ALTER TABLE `tbl_tps`
  MODIFY `id_tps` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
