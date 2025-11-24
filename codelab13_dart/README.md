# Praktikum Codelab_12: Lanjutan State Management dengan Streams

| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |

---

# Praktikum 1: Dart Streams

## Langkah 1: Buat Project Baru
![Langkah](./img/1-1.png)

## langkah 2: `main.dart`
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo Nisa',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Nisa')),
      body: Container(),
    );
  }
}
```

*Soal 1*
1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
2. Gantilah warna tema aplikasi sesuai kesukaan Anda.
3. Lakukan commit hasil jawaban Soal 1 dengan pesan "W13: Jawaban Soal 1"

## Langkah 3-10

`main.dart`

```dart
class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  
  @override
  void initState() {
    super.initState();
    readJsonFile();
  }
  
  Future readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    setState(() {
      pizzaString = myString;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Nisa')),
      body: Text(pizzaString),
    );
  }
}
```

`pubspec.yaml`
```dart
  assets:
    - assets/
```

`pizzalist.json`

![alt text](img/1-2.png)

**Hasil**

![alt text](img/1-3.png)

**Soal 2**
1. Masukkan hasil capture layar ke laporan praktikum Anda.
2. Lakukan commit hasil jawaban Soal 2 dengan pesan "W13: Jawaban Soal 2"

## Langkah 11-22

`lib/model/pizza.dart`
```dart
class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pizzaName = json['pizzaName'],
        description = json['description'],
        price = (json['price'] as num).toDouble(),
        imageUrl = json['imageUrl'];
}
```
`main.dart`
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/pizza.dart';

...
class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  
  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    return myPizzas;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Nisa')),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
          );
        },
      ),
    );
  }
}

```

**Hasil**

![alt text](img/1-4.png)


**Soal 3**
1. Masukkan hasil capture layar ke laporan praktikum Anda.
2. Lakukan commit hasil jawaban Soal 2 dengan pesan "W13: Jawaban Soal 3"


## Langkah 23-26
`main.dart`
```dart
class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  
...

  Future<List<Pizza>> readJsonFile() async {
    ...
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }
  @override
```

`lib/model/pizza.dart`
```dart
class Pizza {
...
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
```
**Debug console**
![alt text](img/1-5.png)


---

# Praktikum 2: Handle kompatibilitas data JSON

## Langkah 1-9

`lib/model/pizza.dart`
```dart
class Pizza {
...

  factory Pizza.fromJsonSafe(Map<String, dynamic> json) {
    final id = int.tryParse(json['id']?.toString() ?? '') ?? 0;
    final pizzaName = json['pizzaName']?.toString() ?? '';
    final description = json['description']?.toString() ?? '';
    final price = double.tryParse(json['price']?.toString() ?? '') ?? 0.0;
    final imageUrl = json['imageUrl']?.toString() ?? '';

    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
```

**Hasil**

![alt text](img/2-1.png)

## Langkah 10

`lib/model/pizza.dart`
```dart
class Pizza {
...
  factory Pizza.fromJson(Map<String, dynamic> json) {
    final id = int.tryParse(json['id']?.toString() ?? '') ?? 0;
    final pizzaName = json['pizzaName'] != null
        ? json['pizzaName'].toString()
        : 'No name';
    final description = json['description'] != null
        ? json['description'].toString()
        : '';
    final price = double.tryParse(json['price']?.toString() ?? '') ?? 0.0;
    final imageUrl = json['imageUrl']?.toString() ?? '';

    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
```

**Hasil**

![alt text](img/2-2.png)

**Soal 4**
1. Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!
2. Lalu lakukan commit dengan pesan "W13: Jawaban Soal 4".

---

# Praktikum 3: Menangani error JSON

`pizza.dart`
```dart
const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDescription = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';
// small helpers to keep parsing logic DRY and consistent
String _nonEmptyString(dynamic v, String fallback) {
  final s = v?.toString() ?? '';
  return s.trim().isEmpty ? fallback : s;
}

int _parseInt(dynamic v) => int.tryParse(v?.toString() ?? '') ?? 0;

double _parseDouble(dynamic v) => double.tryParse(v?.toString() ?? '') ?? 0.0;

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: _parseInt(json[keyId]),
      pizzaName: _nonEmptyString(json[keyName], 'No name'),
      description: _nonEmptyString(json[keyDescription], 'No description'),
      price: _parseDouble(json[keyPrice]),
      imageUrl: json[keyImage]?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
```

**Hasil**

![alt text](img/3-1.png)

**Soal 5**
1. Jelaskan maksud kode lebih safe dan maintainable!

    Kode lebih aman dan mudah dipelihara karena memakai konstanta kunci JSON dan helper parsing yang memastikan tipe dan nilai default, sehingga mengurangi error runtime dan mempermudah refactor.

