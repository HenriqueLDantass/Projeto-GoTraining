import 'package:flutter/material.dart';

class SemInternet extends StatelessWidget {
  final String title;
  final Function()? onpress;
  const SemInternet({Key? key, required this.title, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: onpress,
          child: const Text('Tente novamente'),
        ),
      ],
    );
  }
}
