import 'package:flutter/material.dart';

class ComentarioScreen extends StatelessWidget {
  final String comentario;
  const ComentarioScreen({super.key, required this.comentario});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: comentario == ""
              ? const Text(
                  "Nenhum comentário.",
                  style: TextStyle(fontSize: 20),
                )
              : Text(
                  comentario,
                  style: const TextStyle(fontSize: 20),
                ),
        ));
  }
}
