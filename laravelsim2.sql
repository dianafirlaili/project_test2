-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 07:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelsim2`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `tgl` varchar(255) DEFAULT NULL,
  `siswa_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banksoal`
--

CREATE TABLE `banksoal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pertanyaan` longtext DEFAULT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `tingkatkesulitan` varchar(255) DEFAULT NULL,
  `tingkatkesulitanangka` varchar(255) DEFAULT NULL,
  `gambar` longtext DEFAULT NULL,
  `kategorisoal_nama` varchar(255) DEFAULT NULL,
  `dataajar_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banksoaljawaban`
--

CREATE TABLE `banksoaljawaban` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jawaban` longtext DEFAULT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `hasil` varchar(255) DEFAULT NULL,
  `banksoal_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dataajar`
--

CREATE TABLE `dataajar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kelas_id` varchar(255) DEFAULT NULL,
  `guru_id` varchar(255) DEFAULT NULL,
  `mapel_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ekskul`
--

CREATE TABLE `ekskul` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `singkatan` varchar(255) DEFAULT NULL,
  `guru_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ekskuldetail`
--

CREATE TABLE `ekskuldetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` varchar(255) DEFAULT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `ekskul_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generatebanksoal`
--

CREATE TABLE `generatebanksoal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jml` varchar(255) DEFAULT NULL,
  `soal` varchar(255) DEFAULT NULL,
  `jawaban` varchar(255) DEFAULT NULL,
  `mudah` varchar(255) DEFAULT NULL,
  `sedang` varchar(255) DEFAULT NULL,
  `sulit` varchar(255) DEFAULT NULL,
  `tgl` varchar(255) DEFAULT NULL,
  `dataajar_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generatebanksoal_detail`
--

CREATE TABLE `generatebanksoal_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` varchar(255) DEFAULT NULL,
  `generatebanksoal_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generatebanksoal_jawaban`
--

CREATE TABLE `generatebanksoal_jawaban` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoaljawaban_id` varchar(255) DEFAULT NULL,
  `pilihan` varchar(255) DEFAULT NULL,
  `benarsalah` varchar(255) DEFAULT NULL,
  `generatebanksoal_detail_id` varchar(255) DEFAULT NULL,
  `generatebanksoal_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomerinduk` varchar(255) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `jk` varchar(255) DEFAULT NULL,
  `golongan` varchar(255) DEFAULT NULL,
  `pendidikanterakhir` varchar(255) DEFAULT NULL,
  `kategori_id` varchar(255) DEFAULT NULL,
  `users_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `nomerinduk`, `jabatan`, `alamat`, `telp`, `jk`, `golongan`, `pendidikanterakhir`, `kategori_id`, `users_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Sri', '3', NULL, 'Jl. Sapta Marga RT 02 / 05 Desa Sidayu Kec. Gombong', '081233140370', NULL, NULL, NULL, NULL, '2000', NULL, '2024-05-08 15:49:31', '2024-05-19 13:24:43'),
(2, 'Maulana', '002', NULL, 'Tangerang', '089771233145', NULL, NULL, NULL, NULL, '2003', NULL, '2024-05-14 02:28:34', '2024-05-14 02:28:34'),
(3, 'Ajeng', '543', NULL, 'Jl. Sehat', '081233140370', NULL, NULL, NULL, NULL, '2005', NULL, '2024-05-19 22:54:52', '2024-05-19 22:54:52'),
(4, 'panda', '1122', NULL, 'Jl. Jalan', '081233540123', NULL, NULL, NULL, NULL, '2007', '2024-05-20 06:50:42', '2024-05-20 06:50:02', '2024-05-20 06:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `hafalan`
--

CREATE TABLE `hafalan` (
  `id` int(11) NOT NULL,
  `santri_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `tes` varchar(3) NOT NULL,
  `surah_id` int(11) NOT NULL,
  `ayat` varchar(3) NOT NULL,
  `makhroj` varchar(4) NOT NULL,
  `tajwid` varchar(4) NOT NULL,
  `nilai_hs` varchar(4) NOT NULL,
  `nilai_kb` varchar(4) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  `deleted_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hafalanadm`
