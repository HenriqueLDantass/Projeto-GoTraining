import 'package:flutter/material.dart';

class TextFielPerfil extends StatelessWidget {
  final String title;
  final String example;

  const TextFielPerfil({super.key, required this.title, required this.example});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //passar controller
      decoration: InputDecoration(
          label: Text(
            title,
          ),
          hintText: example),
    );
  }
}
