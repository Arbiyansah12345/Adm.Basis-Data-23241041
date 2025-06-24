-- nama : muhammad arbiyan saputra
-- nim : 23241041
-- kelas : B

-- menggunakan datbase
USE pti_mart;
-- join
-- menaggabungkan dua buah tabel berdasarkan kolom yang sama

-- praktek 1
-- ambil nama pelanggan yang pernah bertrasnsaksi
-- artinya ambil kolom  kode_pelanggan, nama_pelanggan, dan qty dari
-- penggabungan tbale penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- praktek 2
-- mengabungkan dua tabel tanpa memperhatikan relation  keys
-- ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- menggabungkan tabel penjualan dan tabel pelanggan tanpa memperhatikan kolom yang menjadi primery key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INTER JOIN
-- join yang mengambil dari dua sisi tabel yang berhubungan
-- Praktek 3
-- ambil kode pelanggan, nama produk, qty
-- dari hasil join tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

USE PTI_MART;

-- 1. INNER JOIN ke-3 tabel  Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT 
    p.nama_pelanggan,
    pr.nama_produk,
    t.qty,
    t.harga,
    t.diskon_persen
FROM 
    tr_penjualan AS t
INNER JOIN 
    ms_pelanggan AS p ON t.kode_pelanggan = p.kode_pelanggan
INNER JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk;

-- 2. LEFT JOIN + IS NOT NULL Buatlah join untuk ketiga table dengan 
-- urutan ms_pelanggan, tr_penjualan, dan ms_produk... filter untuk qty yang tidak bernilai NULL
SELECT 
    p.nama_pelanggan,
    t.kode_transaksi,
    pr.nama_produk,
    t.qty
FROM 
    ms_pelanggan AS p
LEFT JOIN 
    tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk
WHERE 
    t.qty IS NOT NULL;
 --  3. INNER JOIN + GROUP BY kategori produk + SUM qty INNER JOIN, kemudian 
 -- tampilkan grouping untuk kolom kategori produk dan penjumlahan qty
 SELECT 
    pr.kategori_produk,
    SUM(t.qty) AS total_qty
FROM 
    tr_penjualan AS t
INNER JOIN 
    ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY 
    pr.kategori_produk;

 -- 4. Latihan Khusus – JOIN ms_produk dengan ms_produk JOIN ms_produk 
 -- dengan dirinya sendiri lewat kode_produk, gunakan alias
 SELECT a.kode_produk, a.nama_produk, b.nama_produk AS produk_alias
FROM ms_produk a
JOIN ms_produk b ON a.kode_produk = b.kode_produk;