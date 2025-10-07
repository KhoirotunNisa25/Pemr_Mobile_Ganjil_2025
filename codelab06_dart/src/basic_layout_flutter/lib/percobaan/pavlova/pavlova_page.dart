import 'package:flutter/material.dart';
import 'pavlova_image.dart';
import 'pavlova_left_column.dart';

class PavlovaPage extends StatelessWidget {
  const PavlovaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter layout demo')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(width: 440, child: PavlovaLeftColumn()),
                PavlovaMainImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}