import 'package:flutter/material.dart';

class LinhaComBolinha extends StatelessWidget {
  const LinhaComBolinha({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            width: 20,
            height: 150,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          right: 8,
          top: 70,
          child: CircleAvatar(
            radius: 7,
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
