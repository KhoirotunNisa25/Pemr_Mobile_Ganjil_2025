import 'package:flutter/material.dart';

class PavlovaMainImage extends StatelessWidget {
  const PavlovaMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pavlova.png',
      fit: BoxFit.cover,
    );
  }
}