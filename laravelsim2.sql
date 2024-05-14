-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2023 pada 15.02
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

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
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siswa_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banksoal`
--

CREATE TABLE `banksoal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pertanyaan` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `nilai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tingkatkesulitan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tingkatkesulitanangka` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `kategorisoal_nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataajar_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banksoaljawaban`
--

CREATE TABLE `banksoaljawaban` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jawaban` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `nilai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hasil` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banksoal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dataajar`
--

CREATE TABLE `dataajar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kelas_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guru_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mapel_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekskul`
--

CREATE TABLE `ekskul` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singkatan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guru_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekskuldetail`
--

CREATE TABLE `ekskuldetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nilai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ekskul_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `generatebanksoal`
--

CREATE TABLE `generatebanksoal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jml` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jawaban` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mudah` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sedang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sulit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataajar_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `generatebanksoal_detail`
--

CREATE TABLE `generatebanksoal_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generatebanksoal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `generatebanksoal_jawaban`
--

CREATE TABLE `generatebanksoal_jawaban` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banksoaljawaban_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pilihan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `benarsalah` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generatebanksoal_detail_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generatebanksoal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomerinduk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `telp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `golongan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pendidikanterakhir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kategori_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nama`, `nomerinduk`, `jabatan`, `alamat`, `telp`, `jk`, `golongan`, `pendidikanterakhir`, `kategori_id`, `users_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Sri', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000', NULL, '2023-03-01 14:00:03', '2023-03-01 14:00:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inputnilai`
--

