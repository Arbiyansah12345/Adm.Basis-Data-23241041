

use pti_mart;

-- 1
-- memunculkan kode pelanggan, nama produk, jumlah, harga, dan total dari semua produk yang pernah di transaksikan namun output 
-- yang yang dimina adalah total harga minimal 200.000 dan diurutkan berdasarkan total harga terkecil
SELECT 
    t.kode_pelanggan,
    p.nama_produk,
    t.qty AS jumlah,
    t.harga,
    (t.qty * t.harga) AS total_harga
FROM tr_penjualan t
JOIN ms_produk p ON t.kode_produk = p.kode_produk
WHERE (t.qty * t.harga) >= 200000
ORDER BY total_harga ASC;

-- 2
-- tampilkan nama pelanggan dan nilai transaksinya dengan nilai transaksi terbesar
SELECT p.nama_pelanggan, total_transaksi
FROM (
    SELECT 
        t.kode_pelanggan,
        SUM(t.qty * t.harga) AS total_transaksi
    FROM tr_penjualan t
    GROUP BY t.kode_pelanggan
) AS transaksi
JOIN ms_pelanggan p ON transaksi.kode_pelanggan = p.kode_pelanggan
WHERE total_transaksi = (
    SELECT MAX(total)
    FROM (
        SELECT 
            kode_pelanggan,
            SUM(qty * harga) AS total
        FROM tr_penjualan
        GROUP BY kode_pelanggan
    ) AS total_per_pelanggan
);

-- 3
-- tampilkan nama produk, kategori dan harga dari produk yang tidak pernah terjual
SELECT 
    p.nama_produk,
    p.kategori_produk,
    p.harga
FROM ms_produk p
WHERE p.kode_produk NOT IN (
    SELECT DISTINCT t.kode_produk
    FROM tr_penjualan t
);



