import 'package:flutter/material.dart';

class PavlovaIcons extends StatelessWidget {
  const PavlovaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    return DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconColumn(Icons.kitchen, 'PREP:', '25 min'),
            _buildIconColumn(Icons.timer, 'COOK:', '1 hr'),
            _buildIconColumn(Icons.restaurant, 'FEEDS:', '4-6'),
          ],
        ),
      ),
    );
  }

  Column _buildIconColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[500]),
        Text(label),
        Text(value),
      ],
    );
  }
}