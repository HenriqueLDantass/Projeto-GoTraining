import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:gotraining/modules/login/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Iniciar o Timer
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsApp.colorItem, // Definir a cor de fundo
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Image.asset(
              'assets/images/training.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
