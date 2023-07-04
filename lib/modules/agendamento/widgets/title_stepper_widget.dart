import 'package:flutter/material.dart';

class TitleStepper extends StatelessWidget {
  final String title;
  const TitleStepper({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20),
    );
  }
}
