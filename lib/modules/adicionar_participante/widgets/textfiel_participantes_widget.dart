import 'package:flutter/material.dart';
import 'package:gotraining/modules/solicitados/stores/dados_card_store.dart';
import 'package:provider/provider.dart';

class TextfielParticipantes extends StatelessWidget {
  final TextEditingController controlller;
  final String titulo;
  const TextfielParticipantes({
    super.key,
    required this.controlller,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SolicitadosStore>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(labelText: titulo),
        controller: controlller,
        onChanged: (value) {
          store.verificarCamposPreenchidos();
        },
      ),
    );
  }
}
