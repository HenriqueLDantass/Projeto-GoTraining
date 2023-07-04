import 'package:flutter/material.dart';

class CardImageName extends StatelessWidget {
  const CardImageName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/images/batman.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Bruce Wayne",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
