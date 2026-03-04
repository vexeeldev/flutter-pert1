# Laporan Praktikum: Flutter Counter App Plus
**Mata Kuliah:** Workshop Aplikasi Perangkat Bergerak  
**Mahasiswa:** Malakul Kabir Arrabbani  
**NRP:** 3124521031  
**Instansi:** Politeknik Elektronika Negeri Surabaya (PENS)

---

## 📝 Deskripsi Proyek
Proyek ini adalah aplikasi mobile berbasis **Flutter** yang dikembangkan untuk memahami konsep dasar *State Management* (StatefulWidget). Aplikasi ini memiliki fungsi utama untuk memanipulasi nilai angka melalui interaksi tombol tambah, kurang, dan reset.

## 📸 Tampilan Aplikasi
> **Catatan:** Masukkan screenshot aplikasi kamu di bawah ini agar laporan lebih jelas.

|  |  |
| :---: | :---: |
| ![](/image.png) | ![](/increment.png) |
|      |     mmm   |

---

## 🛠️ Penjelasan Teknis
Aplikasi ini dibangun menggunakan komponen-komponen utama Flutter sebagai berikut:

### 1. State Management (`StatefulWidget`)
Karena aplikasi memerlukan perubahan data di layar secara dinamis (angka yang berubah), maka digunakan `StatefulWidget`. Perubahan nilai variabel `_counter` dibungkus di dalam fungsi `setState()`. Fungsi ini memberitahu Flutter untuk membangun ulang (rebuild) UI dengan nilai terbaru.

### 2. Logika Operasi
Terdapat tiga fungsi utama yang menangani logika matematika:
* **`_incrementCounter`**: Menggunakan operator `++` untuk menambah nilai.
* **`_decrementCounter`**: Menggunakan operator `--` untuk mengurangi nilai.
* **`_resetAngka`**: Langsung memberikan nilai `0` pada variabel `_counter`.

### 3. Layouting & UI
* **`Scaffold`**: Menyediakan struktur dasar halaman (AppBar dan Body).
* **`Row` & `SizedBox`**: Digunakan pada `floatingActionButton` untuk menyusun tiga tombol secara horizontal dengan jarak antar tombol sebesar 15 pixel agar tidak menempel.
* **`ThemeData`**: Menggunakan *Material 3* dengan skema warna *Deep Purple* untuk estetika modern.

---

## 📜 Cuplikan Kode Utama
```dart
// Logika yang digunakan untuk merubah state
void _decrementCounter() {
  setState(() {
    _counter--; 
  });
}

void _resetAngka(){
  setState(() {
    _counter = 0;
  });
}web
