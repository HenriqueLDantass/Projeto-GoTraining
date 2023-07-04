import 'package:flutter/material.dart';

class LogisticaScreen extends StatelessWidget {
  const LogisticaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Nenhum item de logística cadastrado.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
