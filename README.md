# Employee Directory App (Tugas)

Proyek ini adalah aplikasi direktori profil karyawan yang dibangun menggunakan Flutter. Aplikasi ini mencakup desain modern layaknya brosur bisnis (Business Flyer) yang rapi dan profesional, lengkap dengan efek interaktif.

---

## Panduan Setup Project

1. **Buat Repository**
   Buka github dan add repository

2. **Create New Flutter project**
   Pastikan Anda sudah menginstal [Flutter SDK]
   Lalu pencet ctrl+shift+p dan pilih Flutter: New Project

---

## Perintah untuk Menjalankan Server Lokal (Aplikasi)

- **Menjalankan di Browser (Chrome Web):**
  ```bash
  flutter run -d chrome
  ```

---

## Cara Melakukan Import Database MySQL

1. **Nyalakan Server Database**
   Buka aplikasi **Laragon** (atau sejenisnya), kemudian klik Start.
2. **Buka phpMyAdmin**
   Buka browser Anda dan akses `http://localhost/phpmyadmin`.
3. **Proses Import**
   - Pada bagian _File to import_, klik tombol **Choose File** (Pilih File).
   - Cari file ekstensi `.sql` yang telah disediakan.
   - Gulir ke paling bawah halaman, kemudian klik tombol **Import** atau **Go**.
4. **Sesuaikan Konfigurasi**
   Pastikan kredensial koneksi di script backend Anda sudah menggunakan detail lokal:
   - Host: `localhost`
   - User: `root`
   - Password: `(kosong)`
   - DB Name: `db_amril_tugas`
