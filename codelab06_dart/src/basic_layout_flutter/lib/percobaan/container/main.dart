import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Tata Letak: Container')),
        body: SingleChildScrollView(
          // agar bisa di-scroll
          child: Center(child: _buildImageColumn()),
        ),
      ),
    );
  }
}

Widget _buildImageColumn() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: const BoxDecoration(color: Colors.black12),
    child: Column(children: [_buildImageRow(1), _buildImageRow(3)]),
  );
}

Widget _buildImageRow(int imageIndex) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _buildDecoratedImage(imageIndex),
    _buildDecoratedImage(imageIndex + 1),
  ],
);

Widget _buildDecoratedImage(int imageIndex) => Flexible(
  child: Container(
    width: 150, // ukuran gambar diseragamkan
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(width: 5, color: Colors.black38),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    margin: const EdgeInsets.all(8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/pic$imageIndex.png',
        fit: BoxFit.cover, // agar gambar tidak melar
      ),
    ),
  ),
);