CREATE TABLE `inputnilai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nilai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siswa_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `materipokok_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `prefix`, `kode`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 'Kepala Sekolah', 'pegawai', NULL, NULL, '2023-03-01 14:00:04', '2023-03-01 14:00:04'),
(2, 'Administrator/Bendahara', 'pegawai', NULL, NULL, '2023-03-01 14:00:05', '2023-03-01 14:00:05'),
(3, 'Dana Bos', 'pemasukan', NULL, NULL, '2023-03-01 14:00:05', '2023-03-01 14:00:05'),
(4, 'Lain-lain', 'pemasukan', NULL, NULL, '2023-03-01 14:00:05', '2023-03-01 14:00:05'),
(5, 'Dana Bulanan', 'pengeluaran', NULL, NULL, '2023-03-01 14:00:05', '2023-03-01 14:00:05'),
(6, 'Lain-lain', 'pengeluaran', NULL, NULL, '2023-03-01 14:00:05', '2023-03-01 14:00:05'),
(7, 'Otomotif', 'jurusan', 'OTO', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(8, '1', 'semester', 'SATU', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(9, '2', 'semester', 'DUA', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(10, 'Teknik Jaringan dan Komputer', 'jurusan', 'TKJ', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(11, 'A. Muatan Nasional', 'tipepelajaran', 'A', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(12, 'B. Muatan kewilayahan', 'tipepelajaran', 'B', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(13, 'C1. Dasar Bidang Keahlian', 'tipepelajaran', 'C1', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(14, 'C2. Dasar Program Keahlian', 'tipepelajaran', 'C2', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(15, 'C3. Kompetensi Keahlian', 'tipepelajaran', 'C3', NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(16, 'Per Bulan', 'tipetagihan', NULL, NULL, '2023-03-01 14:00:08', '2023-03-01 14:00:08'),
(17, 'Per Semester', 'tipetagihan', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09'),
(18, 'Sekali', 'tipetagihan', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tingkatan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jurusan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `suffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guru_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `tingkatan`, `jurusan`, `suffix`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'X', 'OTO', '1', NULL, '2023-03-01 14:00:06', '2023-03-01 14:00:06'),
(2, 'X', 'TKJ', '1', NULL, '2023-03-01 14:00:06', '2023-03-01 14:00:06'),
(3, 'XI', 'OTO', '1', NULL, '2023-03-01 14:00:07', '2023-03-01 14:00:07'),
(4, 'XI', 'TKJ', '1', NULL, '2023-03-01 14:00:07', '2023-03-01 14:00:07'),
(5, 'XII', 'OTO', '1', NULL, '2023-03-01 14:00:07', '2023-03-01 14:00:07'),
(6, 'XII', 'TKJ', '1', NULL, '2023-03-01 14:00:07', '2023-03-01 14:00:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kko`
--

CREATE TABLE `kko` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kko`
--

INSERT INTO `kko` (`id`, `nama`, `tipe`, `keterangan`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pengetahuan', 'mudah', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09'),
(2, 'mengutip', 'mudah', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09'),
(3, 'menyebutkan', 'mudah', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09'),
(4, 'menjalaskan', 'mudah', NULL, NULL, '2023-03-01 14:00:09', '2023-03-01 14:00:09'),
(5, 'menggambar', 'mudah', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(6, 'menugaskan', 'sedang', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(7, 'mengurutkan', 'sedang', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(8, 'menentukan', 'sedang', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(9, 'menerapkan', 'sedang', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(10, 'menyesuaikan', 'sedang', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(11, 'mengatur', 'sulit', NULL, NULL, '2023-03-01 14:00:10', '2023-03-01 14:00:10'),
(12, 'mengabstraksi', 'sulit', NULL, NULL, '2023-03-01 14:00:11', '2023-03-01 14:00:11'),
(13, 'menganimasikan', 'sulit', NULL, NULL, '2023-03-01 14:00:11', '2023-03-01 14:00:11'),
(14, 'mengumpulkan', 'sulit', NULL, NULL, '2023-03-01 14:00:11', '2023-03-01 14:00:11'),
(15, 'mengkategorikan', 'sulit', NULL, NULL, '2023-03-01 14:00:11', '2023-03-01 14:00:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kompetensidasar`
--

CREATE TABLE `kompetensidasar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataajar_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kkm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tingkatan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tapel_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materipokok`
--

CREATE TABLE `materipokok` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `kompetensidasar_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
(31, '2021_11_11_215010_create_pembayaran_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siswa_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nominal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tglbayar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomerinduk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagihandetail_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('MKGRUpnAVVM7daLCRkqrysNAnM8EBawpFDWvpeZB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMXJhdGhEUnduak1JTFY5SEZxdXhqR0k2ZlM0WFhMeVRFV0xDcXlJNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO319', 1677679308);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_namapendek` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paginationjml` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lembaga_nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lembaga_jalan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lembaga_telp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lembaga_kota` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lembaga_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tapelaktif` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nominaltagihandefault` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moodleuser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moodlepass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passdefaultsiswa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passdefaultpegawai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passdefaultortu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sekolahlogo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sekolahttd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sekolahttd2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minimalpembayaranujian` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semesteraktif` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `app_nama`, `app_namapendek`, `paginationjml`, `lembaga_nama`, `lembaga_jalan`, `lembaga_telp`, `lembaga_kota`, `lembaga_logo`, `tapelaktif`, `nominaltagihandefault`, `moodleuser`, `moodlepass`, `passdefaultsiswa`, `passdefaultpegawai`, `passdefaultortu`, `sekolahlogo`, `sekolahttd`, `sekolahttd2`, `minimalpembayaranujian`, `semesteraktif`, `created_at`, `updated_at`) VALUES
(1, 'Nama App', 'St', '10', 'LEMBAGA PSIKOLOGI PELITA WACANA', 'Jl.Simpang Wilis 2 Kav. B', '0341-581777', 'Malang', 'assets/upload/logo.png', '2021/2022', '1000000', NULL, NULL, 'siswa123', '12345678', 'ortu123', '', 'Nama Kepala Sekolah M.Pd', 'Nama Kepala Sekolah M.Pd', '70', '1', '2023-03-01 14:00:04', '2023-03-01 14:00:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nomerinduk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tempatlahir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tgllahir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alamat` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `jk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kelas_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tapel_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moodleuser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moodlepass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siswafoto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `nomerinduk`, `agama`, `tempatlahir`, `tgllahir`, `alamat`, `jk`, `kelas_id`, `tapel_id`, `moodleuser`, `moodlepass`, `users_id`, `siswafoto`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Paijo', '123', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2001', NULL, NULL, '2023-03-01 14:00:01', '2023-03-01 14:00:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tingkatan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bln_awal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bln_akhir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagihan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihandetail`
--

CREATE TABLE `tagihandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kelas_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagihan_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tapel`
--

CREATE TABLE `tapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tapel`
--

INSERT INTO `tapel` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, '2021/2022', '2023-03-01 14:00:06', '2023-03-01 14:00:06'),
(2, '2020/2021', '2023-03-01 14:00:07', '2023-03-01 14:00:07'),
(3, '2021/2022', '2023-03-01 14:00:08', '2023-03-01 14:00:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipeuser` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomerinduk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `tipeuser`, `nomerinduk`, `username`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '1', 'admin', NULL, '$2y$10$.4P00CDHxIelpwoyPrJpIu9CKpYXA6DmFAfzxBWRyT2NfZ3p/GS9i', NULL, NULL, NULL, NULL, NULL, '2023-03-01 14:00:01', '2023-03-01 14:00:01'),
(2, 'Kepsek', 'kepsek@gmail.com', 'kepsek', '2', 'kepsek', NULL, '$2y$10$LlH6TKkxvsbVgKWGYj1/IuXe/azCeDJf.EBUNXrzRXfzP3QKEl5Iy', NULL, NULL, NULL, NULL, NULL, '2023-03-01 14:00:01', '2023-03-01 14:00:01'),
(2000, 'Sri', 'guru@gmail.com', 'guru', '3', 'guru', NULL, '$2y$10$0gf15L5YpUcXCvC7WRfdRetvNdDkyQsqv/h4d7TZUsV.EZhoQ4V.W', NULL, NULL, NULL, NULL, NULL, '2023-03-01 14:00:03', '2023-03-01 14:00:03'),
(2001, 'Paijo', 'siswa@gmail.com', 'siswa', '123', 'siswa', NULL, '$2y$10$9HIsf2k4ngvly/BPLgcoEOrtL0KnS1X95ui..MeeC2bPcT8IHs9C2', NULL, NULL, NULL, NULL, NULL, '2023-03-01 14:00:01', '2023-03-01 14:00:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banksoal`
--
ALTER TABLE `banksoal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `banksoaljawaban`
--
ALTER TABLE `banksoaljawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dataajar`
--
ALTER TABLE `dataajar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ekskul`
--
ALTER TABLE `ekskul`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ekskuldetail`
--
ALTER TABLE `ekskuldetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `generatebanksoal`
--
ALTER TABLE `generatebanksoal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `generatebanksoal_detail`
--
ALTER TABLE `generatebanksoal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `generatebanksoal_jawaban`
--
ALTER TABLE `generatebanksoal_jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inputnilai`
--
ALTER TABLE `inputnilai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kko`
--
ALTER TABLE `kko`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kompetensidasar`
--
ALTER TABLE `kompetensidasar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materipokok`
--
ALTER TABLE `materipokok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tagihandetail`
--
ALTER TABLE `tagihandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `banksoal`
--
ALTER TABLE `banksoal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `banksoaljawaban`
--
ALTER TABLE `banksoaljawaban`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dataajar`
--
ALTER TABLE `dataajar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ekskul`
--
ALTER TABLE `ekskul`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ekskuldetail`
--
ALTER TABLE `ekskuldetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `generatebanksoal`
--
ALTER TABLE `generatebanksoal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `generatebanksoal_detail`
--
ALTER TABLE `generatebanksoal_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `generatebanksoal_jawaban`
--
ALTER TABLE `generatebanksoal_jawaban`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `inputnilai`
--
ALTER TABLE `inputnilai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kko`
--
ALTER TABLE `kko`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kompetensidasar`
--
ALTER TABLE `kompetensidasar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `materipokok`
--
ALTER TABLE `materipokok`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tagihandetail`
--
ALTER TABLE `tagihandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
