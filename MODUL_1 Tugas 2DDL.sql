-- 1. Membuat database
CREATE DATABASE IF NOT EXISTS jual_kue;
USE jual_kue;

-- 2. Membuat tabel
CREATE TABLE pemilik_toko (
    id_toko INT PRIMARY KEY AUTO_INCREMENT,
    nama_toko VARCHAR(100),
    email VARCHAR(100),
    no_tlpn VARCHAR(20),
    alamat TEXT
);

CREATE TABLE karyawan (
    id_penjual INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    email VARCHAR(100),
    alamat TEXT,
    no_hp VARCHAR(20),
    id_toko INT,
    FOREIGN KEY (id_toko) REFERENCES pemilik_toko(id_toko)
);

CREATE TABLE kue (
    id_barang INT PRIMARY KEY AUTO_INCREMENT,
    harga_kue DECIMAL(10,2),
    stok INT,
    harga DECIMAL(10,2),
    id_penjual INT,
    FOREIGN KEY (id_penjual) REFERENCES karyawan(id_penjual)
);

CREATE TABLE pembeli (
    id_pembeli INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    no_hp VARCHAR(20),
    alamat TEXT,
    email VARCHAR(100)
);

CREATE TABLE membeli (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pembeli INT,
    id_barang INT,
    jumlah_barang INT,
    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli),
    FOREIGN KEY (id_barang) REFERENCES kue(id_barang)
);

-- 3. Insert data
INSERT INTO pemilik_toko (nama_toko, email, no_tlpn, alamat) VALUES
('Toko Kue Manis', 'tokomanis@gmail.com', '081234567890', 'Jl. Mawar No. 12, Jakarta'),
('Kue Enak Selalu', 'kueenak@gmail.com', '082345678901', 'Jl. Melati No. 8, Bandung');

INSERT INTO karyawan (nama, email, alamat, no_hp, id_toko) VALUES
('Dewi Lestari', 'dewi@gmail.com', 'Jl. Mawar No. 15, Jakarta', '081212345678', 1),
('Andi Prasetyo', 'andi@gmail.com', 'Jl. Melati No. 10, Bandung', '082298765432', 2);

INSERT INTO kue (harga_kue, stok, harga, id_penjual) VALUES
(20000, 30, 20000, 1),
(25000, 20, 25000, 2),
(15000, 50, 15000, 1);

INSERT INTO pembeli (nama, no_hp, alamat, email) VALUES
('Rina Sari', '081390123456', 'Jl. Anggrek No. 5, Jakarta', 'rina@gmail.com'),
('Budi Santoso', '082134567890', 'Jl. Kenanga No. 7, Bandung', 'budi@gmail.com');

INSERT INTO membeli (id_pembeli, id_barang, jumlah_barang) VALUES
(1, 1, 2),
(2, 2, 1),
(1, 3, 5);

-- 4. Menampilkan hasil gabungan semua data
SELECT 
    pt.nama_toko,
    pt.email AS email_toko,
    pt.no_tlpn AS telp_toko,
    pt.alamat AS alamat_toko,
    
    k.id_penjual,
    k.nama AS nama_penjual,
    k.email AS email_penjual,
    k.no_hp AS no_hp_penjual,
    k.alamat AS alamat_penjual,
    
    ku.id_barang,
    ku.harga_kue,
    ku.stok,
    
    p.id_pembeli,
    p.nama AS nama_pembeli,
    p.no_hp AS no_hp_pembeli,
    p.alamat AS alamat_pembeli,
    p.email AS email_pembeli,
    
    m.jumlah_barang,
    (ku.harga_kue * m.jumlah_barang) AS total_harga
FROM membeli m
JOIN pembeli p ON m.id_pembeli = p.id_pembeli
JOIN kue ku ON m.id_barang = ku.id_barang
JOIN karyawan k ON ku.id_penjual = k.id_penjual
JOIN pemilik_toko pt ON k.id_toko = pt.id_toko;