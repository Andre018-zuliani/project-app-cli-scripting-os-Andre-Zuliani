# Video Presentasi: https://youtu.be/B-4rdE9mNW8 

# 📌 Aplikasi Pengelola Data Sederhana (Bash CLI)
# 📝 Deskripsi Project
### Aplikasi ini adalah program Command Line Interface (CLI) sederhana yang dibangun menggunakan Bash Scripting di lingkungan Linux/Ubuntu.
### Program ini berfungsi sebagai pengelola data dasar (CRUD: Create, Read, Update, Delete) yang mendukung penambahan data, melihat data, mengedit data, dan menghapus data.
### Project ini dibuat untuk memenuhi tugas Backend Golang Batch 3 - Bash Scripting.

# 🚀 Fitur Utama

## Tambah Data
Pengguna dapat memasukkan nama, dan aplikasi akan otomatis memberi ID unik.

## Lihat Data
Menampilkan seluruh data yang tersimpan dalam array.

## Edit Data
Mengubah nama data berdasarkan ID.

## Hapus Data
Menghapus data berdasarkan ID dengan reindex otomatis.

## Auto Increment ID
ID akan bertambah otomatis, mencegah duplikasi dan input manual.

## Validasi Input
ID harus angka, nama tidak boleh kosong.

## Tampilan Berwarna (ANSI Color)
Output lebih rapi dan mudah dibaca.

# 🛠️ Teknologi yang Digunakan

## Bash Scripting

## ANSI Color Code

## Array & String Handling

## Control Flow (condition & loop)

## Function dengan parameter

# 📂 Struktur Data

## Aplikasi menggunakan dua array:

### data_ids=()     # Menyimpan ID
### data_names=()   # Menyimpan Nama


# ID dibuat otomatis menggunakan:

### current_id=1

# 📜 Cara Menjalankan Program
# 1️⃣ Pastikan file memiliki permission execute
chmod +x App.sh

# 2️⃣ Jalankan aplikasi
./App.sh

# 📌 Menu Aplikasi

### Setelah program berjalan, pengguna akan melihat menu:

# APLIKASI PENGELOLA DATA
1. Tambah Data
2. Lihat Data
3. Edit Data
4. Hapus Data
0. Keluar

# 🔧 Penjelasan Fungsi Utama
1. add_data()

Meminta input nama

Melakukan validasi input

Menambahkan ID & Nama ke array

Menaikkan ID otomatis

Menampilkan pesan sukses

2. view_data()

Menampilkan seluruh data dalam array

Menolak jika belum ada data

3. edit_data()

Meminta input ID

Mencari ID dalam array

Mengubah nama jika ditemukan

4. delete_data()

Meminta input ID

Menghapus data pada index tersebut

Reindex array agar tidak bolong

5. show_menu()

Menampilkan menu interaktif

📊 Contoh Output Program
Tambah Data
Masukkan Nama: Ronal
Data berhasil ditambahkan! (ID = 1)

Lihat Data
DAFTAR DATA:
ID: 1 | Nama: Ronal
ID: 2 | Nama: Dennis

Edit Data
Masukkan ID yang ingin diedit: 1
Masukkan Nama baru: Ronaldo
Data berhasil diperbarui!

Hapus Data
Masukkan ID yang ingin dihapus: 2
Data berhasil dihapus!

# 📌 Ketentuan Tugas yang Sudah Terpenuhi

* Operator
* Variabel
* Function (lebih dari 3)
* Function dengan parameter
* Array
* String
* Input & Output
* Perulangan
* Kondisi (IF/ELSE & CASE)
* Flow Sequensial
* Validasi Input
* ANSI Escape Code (warna)
* Program CLI interaktif

# 👤 Pembuat

Andre Zuliani
Backend Golang Batch 3
Aplikasi CLI Sederhana — Bash Scripting
