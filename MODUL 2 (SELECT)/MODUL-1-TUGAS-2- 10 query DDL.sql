CREATE DATABASE toko_kue;
USE toko_kue;

-- TABEL PELANGGAN
CREATE TABLE PELANGGAN (
    id_pelanggan VARCHAR(10),
    nama VARCHAR(100),
    tanggal_lahir DATETIME,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    no_hp VARCHAR(15)
);

-- TABEL KUE
CREATE TABLE KUE (
    id_kue VARCHAR(10),
    nama_kue VARCHAR(50),
    varian_rasa VARCHAR(50),
    ukuran VARCHAR(25),
    warna VARCHAR(30),
    harga INT,
    kategori_kue VARCHAR(50)
);

-- TABEL KARYAWAN
CREATE TABLE KARYAWAN (
    id_karyawan VARCHAR(10),
    nama VARCHAR(100),
    tanggal_lahir DATETIME,
    email VARCHAR(100),
    no_hp VARCHAR(15),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan')
);

-- TABEL PENGIRIMAN
CREATE TABLE PENGIRIMAN (
    no_pelacakan VARCHAR(50),
    id_karyawan VARCHAR(10),
    id_pelanggan VARCHAR(10),
    status_pengiriman VARCHAR(50),
    jasa_pengiriman VARCHAR(100),
    metode_pengiriman VARCHAR(50),
    tgl_waktu_pengiriman DATETIME,
    nama VARCHAR(100)
);

-- TABEL PEMBELIAN
CREATE TABLE PEMBELIAN (
    id_pembelian VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_kue VARCHAR(10),
    tanggal_beli DATETIME
);

-- RELASI antara PEMBELIAN dan PELANGGAN
ALTER TABLE PEMBELIAN
ADD CONSTRAINT fk_pembeli_pelanggan
FOREIGN KEY (id_pelanggan) REFERENCES PELANGGAN(id_pelanggan);

-- RELASI antara PEMBELIAN dan KUE
ALTER TABLE PEMBELIAN
ADD CONSTRAINT fk_pembelian_kue
FOREIGN KEY (id_kue) REFERENCES KUE(id_kue);

-- RELASI antara PENGIRIMAN dan PELANGGAN
ALTER TABLE PENGIRIMAN
ADD CONSTRAINT fk_pengiriman_pelanggan
FOREIGN KEY (id_pelanggan) REFERENCES PELANGGAN(id_pelanggan);

-- RELASI antara PENGIRIMAN dan KARYAWAN
ALTER TABLE PENGIRIMAN
ADD CONSTRAINT fk_pengiriman_karyawan
FOREIGN KEY (id_karyawan) REFERENCES KARYAWAN(id_karyawan);

-- Data Pelanggan
INSERT INTO PELANGGAN (id_pelanggan, nama, tanggal_lahir, jenis_kelamin, no_hp) 
VALUES ('C001', 'M.Fathih Al-Azzam', '2004-05-12', 'Laki-laki', '081234567890'),
('C002', 'Siti Aminah', '1995-08-20', 'Perempuan', '082134567891'),
('C003', 'Maulana Ihsan', '2005-02-15', 'Laki-laki', '083134567892'),
('C004', 'Dewi Lestari', '1993-07-10', 'Perempuan', '084134567893'),
('C005', 'Rizal', '2006-11-25', 'Laki-laki', '085134567894');

-- Data Kue
INSERT INTO KUE (id_kue, nama_kue, varian_rasa, ukuran, warna, harga, kategori_kue) 
VALUES ('K001', 'Kue Ulang Tahun', 'Cokelat', 'Large', 'Cokelat', 250000, 'Kue Spesial'),
('K002', 'Cupcake', 'Vanila', 'Small', 'Putih', 15000, 'Kue Mini'),
('K003', 'Brownies', 'Cokelat', 'Medium', 'Cokelat', 50000, 'Kue Basah'),
('K004', 'Cheesecake', 'Keju', 'Medium', 'Kuning', 75000, 'Kue Dingin'),
('K005', 'Donat', 'Strawberry', 'Small', 'Merah Muda', 10000, 'Kue Goreng');

