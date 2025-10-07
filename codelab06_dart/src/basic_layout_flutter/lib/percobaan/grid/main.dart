import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Tata Letak: GridView')),
        body: _buildGrid(),
      ),
    );
  }
}

Widget _buildGrid() => GridView.extent(
  maxCrossAxisExtent: 150,
  padding: const EdgeInsets.all(4),
  mainAxisSpacing: 4,
  crossAxisSpacing: 4,
  children: _buildGridTileList(8),
);

List<Widget> _buildGridTileList(int count) =>
    List.generate(count, (i) => Image.asset('assets/images/pic${i+1}.png'));