--

CREATE TABLE `hafalanadm` (
  `id` int(11) NOT NULL,
  `surah` varchar(225) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hafalanadm`
--

INSERT INTO `hafalanadm` (`id`, `surah`, `kelas_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Alfatihah, AlBaqarah, AliImran', 7, '2024-05-21 19:16:48', '2024-05-21 19:16:48', '2024-05-21 19:18:09'),
(2, 'Al Waqiah, Al Mulk, Al Qoriah', 9, '2024-05-21 19:24:38', '2024-05-21 19:24:38', '2024-05-21 19:24:38'),
(4, 'Ya Sin, Ar Rahman, Al Munafiqun', 9, '2024-05-21 22:00:49', '2024-05-21 22:00:49', '2024-05-21 22:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `inputnilai`
--

CREATE TABLE `inputnilai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilai` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `siswa_id` varchar(255) DEFAULT NULL,
  `materipokok_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id` int(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id`, `nama`, `kategori`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADT12', '1', '1', '2024-05-17 13:03:47', '2024-05-17 13:02:32', '2024-05-17 13:02:32'),
(3, 'AB12', '1', '2', '2024-05-17 13:49:39', '2024-05-17 13:49:39', '2024-05-17 13:49:39'),
(4, 'JK1', '2', 'Tersisa', '2024-05-17 14:02:24', '2024-05-17 14:02:24', '2024-05-17 14:02:24'),
(5, 'AAA', '1', 'Penuh', '2024-05-19 14:34:27', '2024-05-19 14:34:27', '2024-05-19 14:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `prefix`, `kode`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 'Kepala Sekolah', 'pegawai', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(2, 'Administrator/Bendahara', 'pegawai', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(3, 'Dana Bos', 'pemasukan', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(4, 'Lain-lain', 'pemasukan', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(5, 'Dana Bulanan', 'pengeluaran', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(6, 'Lain-lain', 'pengeluaran', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(7, 'Otomotif', 'jurusan', 'OTO', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(8, '1', 'semester', 'SATU', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(9, '2', 'semester', 'DUA', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(10, 'Teknik Jaringan dan Komputer', 'jurusan', 'TKJ', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(11, 'A. Muatan Nasional', 'tipepelajaran', 'A', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(12, 'B. Muatan kewilayahan', 'tipepelajaran', 'B', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(13, 'C1. Dasar Bidang Keahlian', 'tipepelajaran', 'C1', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(14, 'C2. Dasar Program Keahlian', 'tipepelajaran', 'C2', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(15, 'C3. Kompetensi Keahlian', 'tipepelajaran', 'C3', NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(16, 'Per Bulan', 'tipetagihan', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(17, 'Per Semester', 'tipetagihan', NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(18, 'Sekali', 'tipetagihan', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tingkatan` varchar(255) NOT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `guru_id` varchar(255) DEFAULT NULL,
  `tapel_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `tingkatan`, `suffix`, `guru_id`, `tapel_id`, `created_at`, `updated_at`) VALUES
(7, '7', NULL, '2', 3, '2024-05-16 15:07:59', '2024-05-16 15:07:59'),
(8, '9', NULL, '1', 2, '2024-05-17 00:48:12', '2024-05-17 00:48:27'),
(9, '8', NULL, '3', 3, '2024-05-19 22:55:48', '2024-05-19 22:55:48');

-- --------------------------------------------------------

--
-- Table structure for table `kko`
--

CREATE TABLE `kko` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kko`
--

INSERT INTO `kko` (`id`, `nama`, `tipe`, `keterangan`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pengetahuan', 'mudah', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(2, 'mengutip', 'mudah', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(3, 'menyebutkan', 'mudah', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(4, 'menjalaskan', 'mudah', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(5, 'menggambar', 'mudah', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(6, 'menugaskan', 'sedang', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(7, 'mengurutkan', 'sedang', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(8, 'menentukan', 'sedang', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(9, 'menerapkan', 'sedang', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(10, 'menyesuaikan', 'sedang', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(11, 'mengatur', 'sulit', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(12, 'mengabstraksi', 'sulit', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(13, 'menganimasikan', 'sulit', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(14, 'mengumpulkan', 'sulit', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32'),
(15, 'mengkategorikan', 'sulit', NULL, NULL, '2024-05-08 15:49:32', '2024-05-08 15:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `kompetensidasar`
--

CREATE TABLE `kompetensidasar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` longtext DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `dataajar_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `kkm` varchar(255) DEFAULT NULL,
  `tingkatan` varchar(255) DEFAULT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `tapel_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materipokok`
--

CREATE TABLE `materipokok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` longtext DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `kompetensidasar_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_08_04_141828_create_sessions_table', 1),
(7, '2021_08_06_155146_create_settings_table', 1),
(8, '2021_10_22_134006_create_tapel_table', 1),
(9, '2021_10_22_134200_create_kelas_table', 1),
(10, '2021_10_22_134217_create_siswa_table', 1),
(11, '2021_10_22_134234_create_guru_table', 1),
(12, '2021_10_22_134247_create_mapel_table', 1),
(13, '2021_10_22_135841_create_kko_table', 1),
(14, '2021_10_22_164651_create_kategori_table', 1),
(15, '2021_10_22_200611_create_kompetensidasar_table', 1),
(16, '2021_10_22_201317_create_dataajar_table', 1),
(17, '2021_10_22_201331_create_materipokok_table', 1),
(18, '2021_10_23_001140_create_banksoal_table', 1),
(19, '2021_10_23_001210_create_banksoaljawaban_table', 1),
(20, '2021_10_23_152535_add_kategorisoal_nama_on_banksoal_table', 1),
(21, '2021_10_24_100118_create_inputnilai_table', 1),
(22, '2021_10_24_123919_create_absensi_table', 1),
(23, '2021_10_24_124109_create_pelanggaran_table', 1),
(24, '2021_10_25_135449_create_generatebanksoal_table', 1),
(25, '2021_10_25_154702_create_generatebanksoal_detail_table', 1),
(26, '2021_10_25_154929_create_generatebanksoal_jawaban_table', 1),
(27, '2021_11_11_214323_create_ekskul_table', 1),
(28, '2021_11_11_214738_create_ekskuldetail_table', 1),
(29, '2021_11_11_214908_create_tagihan_table', 1),
(30, '2021_11_11_214948_create_tagihandetail_table', 1),
(31, '2021_11_11_215010_create_pembayaran_table', 1),
(32, '2024_05_17_092320_add_timestamps_to_kamar_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `skor` varchar(255) DEFAULT NULL,
  `tgl` varchar(255) DEFAULT NULL,
  `siswa_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `tglbayar` varchar(255) DEFAULT NULL,
  `nomerinduk` varchar(255) DEFAULT NULL,
  `tagihandetail_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WuehjBr59fbYF7JWWpF4LnsTSUNldrsGgk3TSDuW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic0dOWUlQcmhJR1oxTmFrRGUzWldWeUdOQ0hFczFQYnE5UHdWeVpVVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1716300918),
('X4ZEAqABZq5Wkkm1Al08j2IFckxqJT9T8SGDHPMC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzFpd01MR3p3bzJwVWxMYWExYkhKdmhyOU90M2NJdm94a0I4NmZZcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1716306178);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_nama` varchar(255) DEFAULT NULL,
  `app_namapendek` varchar(255) DEFAULT NULL,
  `paginationjml` varchar(255) DEFAULT NULL,
  `lembaga_nama` varchar(255) DEFAULT NULL,
  `lembaga_jalan` varchar(255) DEFAULT NULL,
  `lembaga_telp` varchar(255) DEFAULT NULL,
  `lembaga_kota` varchar(255) DEFAULT NULL,
  `lembaga_logo` varchar(255) DEFAULT NULL,
  `tapelaktif` varchar(255) DEFAULT NULL,
  `nominaltagihandefault` varchar(255) DEFAULT NULL,
  `moodleuser` varchar(255) DEFAULT NULL,
  `moodlepass` varchar(255) DEFAULT NULL,
  `passdefaultsiswa` varchar(255) DEFAULT NULL,
  `passdefaultpegawai` varchar(255) DEFAULT NULL,
  `passdefaultortu` varchar(255) DEFAULT NULL,
  `sekolahlogo` varchar(255) DEFAULT NULL,
  `sekolahttd` varchar(255) DEFAULT NULL,
  `sekolahttd2` varchar(255) DEFAULT NULL,
  `minimalpembayaranujian` varchar(255) DEFAULT NULL,
  `semesteraktif` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `app_nama`, `app_namapendek`, `paginationjml`, `lembaga_nama`, `lembaga_jalan`, `lembaga_telp`, `lembaga_kota`, `lembaga_logo`, `tapelaktif`, `nominaltagihandefault`, `moodleuser`, `moodlepass`, `passdefaultsiswa`, `passdefaultpegawai`, `passdefaultortu`, `sekolahlogo`, `sekolahttd`, `sekolahttd2`, `minimalpembayaranujian`, `semesteraktif`, `created_at`, `updated_at`) VALUES
(1, 'Sistem Monitoring Perkembangan Santri', 'SIMONTRI', '20', 'LEMBAGA PSIKOLOGI PELITA WACANA', 'Jl.Simpang Wilis 2 Kav. B', '0341-581777', 'Malang', 'assets/upload/logo.png', '2021/2022', '1000000', NULL, NULL, 'siswa123', '12345678', 'ortu123', '', 'Nama Kepala Sekolah M.Pd', 'Nama Kepala Sekolah M.Pd', '70', '1', '2024-05-08 15:49:31', '2024-05-08 15:58:41');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nomerinduk` varchar(255) NOT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `tempatlahir` varchar(255) DEFAULT NULL,
  `tgllahir` varchar(255) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `jk` varchar(20) DEFAULT NULL,
  `kelas_id` varchar(255) DEFAULT NULL,
  `tapel_id` varchar(255) DEFAULT NULL,
  `moodleuser` varchar(255) DEFAULT NULL,
  `moodlepass` varchar(255) DEFAULT NULL,
  `users_id` varchar(255) DEFAULT NULL,
  `siswafoto` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `nomerinduk`, `agama`, `tempatlahir`, `tgllahir`, `alamat`, `jk`, `kelas_id`, `tapel_id`, `moodleuser`, `moodlepass`, `users_id`, `siswafoto`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Paijo', '123', 'Islam', 'Magelang', '2024-05-22', 'Cina', '1', '7', '2', NULL, NULL, '2001', NULL, NULL, '2024-05-08 15:49:31', '2024-05-19 13:25:15'),
(2, 'Jinwo', '003', 'Islam', 'Tangerang', '2024-05-25', 'Tangerang', '1', '8', '2', NULL, 'paijo123', '2004', '', NULL, '2024-05-15 15:20:33', '2024-05-17 14:28:15'),
(3, 'Diana Firlaili', '1234567', 'Islam', 'Malang', '2024-05-20', 'Jl. Aroengbinang No. 29', '2', '7', '3', NULL, NULL, '2010', '', '2024-05-20 07:26:27', '2024-05-20 07:25:51', '2024-05-20 07:26:27'),
(4, 'bub', '978', 'Islam', 'jawa', '2024-05-20', 'Jl. Aroengbinang No. 29', '1', '8', '2', NULL, NULL, '2011', '', '2024-05-20 07:29:52', '2024-05-20 07:29:22', '2024-05-20 07:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `surah`
--

CREATE TABLE `surah` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `ayat` int(4) NOT NULL,
  `juz` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surah`
--

INSERT INTO `surah` (`id`, `nama`, `ayat`, `juz`) VALUES
(1, 'Al-Fatihah', 7, 1),
(2, 'Al-Baqarah', 286, 1),
(3, 'Ali Imran', 200, 3),
(4, 'An-Nisa', 176, 4),
(5, 'Al-Maidah', 120, 6),
(6, 'Al-An\'am', 165, 8),
(7, 'Al-A\'raf', 206, 10),
(8, 'Al-Anfal', 75, 10),
(9, 'At-Tawbah', 129, 11),
(10, 'Yunus', 109, 12),
(11, 'Hud', 123, 12),
(12, 'Yusuf', 111, 12),
(13, 'Ar-Ra\'d', 43, 13),
(14, 'Ibrahim', 52, 14),
(15, 'Al-Hijr', 99, 15),
(16, 'An-Nahl', 128, 15),
(17, 'Al-Isra', 111, 15),
(18, 'Al-Kahf', 110, 15),
(19, 'Maryam', 98, 16),
(20, 'Ta-Ha', 135, 16),
(21, 'Al-Anbiya', 112, 17),
(22, 'Al-Hajj', 78, 17),
(23, 'Al-Mu\'minun', 118, 18),
(24, 'An-Nur', 64, 18),
(25, 'Al-Furqan', 77, 19),
(26, 'Ash-Shu\'ara', 227, 20),
(27, 'An-Naml', 93, 20),
(28, 'Al-Qasas', 88, 20),
(29, 'Al-Ankabut', 69, 21),
(30, 'Ar-Rum', 60, 21),
(31, 'Luqman', 34, 21),
(32, 'As-Sajda', 30, 21),
(33, 'Al-Ahzab', 73, 22),
(34, 'Saba', 54, 22),
(35, 'Fatir', 45, 22),
(36, 'Ya-Sin', 83, 23),
(37, 'As-Saffat', 182, 23),
(38, 'Sad', 88, 23),
(39, 'Az-Zumar', 75, 23),
(40, 'Gafir', 85, 24),
(41, 'Fussilat', 54, 24),
(42, 'Ash-Shura', 53, 25),
(43, 'Az-Zukhruf', 89, 25),
(44, 'Ad-Dukhan', 59, 26),
(45, 'Al-Jathiya', 37, 26),
(46, 'Al-Ahqaf', 35, 26),
(47, 'Muhammad', 38, 26),
(48, 'Al-Fath', 29, 26),
(49, 'Al-Hujurat', 18, 26),
(50, 'Qaf', 45, 27),
(51, 'Adh-Dhariyat', 60, 27),
(52, 'At-Tur', 49, 27),
(53, 'An-Najm', 62, 27),
(54, 'Al-Qamar', 55, 27),
(55, 'Ar-Rahman', 78, 27),
(56, 'Al-Waqi\'ah', 96, 28),
(57, 'Al-Hadid', 29, 28),
(58, 'Al-Mujadila', 22, 28),
(59, 'Al-Hashr', 24, 28),
(60, 'Al-Mumtahanah', 13, 28),
(61, 'As-Saff', 14, 28),
(62, 'Al-Jumu\'ah', 11, 28),
(63, 'Al-Munafiqun', 11, 28),
(64, 'At-Taghabun', 18, 28),
(65, 'At-Talaq', 12, 28),
(66, 'At-Tahrim', 12, 28),
(67, 'Al-Mulk', 30, 29),
(68, 'Al-Qalam', 52, 29),
(69, 'Al-Haqqah', 52, 29),
(70, 'Al-Ma\'arij', 44, 29),
(71, 'Nuh', 28, 29),
(72, 'Al-Jinn', 28, 29),
(73, 'Al-Muzzammil', 20, 29),
(74, 'Al-Muddathir', 56, 29),
(75, 'Al-Qiyamah', 40, 29),
(76, 'Al-Insan', 31, 29),
(77, 'Al-Mursalat', 50, 29),
(78, 'An-Naba', 40, 30),
(79, 'An-Nazi\'at', 46, 30),
(80, '\'Abasa', 42, 30),
(81, 'At-Takwir', 29, 30),
(82, 'Al-Infitar', 19, 30),
(83, 'Al-Mutaffifin', 36, 30),
(84, 'Al-Inshiqaq', 25, 30),
(85, 'Al-Buruj', 22, 30),
(86, 'At-Tariq', 17, 30),
(87, 'Al-A`la', 19, 30),
(88, 'Al-Ghashiyah', 26, 30),
(89, 'Al-Fajr', 30, 30),
(90, 'Al-Balad', 20, 30),
(91, 'Ash-Shams', 15, 30),
(92, 'Al-Lail', 21, 30),
(93, 'Ad-Duha', 11, 30),
(94, 'Ash-Sharh', 8, 30),
(95, 'At-Tin', 8, 30),
(96, 'Al-\'Alaq', 19, 30),
(97, 'Al-Qadr', 5, 30),
(98, 'Al-Bayyinah', 8, 30),
(99, 'Az-Zalzalah', 8, 30),
(100, 'Al-\'Adiyat', 11, 30),
(101, 'Al-Qari`ah', 11, 30),
(102, 'At-Takathur', 8, 30),
(103, 'Al-\'Asr', 3, 30),
(104, 'Al-Humazah', 9, 30),
(105, 'Al-Fil', 5, 30),
(106, 'Quraish', 4, 30),
(107, 'Al-Ma\'un', 7, 30),
(108, 'Al-Kawthar', 3, 30),
(109, 'Al-Kafirun', 6, 30),
(110, 'An-Nasr', 3, 30),
(111, 'Al-Lahab', 5, 30),
(112, 'Al-Ikhlas', 4, 30),
(113, 'Al-Falaq', 5, 30),
(114, 'An-Nas', 6, 30);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tingkatan` varchar(255) DEFAULT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `bln_awal` varchar(255) DEFAULT NULL,
  `bln_akhir` varchar(255) DEFAULT NULL,
  `tagihan` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tagihandetail`
--

CREATE TABLE `tagihandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kelas_id` varchar(255) DEFAULT NULL,
  `tagihan_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tapel`
--

CREATE TABLE `tapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tapel`
--

INSERT INTO `tapel` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(2, '2020/2021', '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(3, '2021/2022', '2024-05-08 15:49:31', '2024-05-08 15:49:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tipeuser` varchar(255) DEFAULT NULL,
  `nomerinduk` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `tipeuser`, `nomerinduk`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '1', 'admin', NULL, '$2y$10$CiPebTD32anx7nKtiIFrg./wWKdcgBt2LqqKoJn.ZgKbm4zSKw05W', NULL, NULL, NULL, NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(2, 'Kepsek', 'kepsek@gmail.com', 'kepsek', '2', 'kepsek', NULL, '$2y$10$trSDltsbpNSVgkfEjaSK1u0WWIwhRqEj3Iz/RFFBXFLXOUaWPH9Qi', NULL, NULL, NULL, NULL, NULL, '2024-05-08 15:49:31', '2024-05-08 15:49:31'),
(2000, 'Sri', 'guru@gmail.com', 'guru', '3', 'guru', NULL, '$2y$10$pE17twREQ.CUanB7KBnJ9.LTa5i7j0LNKtyGXDIHHPkohK8nx00H6', NULL, NULL, NULL, NULL, NULL, '2024-05-08 15:49:31', '2024-05-19 13:24:43'),
(2001, 'Paijo', 'siswa@gmail.com', 'siswa', '123', 'siswa', NULL, '$2y$10$hE5X6areE98GTkj9oF5MWe.phs9Fuf67JUhk.aQZwDLDH.soAseBu', NULL, NULL, NULL, NULL, NULL, '2024-05-08 15:49:31', '2024-05-19 13:25:15'),
(2003, 'Maulana', 'guru111@gmail.com', 'guru', '002', '2024-05-14 09:28:34', NULL, '$2y$10$hTccpc/.kTuVbNaUQHSGteNfHBcX0nv.Z3ntuI75NgnOAMbxsDsJC', NULL, NULL, NULL, NULL, NULL, '2024-05-14 02:28:34', '2024-05-14 02:28:34'),
(2004, 'Jinwo', 'paijo@gmail.com', 'siswa', '003', '20240515222033', NULL, '$2y$10$bI.jcNuR0/ps644LvKUB/.3OOb2i28YIoOd928o7Z.oFzNAF7FpvW', NULL, NULL, NULL, NULL, NULL, '2024-05-15 15:20:33', '2024-05-17 14:28:15'),
(2005, 'Ajeng', 'ajeng@gmail.com', 'guru', '543', '2024-05-20 05:54:52', NULL, '$2y$10$eHr0jN.rd54/Wsqt8JKUqOrn8Si5qDsdluyBbRXIbLd04/cFQvaeK', NULL, NULL, NULL, NULL, NULL, '2024-05-19 22:54:52', '2024-05-19 22:54:52'),
(2007, 'panda', 'panda@gmail.com', 'guru', '1122', '2024-05-20 13:50:02', NULL, '$2y$10$YEeHcmZE5AKNL/n9ccUn0.qxeNpFRsr6oL18dKjZUQaJVzNZ1NLea', NULL, NULL, NULL, NULL, NULL, '2024-05-20 06:50:02', '2024-05-20 06:50:35'),
(2008, 'diaana', 'diana@gmail', 'siswa', '101', '20240520135159', NULL, '$2y$10$ncY8nEm9MhjRotZYJoV3hOjLOajZy5HiDpZjqC7ITiCfsI6YK.dZC', NULL, NULL, NULL, NULL, NULL, '2024-05-20 06:51:59', '2024-05-20 06:51:59'),
(2009, 'Diana Firlaili', 'diana@gmail.com', 'siswa', '1012', '20240520141449', NULL, '$2y$10$0k8M9ZHLwqqdwqknt/AO/u1jda/2vyh8YngkADqx75rTioz6nVA26', NULL, NULL, NULL, NULL, NULL, '2024-05-20 07:14:49', '2024-05-20 07:14:49'),
(2010, 'Diana Firlaili', 'dianananaan@gmail.com', 'siswa', '1234567', '20240520142550', NULL, '$2y$10$avAadQahefYG20iQFQ14MuVhNB/dseuV0EvMYejso7GqtQRVYrtbu', NULL, NULL, NULL, NULL, NULL, '2024-05-20 07:25:51', '2024-05-20 07:26:19'),
(2011, 'bub', 'bubbbb@gmail.com', 'siswa', '978', '20240520142922', NULL, '$2y$10$PHghNCOh7etVp/aUiOzsreJMf0G41RtxMqpG9fUcHOEQxskjpAP9y', NULL, NULL, NULL, NULL, NULL, '2024-05-20 07:29:22', '2024-05-20 07:29:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banksoal`
--
ALTER TABLE `banksoal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banksoaljawaban`
--
ALTER TABLE `banksoaljawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataajar`
--
ALTER TABLE `dataajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ekskuldetail`
--
ALTER TABLE `ekskuldetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `generatebanksoal`
--
ALTER TABLE `generatebanksoal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generatebanksoal_detail`
--
ALTER TABLE `generatebanksoal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generatebanksoal_jawaban`
--
ALTER TABLE `generatebanksoal_jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hafalan`
--
ALTER TABLE `hafalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hafalanadm`
--
ALTER TABLE `hafalanadm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inputnilai`
--
ALTER TABLE `inputnilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kko`
--
ALTER TABLE `kko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kompetensidasar`
--
ALTER TABLE `kompetensidasar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materipokok`
--
ALTER TABLE `materipokok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surah`
--
ALTER TABLE `surah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihandetail`
--
ALTER TABLE `tagihandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banksoal`
--
ALTER TABLE `banksoal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banksoaljawaban`
--
ALTER TABLE `banksoaljawaban`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dataajar`
--
ALTER TABLE `dataajar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekskul`
--
ALTER TABLE `ekskul`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekskuldetail`
--
ALTER TABLE `ekskuldetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generatebanksoal`
--
ALTER TABLE `generatebanksoal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generatebanksoal_detail`
--
ALTER TABLE `generatebanksoal_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generatebanksoal_jawaban`
--
ALTER TABLE `generatebanksoal_jawaban`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hafalan`
--
ALTER TABLE `hafalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hafalanadm`
--
ALTER TABLE `hafalanadm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inputnilai`
--
ALTER TABLE `inputnilai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kko`
--
ALTER TABLE `kko`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kompetensidasar`
--
ALTER TABLE `kompetensidasar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materipokok`
--
ALTER TABLE `materipokok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `surah`
--
ALTER TABLE `surah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tagihandetail`
--
ALTER TABLE `tagihandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2012;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