-- Data Karyawan
INSERT INTO KARYAWAN (id_karyawan, nama, tanggal_lahir, email, no_hp, jenis_kelamin) 
VALUES ('K001', 'M. Sahrul Azam', '2005-04-14', 'sahrul@tokokue.com', '081234500001', 'Laki-laki'),
('K002', 'Ilham Parhadi', '2004-03-10', 'ilham@tokokue.com', '081234500002', 'Laki-laki'),
('K003', 'Haeril Rapli', '2004-06-21', 'haeril@tokokue.com', '081234500003', 'Laki-laki'),
('K004', 'Arbiyan', '2005-09-13', 'arbi@tokokue.com', '081234500004', 'Laki-laki'),
('K005', 'Lalu Masuud', '2005-01-30', 'masuud@tokokue.com', '081234500005', 'Laki-laki');

-- Data Pengiriman
INSERT INTO PENGIRIMAN (no_pelacakan, id_karyawan, id_pelanggan, status_pengiriman, jasa_pengiriman, metode_pengiriman, tgl_waktu_pengiriman, nama) 
VALUES ('TRX001', 'K001', 'C001', 'Terkirim', 'JNE', 'Reguler', '2025-04-01 10:00:00', 'M.Fathih Al-Azzam'),
('TRX002', 'K002', 'C002', 'Dalam Perjalanan', 'J&T Express', 'Ekspres', '2025-04-03 15:00:00', 'Siti Aminah'),
('TRX003', 'K003', 'C003', 'Terkirim', 'SiCepat', 'Reguler', '2025-04-04 09:00:00', 'Maulana Ihsan'),
('TRX004', 'K004', 'C004', 'Dikemas', 'Ninja Xpress', 'Same Day', '2025-04-05 13:30:00', 'Dewi Lestari'),
('TRX005', 'K005', 'C005', 'Terkirim', 'Pos Indonesia', 'Reguler', '2025-04-06 11:45:00', 'Rizal');

-- Data Pembelian
INSERT INTO PEMBELIAN (id_pembelian, id_pelanggan, id_kue, tanggal_beli) 
VALUES ('B001', 'C001', 'K001', '2025-04-01 09:00:00'),
('B002', 'C002', 'K002', '2025-04-02 11:30:00'),
('B003', 'C003', 'K003', '2025-04-03 14:15:00'),
('B004', 'C004', 'K004', '2025-04-04 12:00:00'),
('B005', 'C005', 'K005', '2025-04-05 16:20:00');

-- Cek semua datakuekuekue
SELECT * FROM PELANGGAN;
SELECT * FROM KUE;
SELECT * FROM KARYAWAN;
SELECT * FROM PENGIRIMAN;
SELECT * FROM PEMBELIAN;

-- Mengambil semua data nama pelanggan dari tabel PELANGGAN.
SELECT nama FROM PELANGGAN;

-- Menampilkan daftar semua nama kue yang ada di tabel KUE.
SELECT nama_kue FROM KUE;

-- Menampilkan semua data karyawan yang berjenis kelamin Laki-laki.
SELECT * FROM KARYAWAN WHERE jenis_kelamin = 'Laki-laki';

-- Menampilkan nama dan nomor HP dari pelanggan perempuan saja.
SELECT nama, no_hp FROM PELANGGAN WHERE jenis_kelamin = 'Perempuan';

-- Menampilkan nama kue dan harga untuk kue yang harganya lebih dari 50.000.
SELECT nama_kue, harga FROM KUE WHERE harga > 50000;

-- Menampilkan nama dan email dari karyawan yang lahir sebelum tahun 2005.
SELECT nama, email FROM KARYAWAN WHERE tanggal_lahir < '2005-01-01';

-- Menghitung jumlah total transaksi pembelian yang tercatat di tabel PEMBELIAN.
SELECT COUNT(*) AS jumlah_pembelian FROM PEMBELIAN;

-- Menampilkan nama pelanggan dan jasa pengiriman untuk pengiriman yang statusnya 'Terkirim'.
SELECT nama, jasa_pengiriman FROM PENGIRIMAN WHERE status_pengiriman = 'Terkirim';

-- Menampilkan nama kue dan harga, diurutkan dari harga tertinggi ke terendah.
SELECT nama_kue, harga FROM KUE ORDER BY harga DESC;

-- Menampilkan nama pelanggan, nama kue, dan tanggal pembelian berdasarkan relasi antar tabel PEMBELIAN, PELANGGAN, dan KUE.
SELECT PELANGGAN.nama, KUE.nama_kue, PEMBELIAN.tanggal_beli
FROM PEMBELIAN
JOIN PELANGGAN ON PEMBELIAN.id_pelanggan = PELANGGAN.id_pelanggan
JOIN KUE ON PEMBELIAN.id_kue = KUE.id_kue;
