import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWdgets extends StatelessWidget {
  const AppBarWdgets({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kWidth,
        Container(
          height: 30,
          width: 30,
          color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
