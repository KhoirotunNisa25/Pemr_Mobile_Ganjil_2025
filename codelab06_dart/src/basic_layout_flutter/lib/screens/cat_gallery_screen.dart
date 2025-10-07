import 'package:flutter/material.dart';

class CatGalleryScreen extends StatelessWidget {
  const CatGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catImages = List.generate(8, (i) => 'assets/images/pic${i + 1}.png');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khoirotun Nisa Cat Gallery 🐾'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          // STACK: Header bergambar
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset('assets/images/pic1.png', fit: BoxFit.cover, height: 220, width: double.infinity),
              Container(
                width: double.infinity,
                color: Colors.black54,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Welcome to Nisa’s Cat World',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          // CONTAINER: Deskripsi
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: const Text(
              'Kucing adalah sahabat manusia yang lucu, lembut, dan penuh kasih. '
              'Di galeri ini, kamu bisa melihat beberapa momen menggemaskan dari para kucing kesayangan Nisa 🐾',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),

          // GRIDVIEW: Koleksi gambar kucing
          Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.extent(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: catImages.map((path) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.purple.shade100, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(path, fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            ),
          ),

          // CARD + LISTTILE: Info kontak
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.pets, color: Colors.purple),
                    title: Text('Khoirotun Nisa'),
                    subtitle: Text('Cat Lover & Photographer'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.purple),
                    title: Text('nisa.catlover@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.purple),
                    title: Text('+62 812-3456-7890'),
                  ),
                ],
              ),
            ),
          ),

          // FOOTER kecil
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                '© 2025 Khoirotun Nisa 🐾 All cats are loved.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
