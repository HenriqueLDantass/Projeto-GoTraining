import 'package:flutter/material.dart';
import 'package:gotraining/modules/agendamento/stores/agendamento_store.dart';
import 'package:provider/provider.dart';

class SteperLocal extends StatelessWidget {
  const SteperLocal({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AgendamentoStore>(context);
    return Column(
      children: [
        Form(
          key: store.globalKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, preencha este campo';
              }
              return null;
            },
            controller: store.lojaController,
            decoration: const InputDecoration(
              label: Text("Loja"),
            ),
          ),
        ),
      ],
    );
  }
}
