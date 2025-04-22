-- nama : m arbiyan saputra
-- Nim : 23241041
-- Kelas : B 
-- Modul : 2 (SELECT)

-- Membuat database
CREATE DATABASE pti_mart;

-- Menggunakan database
USE pti_mart;

-- cej kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- SELECT
-- Menggunakan SELECT unutk 1 tabel
-- Mengambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_prdouk;

-- Mengambil lebih dari satu kolom daei sebuah tabel
SELECT nama_produk, harga FROM ms_prdouk;

-- Mengambil semua kolom dari sebuah tabel
SELECT * FROM ms_produk;

-- latihan
-- mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama produk FROM ms_produk;

-- mengambil seluruh kolom dari seluruh tabel penjualan
SELECT * FROM tr_penjualan;

-- PREFIX dan ALIAS
-- PREFIX, bagian objek database yang hirarkinya lebih tinggi
-- Menggunakan PREFIX nama tabel untuk kolom nama_produk dari tabel produk
SELECT ms_produk.nama_produk FROM ms_produk;

-- Menggunakan nama database dan tabel sebagai prefix untuk kolom nama_prdouk
SELECT pti_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS,nama sementara untuk objek database
-- Mengganti sementara kolom nama_prdouk dengan ALIAS
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti sementara tabel dengan ALIAS
SELECT nama_produk FROM ms_produk AS msp;

-- kombinasikan PREFIX dan ALIAS
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
SELECT nama-pelanggan FROM ms_produk;

-- CASE 2 
SELECT ms_produk FROM nama_produk;