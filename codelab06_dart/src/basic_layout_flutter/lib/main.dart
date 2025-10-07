import 'package:flutter/material.dart';
import 'screens/cat_gallery_screen.dart';

void main() {
  runApp(const CatGalleryApp());
}

class CatGalleryApp extends StatelessWidget {
  const CatGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khoirotun Nisa - Cat Gallery',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const CatGalleryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
