import 'package:flutter/material.dart';

class TextFielLocal extends StatelessWidget {
  final String title;
  final String titleTextFiel;
  final TextEditingController controller;

  const TextFielLocal({
    super.key,
    required this.title,
    required this.controller,
    required this.titleTextFiel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(hintText: titleTextFiel),
            controller: controller,
          ),
        )
      ],
    );
  }
}
