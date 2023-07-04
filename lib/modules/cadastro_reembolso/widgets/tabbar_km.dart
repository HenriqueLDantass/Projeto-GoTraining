import 'package:flutter/material.dart';

class TabbarKm extends StatelessWidget {
  const TabbarKm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("EMOJIS DE STATUS"),
            Text("7/7"),
          ],
        )
      ],
    );
  }
}
