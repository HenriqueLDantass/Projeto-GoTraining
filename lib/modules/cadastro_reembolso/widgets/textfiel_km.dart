import 'package:flutter/material.dart';

class TextFielKm extends StatelessWidget {
  final String title;
  final String description;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const TextFielKm(
      {super.key,
      required this.title,
      required this.description,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(title),
          hintText: description,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
