# Praktikum Codelab_14: RESTful API

| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |

---

# Praktikum 1: Membuat layanan Mock API

## Langkah 1: Wiremock
![alt text](img/image.png)

## `main.dart`
```dart
class _MyHomePageState extends State<MyHomePage> {
...
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }
...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON NISA')),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            // Show the real error message to help debugging
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(snapshot.data![position].pizzaName),
                subtitle: Text(
                  snapshot.data![position].description +
                      ' - € ' +
                      snapshot.data![position].price.toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

```
### `httphelper.dart`
```dart
import 'dart:io'; 
import 'dart:async';
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'package:flutter/services.dart' show rootBundle;
import 'model/pizza.dart'; 

class HttpHelper {
  final String authority = '02z2g.mocklab.io';
  final String path = 'pizzalist';

  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    try {
      // set a reasonable timeout so the app can fall back quickly
      final http.Response result = await http.get(url).timeout(const Duration(seconds: 10));
      if (result.statusCode == HttpStatus.ok) {
        final dynamic jsonResponse = json.decode(result.body);
        List<dynamic> listData;
        if (jsonResponse is List) {
          listData = jsonResponse;
        } else if (jsonResponse is Map) {
          // try to find the first value that is a List (common wrapper formats)
          final firstList = jsonResponse.values.firstWhere(
              (v) => v is List, orElse: () => null);
          if (firstList != null && firstList is List) {
            listData = firstList;
          } else {
            throw Exception('Unexpected JSON structure: Map with no list inside');
          }
        } else {
          throw Exception('Unexpected JSON type: ${jsonResponse.runtimeType}');
        }

        List<Pizza> pizzas =
            listData.map<Pizza>((i) => Pizza.fromJson(i)).toList();
        return pizzas;
      } else {
        throw Exception('HTTP ${result.statusCode}: ${result.reasonPhrase}');
      }
    } catch (e) {
      // If network fails (timeout, socket), try to load bundled asset as fallback
      try {
        final String asset = await rootBundle.loadString('assets/pizzalist.json');
        final dynamic jsonResponse = json.decode(asset);
        List<dynamic> listData;
        if (jsonResponse is List) {
          listData = jsonResponse;
        } else if (jsonResponse is Map) {
          final firstList = jsonResponse.values.firstWhere((v) => v is List, orElse: () => null);
          if (firstList != null && firstList is List) {
            listData = firstList;
          } else {
            throw Exception('Fallback JSON structure not usable');
          }
        } else {
          throw Exception('Fallback JSON type not usable');
        }
        return listData.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      } catch (assetError) {
        // both network and fallback failed — propagate clear message
        throw Exception('Failed to load pizzas (network: $e, fallback: $assetError)');
      }
    }
  }
}
```

### Hasil

![alt text](img/1.jpg)

### Soal 1
1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
2. Gantilah warna tema aplikasi sesuai kesukaan Anda.
3. Capture hasil aplikasi Anda, lalu masukkan ke laporan di README dan lakukancommit hasil jawaban Soal 1 dengan pesan "W14: Jawaban Soal 1"

