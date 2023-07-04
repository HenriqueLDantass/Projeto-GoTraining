import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset("assets/images/borda.png"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ola instrutor(a),",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "Felipe",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
