import 'package:flutter/material.dart';

class RowDate extends StatelessWidget {
  final String title;
  final String secondTitle;
  final String example;
  const RowDate(
      {super.key,
      required this.title,
      required this.example,
      required this.secondTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text(
                  title,
                ),
                hintText: example),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text(secondTitle),
            ),
          ),
        ),
      ],
    );
  }
}
