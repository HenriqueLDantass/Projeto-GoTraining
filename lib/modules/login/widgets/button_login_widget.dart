import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // ignore: sort_child_properties_last
      child: const Text(
        "Entrar",
        style: TextStyle(fontSize: 20),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorsApp.colorItem),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}
