import 'package:flutter/material.dart';
import 'package:gotraining/modules/local/stores/local_store.dart';
import 'package:gotraining/modules/local/widgets/textfiel_widget.dart';
import 'package:provider/provider.dart';

class TextFielApi extends StatelessWidget {
  const TextFielApi({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<LocalStore>(context);
    return Column(
      children: [
        TextFielLocal(
          controller: store.bairroController,
          title: 'Endereço:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.numeroController,
          title: 'Número:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.bairroController,
          title: 'Bairro:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.cidadeController,
          title: 'Cidade:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.estadoController,
          title: 'Estado:',
          titleTextFiel: '',
        ),
        TextFielLocal(
          controller: store.telefoneController,
          title: 'Telefone:',
          titleTextFiel: '+00 00 0000-0000',
        ),
        TextFielLocal(
          controller: store.celularController,
          title: 'Celular:',
          titleTextFiel: ' +00 00 0000-0000',
        ),
      ],
    );
  }
}