2. Capture hasil praktikum Anda dan lampirkan di README.
3. Lalu lakukan commit dengan pesan "W13: Jawaban Soal 5".

---

# Praktikum 4: Shared Preferences

## Langkah 1-12

![alt text](img/image1.png)

![alt text](img/image-1.png)

`main.dart`
```dart
class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  
  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
    readAndWritePreference();
  }
  
  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Nisa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened the app $appCounter times.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setInt('appCounter', 0);
                setState(() {
                  appCounter = 0;
                });
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Hasil**

![alt text](img/4-1.png)

## Langkah 13-14

`main.dart`
```dart
...
  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }
...
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
...
```

**Hasil**

![alt text](img/4.gif)

**Soal 6**
1. Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
2. Lalu lakukan commit dengan pesan "W13: Jawaban Soal 6

---

# Praktikum 5: Akses filesystem dengan path_provider

## Langkah 1-7

Path_provider

![alt text](img/image-2.png)

`main.dart`
```dart
class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  
  @override
  void initState() {
...
    readAndWritePreference();
    getPaths();
  }
...
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }
...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Nisa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Doc path: $documentsPath'),
            const SizedBox(height: 8),
            Text('Temp path: $temxpPath'),
            const SizedBox(height: 24),
            Text(
              'You have opened the app $appCounter times.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}

```

**Hasil**

![alt text](img/5.png)

**Soal 7**
1. Capture hasil praktikum Anda dan lampirkan di README.
2. Lalu lakukan commit dengan pesan "W13: Jawaban Soal 7".


---

# Praktikum 6: Akses filesystem dengan direktori

## Langkah 1-6
`main.dart`
```dart

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  @override
  void initState() {
    super.initState();
    getPaths().then((_) {
      // initialize file in documents directory and write initial content
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
  }
...
  Future<bool> writeFile() async {
    try {
      // replace with your full name and NIM
      await myFile.writeAsString('Khoirotun Nisa, 2341720057');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }
...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc path: $documentsPath'),
            Text('Temp path $tempPath'),
            const SizedBox(height: 8),
            ElevatedButton(
              child: const Text('Read File'),
              onPressed: () => readFile(),
            ),
            const SizedBox(height: 8),
            Text(fileText),
        ],
      ),
    );
```

**Hasil**

![alt text](img/6.gif)

**Soal 8**
Jelaskan maksud kode pada langkah 3 dan 7 !

Kode ini membuat fungsi asinkron bernama `writeFile()` yang bertujuan untuk menyimpan data (string) ke dalam sebuah file di sistem penyimpanan perangkat.
`await myFile.writeAsString(...):` adalah inti dari fungsi. Ia mengambil string yang sudah ditentukan ('Margherita, Capricciosa, Napoli') dan menulisnya ke objek myFile yang sudah diinisialisasi untuk menunjuk ke lokasi file tertentu. Karena operasi I/O (Input/Output) ke sistem file bersifat lambat (asinkron), maka digunakan await.
`try/catch:` Digunakan untuk penanganan kesalahan (error handling). Jika proses penulisan file berhasil, fungsi mengembalikan true. Jika terjadi kegagalan (misalnya, izin akses ditolak), fungsi akan menangkap kesalahan dan mengembalikan false.

---

# Praktikum 7: Menyimpan data dengan enkripsi/dekripsi

flutter secure storage

![alt text](img/7-1.png)

`main.dart`
```dart
class _MyHomePageState extends State<MyHomePage> {
...
  // Secure storage controller and variables
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
...
  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey);
    return secret ?? '';
  }

  @override
  void dispose() {
    pwdController.dispose();
    super.dispose();
  }
...
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc path: $documentsPath'),
          Text('Temp path $tempPath'),
          const SizedBox(height: 8),
          // Secure storage UI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: pwdController,
              decoration: const InputDecoration(labelText: 'Enter secret'),
              obscureText: true,
            ),
          ),
          ElevatedButton(
            child: const Text('Save Value'),
            onPressed: () {
              writeToSecureStorage();
            },
          ),
          ElevatedButton(
            child: const Text('Read Value'),
            onPressed: () {
              readFromSecureStorage().then((value) {
                setState(() {
                  myPass = value;
                });
              });
            },
          ),
          Text('Read secure: $myPass'),
          const SizedBox(height: 8),
          ElevatedButton(
            child: const Text('Read File'),
            onPressed: () => readFile(),
          ),
          const SizedBox(height: 8),
          Text(fileText),
        ],
      ),
    );
  }
```

**Hasil**

![alt text](img/7.gif)

**Soal 9**
1. Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
2. Lalu lakukan commit dengan pesan "W13: Jawaban Soal 9".