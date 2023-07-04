import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text(
                  "Cidade",
                ),
                hintText: "Sao Paulo"),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('Estado'),
            ),
          ),
        ),
      ],
    );
  }
}
