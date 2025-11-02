# Praktikum Codelab_10: Dasar State Manajemen

| Absen | NIM        | Nama            |
|-------|------------|-----------------|
| 18    | 2341720057 | Khoirotun Nisa' |

---

# Praktikum 1: Dasar State dengan Model-View

## Langkah 1: Buat Project Baru
![Langkah](./img/1-1.png)

## Langkah 2: Membuat model `lib/models/task.dart`
```dart
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```

## Langkah 3: Buat file `lib/models/plan.dart`
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}
```

## Langkah 4: `lib/models/data_layer.dart`
```dart
export 'plan.dart';
export 'task.dart';
```

## Langkah 5: `lib/main.dart`
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(),
    );
  }
}
```

## Langkah 6-9: `lib/views/plan_screen.dart`
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  // Langkah 7
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)..add(const Task()),
          );
        });
      },
    );
  }

  // Langkah 8
  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
    );
  }

  // Langkah 9
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti ‘Namaku' dengan Nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plan Nisa(iir)')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }
}

```

## Hasil:
![Langkah](./img/1-2.png)

## Langkah 10: Tambah Scroll Controller
pada `lib/views/plan_screen.dart`
![Langkah](./img/1-3.png)

## Langkah 11: Tambah Scroll Listener
pada `lib/views/plan_screen.dart`
![Langkah](./img/1-4.png)

## Langkah 12: Tambah controller dan keyboard behavior
pada `lib/views/plan_screen.dart`
![Langkah](./img/1-5.png)

## Langkah 13: Terakhir, tambah method dispose()
Terakhir, tambahkan method dispose() berguna ketika widget sudah tidak digunakan lagi.
pada `lib/views/plan_screen.dart`
![Langkah](./img/1-6.png)

## Hasil:
![Langkah](./img/1.gif)


# Tugas 1
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.

2. **Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?**
    Langkah 4 membuat file `data_layer.dart` untuk mengekspor semua model agar proses impor lebih ringkas. Tujuannya memudahkan pengelolaan kode dan menjaga struktur proyek tetap rapi saat aplikasi berkembang.

3. **Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?**
    Variabel `plan` digunakan untuk menyimpan dan mengatur daftar tugas yang sedang aktif. Dideklarasikan sebagai const karena objek awalnya bersifat tetap, dan setiap perubahan dilakukan dengan membuat instance baru melalui `setState()`, sesuai prinsip `immutable state` di Flutter.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
    Pada langkah 9 dibuat tampilan daftar tugas menggunakan `ListTile` yang berisi `Checkbox` dan `TextFormField`. Pengguna dapat menambah, mengedit, dan menandai tugas selesai secara interaktif. Perubahan data langsung diperbarui ke tampilan melalui setState().
    ![Langkah](./img/1.gif)

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke dosen yang telah disepakati 
    `initState()` digunakan untuk inisialisasi awal seperti membuat `ScrollController` dan menambahkan listener saat halaman pertama kali dibuka. `dispose()` berfungsi membersihkan resource (misalnya controller) saat widget dihapus agar tidak terjadi memory leak.


---


# Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier

## Langkah 1: `lib/provider/plan_provider.dart`
```dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required Widget child, required
   ValueNotifier<Plan> notifier})
  : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```

## Langkah 2: `main.dart`
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './provider/plan_provider.dart';
import './models/data_layer.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}
```

## Langkah 3: `lib/models/plan.dart`
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
```

## Langkah 4-9: `lib/views/plan_scree.dart`
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // Plan plan = const Plan();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override // Langkah 13
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Langkah 7
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
        );
      },
    );
  }

  // Langkah 8
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController, // Langkah 12
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  // Langkah 9
  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              ),
          );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(description: text, complete: task.complete),
          );
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Nisa')),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)),
              SafeArea(child: Text(plan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }
}
```

## Hasil:
  ![Langkah](./img/2.gif)

## Tugas 2: Inhereted Widget
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. **Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan `InheritedNotifier`?**
  `InheritedWidget` adalah widget di Flutter yang memungkinkan data diturunkan ke widget turunannya tanpa harus melewati parameter secara langsung. Pada langkah 1 digunakan `InheritedNotifier` karena selain mewariskan data, ia juga bisa mendengarkan perubahan (notifikasi) dari `ChangeNotifier`. Dengan begitu, widget lain akan otomatis rebuild saat data berubah lebih efisien dibanding `InheritedWidget` biasa.
3. **Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?**
  Method pada langkah 3 berfungsi untuk mengambil data dari context menggunakan of(context) agar widget anak bisa mengakses state dari widget induk (`InheritedNotifier`) tanpa perlu meneruskannya manual. Ini dilakukan supaya manajemen state lebih rapi dan mudah dipelihara saat aplikasi tumbuh.
4. **Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!**
  ![Langkah](./img/1.gif)
  Pada langkah 9, hasilnya menampilkan daftar rencana atau tugas yang bisa berubah secara *real-time* saat pengguna menambah, menghapus, atau menandai progresnya. GIF menunjukkan bagaimana perubahan di data langsung memperbarui tampilan karena terhubung melalui mekanisme `InheritedNotifier`. Artinya, data dan UI sinkron otomatis tanpa perlu pemanggilan ulang manual.
