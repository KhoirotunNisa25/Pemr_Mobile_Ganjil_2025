import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Tata Letak: Card')),
        body: Center(child: _buildCard()),
      ),
    );
  }
}

Widget _buildCard() {
  return SizedBox(
    height: 340, // diperbesar sedikit agar muat gambar
    width: 300,
    child: Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias, //agar gambar ikut terpotong sesuai border card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tambahkan gambar di bagian atas card
          Image.asset(
            'assets/images/street.png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const ListTile(
            title: Text(
              '1625 Main Street',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(Icons.restaurant_menu, color: Colors.blue),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              '(408) 555-1212',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(Icons.contact_phone, color: Colors.blue),
          ),
          const ListTile(
            title: Text('costa@example.com'),
            leading: Icon(Icons.contact_mail, color: Colors.blue),
          ),
        ],
      ),
    ),
  );
}
