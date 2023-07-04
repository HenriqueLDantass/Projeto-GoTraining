import 'package:flutter/material.dart';

class ButtonKmWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const ButtonKmWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
