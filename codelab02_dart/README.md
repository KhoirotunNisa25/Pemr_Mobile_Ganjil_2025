# Tugas Pemrograman Mobile - Codelab2

## Soal 2
**Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter?**
1. Flutter dibangun menggunakan Dart: Semua kode aplikasi Flutter ditulis dengan Dart. Jika tidak memahami dasar-dasar Dart, kita akan kesulitan menulis, membaca, dan memodifikasi kode Flutter.
2. Sintaks dan struktur program: Pengetahuan tentang variabel, fungsi, class, dan konsep OOP di Dart memudahkan dalam membangun aplikasi dengan struktur yang baik di Flutter.
3. Pemanfaatan fitur Dart: Fitur-fitur seperti Null Safety, async/await, dan collections sangat sering digunakan dalam aplikasi Flutter untuk menangani data, proses asynchronous, dan keamanan tipe data.
4. Debugging & Error Handling: Memahami Dart membantu dalam proses debugging dan penanganan error, sehingga aplikasi bisa berjalan lebih stabil.
5. Produktivitas & Efisiensi: Dengan memahami Dart, proses pengembangan menjadi lebih cepat, efisien, dan mudah beradaptasi terhadap perubahan atau penambahan fitur.

## Soal 3
**Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.**
1. Tujuan & Sejarah
    - Dart dibuat untuk menggabungkan kelebihan bahasa tingkat tinggi dengan fitur modern.
    - Diluncurkan 2011, versi stabil 2013, dan rilis besar Dart 2.0 pada 2018. 
    - Awalnya untuk web (pengganti JavaScript), kini fokus ke mobile (Flutter).
2. Fitur Utama
    - Productive tooling: IDE, plugin, ekosistem paket.
    - Garbage collection: otomatis kelola memori.
    - Type annotations opsional tapi tetap type-safe (statically typed).
    - Portability: bisa dikompilasi ke JavaScript, ARM, x86.
    - Hot reload: berkat JIT compiler, cepat untuk development.
3. Eksekusi Dart
    - Bisa lewat Dart VM atau dikompilasi ke JavaScript.
    - Mode eksekusi:
        a. JIT (Just-In-Time) → untuk development, mendukung debugging & hot reload.
        b. AOT (Ahead-Of-Time) → performa tinggi untuk production, tapi tanpa hot reload.
4. Konsep OOP
    - Dart adalah object-oriented dengan fitur: encapsulation, inheritance, abstraction, polymorphism.
    - Semua tipe data adalah objek (tidak ada primitive).
5. Operator di Dart
    - Aritmatika: + - * / ~/ %
    - Increment/Decrement: ++ --
    - Equality/Relational: == != > < >= <=
    - Logical: ! || &&
    - Operator == membandingkan isi, bukan referensi (berbeda dengan Java).
6. Pemrograman Dasar
    - Program Dart dimulai dari function main().
    - void main() { ... } → titik awal eksekusi.
    - Function: di luar class.
    - Method: terikat pada class dengan akses this.
7. DartPad
    - Editor online untuk belajar dan mencoba Dart: dartpad.dev
    - Mendukung core library Dart (kecuali library VM seperti dart:io).

## Soal 4
**RBuatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !**
1. Null Safety:
    Null Safety adalah fitur Dart yang memastikan variabel tidak bisa bernilai null secara tidak sengaja. Dengan Null Safety, variabel tanpa tanda tanya (?) tidak boleh bernilai null, sedangkan variabel dengan tanda tanya (?) diizinkan untuk bernilai null.
2. Late Variable:
    Keyword late digunakan untuk mendeklarasikan variabel yang nilainya baru akan diinisialisasi nanti, tapi kita yakin akan diisi sebelum digunakan. Jika variabel late digunakan sebelum diinisialisasi, maka akan terjadi error.