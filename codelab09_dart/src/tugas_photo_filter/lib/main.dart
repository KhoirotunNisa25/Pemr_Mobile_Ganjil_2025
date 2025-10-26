import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'widget/photo_filter_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Filter Camera 2341720057',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const CameraHomePage(),
    );
  }
}

class CameraHomePage extends StatefulWidget {
  const CameraHomePage({super.key});

  @override
  State<CameraHomePage> createState() => _CameraHomePageState();
}

class _CameraHomePageState extends State<CameraHomePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PhotoFilterCarousel(imagePath: photo.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ambil Foto & Filter')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _takePhoto,
          icon: const Icon(Icons.camera_alt),
          label: const Text('Ambil Foto'),
        ),
      ),
    );
  }
}
