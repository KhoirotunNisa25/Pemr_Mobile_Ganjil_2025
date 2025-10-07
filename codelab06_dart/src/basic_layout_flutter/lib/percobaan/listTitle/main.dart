import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Widget Tata Letak: ListTile')),
        body: ListView(
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pic1.png'),
              ),
              title: Text('Mia B'),
              subtitle: Text('Flutter Developer'),
              trailing: Icon(Icons.favorite, color: Colors.red),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pic2.png'),
              ),
              title: Text('Liam P'),
              subtitle: Text('UI Designer'),
              trailing: Icon(Icons.star, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
