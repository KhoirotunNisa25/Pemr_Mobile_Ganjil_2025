import 'package:flutter/material.dart';
import 'pavlova_ratings.dart';
import 'pavlova_icons.dart';

class PavlovaLeftColumn extends StatelessWidget {
  const PavlovaLeftColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _TitleText(),
          _SubtitleText(),
          PavlovaRatings(),
          PavlovaIcons(),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Strawberry Pavlova',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        fontSize: 30,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
      'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18),
    );
  }
}