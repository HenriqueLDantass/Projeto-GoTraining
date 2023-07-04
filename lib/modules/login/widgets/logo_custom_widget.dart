import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/images/login_images.dart';

class LogoCustom extends StatelessWidget {
  const LogoCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: 230,
        height: 110,
        child: Image.asset(
          LoginImages.logo,
        ),
      ),
    );
  }
}
