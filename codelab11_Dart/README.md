# Praktikum Codelab_11: Pemrograman Asynchronous

| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |

---

# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru
![Langkah](./img/1-1.png)

Tambahkan dependensi http
![Langkah](./img/1.png)

## Langkah 2: Cek file `pubspec.yaml`
![Langkah](./img/1-2.png)

## Langkah 3: `main.dart`
**SOAL 1**
Nama Panggilan : Nisa
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo by Nisa', 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}
```

## Langkah 4: Tambah method getData()
**Soal 2: Kode buku** :
![Langkah](./img/1-3.png)

method:
```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/B1mxDwAAQBAJ'; 
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```
**Hasil JSON**
![Langkah](./img/1-4.png)

## Langkah 5: Tambah kode di ElevatedButton
```dart
ElevatedButton(
  child: Text('GO!'),
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
      result = value.body.toString().substring(0, 450);
      setState(() {});
    }).catchError((_) {
      result = 'An error occurred';
      setState(() {});
    });
  },
),
```

## Hasil
![Langkah](./img/1-hasil.png)

**Soal 3**
1.  Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
- `then((value) { ... })`
    Bagian ini akan dijalankan setelah permintaan HTTP berhasil diselesaikan.
    value di sini adalah Response dari http.get() yang berisi data JSON buku dari Google Books API.
- `substring(0, 450)`
    Kode ini memotong hasil JSON agar tidak terlalu panjang ketika ditampilkan di layar. Artinya hanya 450 karakter pertama dari value.body yang ditampilkan ke UI. Tanpa substring, teks JSON-nya bisa ribuan karakter dan bisa bikin tampilan UI overload atau lag
- `catchError((_) { ... })`
    Bagian ini menangani error ketika request gagal, misalnya: Tidak ada koneksi internet, URL API salah, Timeout atau status code 404. Jika terjadi error, teks yang ditampilkan di layar adalah "An error occurred".
- `setState(() {})`
    Dipanggil untuk memberi tahu Flutter bahwa ada data baru (result) sehingga UI perlu rebuild dan menampilkan hasil terkini.

2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
![Langkah](./img/1.gif)