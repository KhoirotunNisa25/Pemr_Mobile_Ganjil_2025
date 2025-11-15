# Praktikum Codelab_12: Lanjutan State Management dengan Streams

| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |

---

# Praktikum 1: Dart Streams

## Langkah 1: Buat Project Baru
![Langkah](./img/1-1.png)

## Langkah 2-6
**`main.dart`**
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Nisa', // soal 1
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

**`stream.dart`**
```dart
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    // Soal 2
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.indigo,
    Colors.pink,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}
```

**Soal 3**
1. Jelaskan fungsi keyword yield* pada kode tersebut!
    
    `yield*` digunakan untuk menghasilkan nilai dari stream lain secara langsung. `yield*` mengambil seluruh output dari Stream lain dan meneruskannya ke Stream yang sedang berjalan.
2. Apa maksud isi perintah kode tersebut?

    Kode tersebut membuat stream yang:
    - Mengirim satu warna setiap 1 detik
    - Warna diambil dari list colors
    - Loop warna terus-menerus dengan rumus `index = t % jumlah_warna`

## Langkah 7 - 12
`main.dart
```dart
import 'package:flutter/material.dart';
import 'stream.dart';
...

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }
  
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
      ),
    );
  }
}

```

**Soal 4**
![alt text](img/1.gif)

## Langkah 13
```dart
class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
```
**Hasil**
![alt text](img/1-1.gif)

**Soal 5**
Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

- `listen` : Berjalan sebagai callback yang tidak menghalangi eksekusi program. Stream berjalan di “samping”, dan setiap event dipanggil lewat listener. Cocok untuk UI, reaktif, dan tidak butuh blocking.
- `await for` : Menunggu event stream satu per satu secara synchronous dalam konteks async. Eksekusi akan menunggu sampai stream mengirim event berikutnya. Cocok bila ingin pemrosesan berurutan dan blocking di dalam fungsi async.

---

# Praktikum 2: Stream controllers dan sinks
## Langkah 1-12
**Kode**
`main.dart`
```dart
class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;

  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
```

`stream.dart`
```dart
class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close(){
    controller.close();
  }
}
```

**Soal**
Jelaskan maksud kode langkah 8 dan 10 tersebut!
- Kode pada langkah 8 tersebut membuat stream angka, lalu langsung menghubungkannya dengan UI. Controller diambil untuk mendapatkan aliran datanya, kemudian stream tersebut dipantau dengan `listen`. Setiap kali stream mengirim angka baru, nilai `lastNumber` diperbarui melalui `setState`, sehingga tampilan ikut berubah secara otomatis mengikuti data yang masuk.
- Method pada langkah 10 tersebut akan membuat sebuah angka acak 0–9 menggunakan `Random`, lalu mengirimkan angka tersebut ke stream melalui `addNumberToSink()`. Jadi setiap kali method ini dipanggil, stream akan menerima angka baru yang dihasilkan secara acak.

**Hasil**
![alt text](img/2.gif)

## Langkah 13-15
`stream.dart`
```dart
  addError() {
    controller.sink.addError("Error");
  }
```
`main.dart`
```dart
  void addRandomNumber() {
    Random random = Random();
    // int myNum = random.nextInt(10);
    // numberStream.addNumberToSink(myNum);
    numberStream.addError();
  }
  ...

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    }).onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });
    super.initState();
  }
```

**Soal7**
Jelaskan maksud kode langkah 13 sampai 15 tersebut!
- Menambahkan method addError() yang memasukkan error ke stream lewat controller.sink.addError(). Hal ini akan membuat stream memancarkan event error, bukan angka.
- Pada listen, ditambah handler onError. Ketika stream mengirim error, UI tidak crash, tetapi lastNumber diubah menjadi -1 sebagai tanda bahwa terjadi error.
- Method addRandomNumber() diubah supaya tidak lagi mengirim angka acak, tetapi memicu error dengan memanggil addError().

Hasil akhirnya: setiap tombol/aksi yang memanggil method ini akan mengirim error ke stream, dan UI akan merespons dengan menampilkan nilai -1.

**Hasil**
![alt text](img/2-1.gif)

